package com.realestate.util;

import jakarta.servlet.http.Part;
import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import io.github.cdimascio.dotenv.Dotenv;

public class CloudStorageService {
    private static final Logger LOGGER = Logger.getLogger(CloudStorageService.class.getName());

    private static String cloudName;
    private static String uploadPreset;

    static {
        Dotenv dotenv = null;
        try {
            dotenv = Dotenv.configure().ignoreIfMissing().load();
        } catch (Exception e) {}

        cloudName = getEnvValue("CLOUDINARY_CLOUD_NAME", "CLOUDINARY_NAME", dotenv);
        uploadPreset = getEnvValue("CLOUDINARY_UPLOAD_PRESET", "CLOUDINARY_PRESET", dotenv);
    }

    private static String getEnvValue(String key1, String key2, Dotenv dotenv) {
        String val = System.getenv(key1);
        if (val == null && key2 != null) val = System.getenv(key2);
        if (val == null && dotenv != null) {
            val = dotenv.get(key1);
            if (val == null && key2 != null) val = dotenv.get(key2);
        }
        if (val == null) val = System.getProperty(key1);
        return val;
    }

    /**
     * Uploads a servlet Part file to Cloudinary if credentials are configured,
     * otherwise safely falls back to local uploads directory.
     * 
     * @return Permanent HTTPS URL (e.g., https://res.cloudinary.com/...) or relative local path (/uploads/...)
     */
    public static String uploadFile(Part part, String localSaveDir, String contextPath) {
        if (part == null || part.getSize() == 0) {
            return null;
        }

        // 1. Try Cloudinary HTTP REST upload if configured
        if (cloudName != null && !cloudName.trim().isEmpty() && uploadPreset != null && !uploadPreset.trim().isEmpty()) {
            try {
                String cloudinaryUrl = uploadToCloudinary(part, cloudName.trim(), uploadPreset.trim());
                if (cloudinaryUrl != null && cloudinaryUrl.startsWith("http")) {
                    LOGGER.info("Successfully uploaded image to Cloudinary: " + cloudinaryUrl);
                    return cloudinaryUrl;
                }
            } catch (Exception e) {
                LOGGER.log(Level.WARNING, "Cloudinary upload failed, using local fallback", e);
            }
        }

        // 2. Safe Fallback: Save to local directory
        try {
            String fileName = System.currentTimeMillis() + "_" + getSubmittedFileName(part);
            File dir = new File(localSaveDir);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            String savePath = localSaveDir + File.separator + fileName;
            part.write(savePath);
            return contextPath + "/uploads/" + fileName;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Failed to save file locally", e);
            return null;
        }
    }

    private static String uploadToCloudinary(Part part, String cloud, String preset) throws Exception {
        String boundary = "---CloudinaryBoundary" + System.currentTimeMillis();
        URL url = new URL("https://api.cloudinary.com/v1_1/" + cloud + "/image/upload");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setDoOutput(true);
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
        conn.setConnectTimeout(10000);
        conn.setReadTimeout(15000);

        try (OutputStream output = conn.getOutputStream();
             PrintWriter writer = new PrintWriter(new OutputStreamWriter(output, StandardCharsets.UTF_8), true)) {

            // upload_preset field
            writer.append("--").append(boundary).append("\r\n");
            writer.append("Content-Disposition: form-data; name=\"upload_preset\"\r\n\r\n");
            writer.append(preset).append("\r\n");
            writer.flush();

            // file field
            String fileName = getSubmittedFileName(part);
            writer.append("--").append(boundary).append("\r\n");
            writer.append("Content-Disposition: form-data; name=\"file\"; filename=\"").append(fileName).append("\"\r\n");
            writer.append("Content-Type: ").append(part.getContentType() != null ? part.getContentType() : "image/jpeg").append("\r\n\r\n");
            writer.flush();

            try (InputStream input = part.getInputStream()) {
                byte[] buffer = new byte[8192];
                int bytesRead;
                while ((bytesRead = input.read(buffer)) != -1) {
                    output.write(buffer, 0, bytesRead);
                }
                output.flush();
            }

            writer.append("\r\n");
            writer.append("--").append(boundary).append("--\r\n");
            writer.flush();
        }

        int responseCode = conn.getResponseCode();
        if (responseCode == 200) {
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8))) {
                StringBuilder sb = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    sb.append(line);
                }
                JsonObject json = JsonParser.parseString(sb.toString()).getAsJsonObject();
                if (json.has("secure_url")) {
                    return json.get("secure_url").getAsString();
                } else if (json.has("url")) {
                    return json.get("url").getAsString();
                }
            }
        } else {
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getErrorStream(), StandardCharsets.UTF_8))) {
                StringBuilder sb = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    sb.append(line);
                }
                LOGGER.warning("Cloudinary upload error (HTTP " + responseCode + "): " + sb.toString());
            }
        }
        return null;
    }

    private static String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return "upload.jpg";
    }
}
