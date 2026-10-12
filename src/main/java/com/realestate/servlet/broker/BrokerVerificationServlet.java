package com.realestate.servlet.broker;

import com.realestate.dao.UserDAO;
import com.realestate.model.SessionUser;
import com.realestate.model.User;
import com.realestate.model.VerificationDocument;
import com.realestate.model.VerificationRequest;
import com.realestate.service.VerificationService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/broker/verification")
@MultipartConfig(
    fileSizeThreshold = 1024 * 10,
    maxFileSize = 1024 * 1024 * 2,
    maxRequestSize = 1024 * 1024 * 2 + 64 * 1024
)
public class BrokerVerificationServlet extends HttpServlet {

    private final VerificationService verificationService = new VerificationService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        SessionUser currentUser = (session != null) ? (SessionUser) session.getAttribute("currentUser") : null;
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }

        refreshSessionUser(session, currentUser.getUserId());
        VerificationRequest req = verificationService.getStatusForUser(currentUser.getUserId());
        request.setAttribute("verification", req);
        request.getRequestDispatcher("/views/verification.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        SessionUser currentUser = (session != null) ? (SessionUser) session.getAttribute("currentUser") : null;
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }

        VerificationRequest existing = verificationService.getStatusForUser(currentUser.getUserId());
        if (existing != null && existing.getStatus() != VerificationRequest.Status.REJECTED) {
            session.setAttribute("errorMessage", "Your verification request is already " + existing.getStatus().name().toLowerCase() + ".");
            response.sendRedirect(request.getContextPath() + "/broker/verification");
            return;
        }
        Part filePart;
        try {
            filePart = request.getPart("certificate");
        } catch (IllegalStateException | ServletException e) {
            session.setAttribute("errorMessage", "Please upload a PDF or image no larger than 2 MB.");
            response.sendRedirect(request.getContextPath() + "/broker/verification");
            return;
        }
        String businessName = request.getParameter("businessName");
        String licenseNumber = request.getParameter("licenseNumber");
        String taxId = request.getParameter("taxId");
        String docTypeStr = request.getParameter("documentType");
        if (businessName == null || businessName.isBlank() || licenseNumber == null || licenseNumber.isBlank()
                || taxId == null || taxId.isBlank()) {
            session.setAttribute("errorMessage", "Business name, license number and tax ID are required.");
            response.sendRedirect(request.getContextPath() + "/broker/verification");
            return;
        }
        VerificationDocument.DocumentType docType;
        try {
            docType = VerificationDocument.DocumentType.valueOf(docTypeStr == null ? "BROKER_LICENSE" : docTypeStr);
        } catch (IllegalArgumentException e) {
            session.setAttribute("errorMessage", "Please select a supported document type.");
            response.sendRedirect(request.getContextPath() + "/broker/verification");
            return;
        }
        if (filePart == null || filePart.getSize() == 0) {
            session.setAttribute("errorMessage", "Please upload a certificate document.");
            response.sendRedirect(request.getContextPath() + "/broker/verification");
            return;
        }

        // Limit to 2 MB
        if (filePart.getSize() > 2 * 1024 * 1024) {
            session.setAttribute("errorMessage", "Certificate document size must not exceed 2 MB.");
            response.sendRedirect(request.getContextPath() + "/broker/verification");
            return;
        }

        String originalFileName = getSubmittedFileName(filePart).replace('\\', '/');
        originalFileName = originalFileName.substring(originalFileName.lastIndexOf('/') + 1);
        if (!originalFileName.toLowerCase(java.util.Locale.ROOT).matches(".*\\.(pdf|jpg|jpeg|png)$")) {
            session.setAttribute("errorMessage", "Certificate must be a PDF, JPG or PNG file.");
            response.sendRedirect(request.getContextPath() + "/broker/verification");
            return;
        }
        String fileName = System.currentTimeMillis() + "_" + originalFileName.replaceAll("[^a-zA-Z0-9._-]", "_");
        String uploadDir = getServletContext().getRealPath("/uploads");
        if (uploadDir == null) {
            uploadDir = System.getProperty("java.io.tmpdir") + File.separator + "estatehub-uploads";
        }
        File dir = new File(uploadDir);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        String savePath = uploadDir + File.separator + fileName;
        filePart.write(savePath);

        List<VerificationDocument> docs = new ArrayList<>();
        VerificationDocument doc = new VerificationDocument();
        doc.setDocumentType(docType);
        doc.setFilePath(fileName);
        doc.setOriginalFileName(originalFileName);
        doc.setFileSizeKb((int) (filePart.getSize() / 1024));
        docs.add(doc);

        int reqId = verificationService.submitVerificationRequest(currentUser.getUserId(), businessName, licenseNumber, taxId, docs);
        if (reqId > 0) {
            refreshSessionUser(session, currentUser.getUserId());
            session.setAttribute("successMessage", "Broker verification documents submitted. Awaiting Administrator approval.");
        } else {
            session.setAttribute("errorMessage", "Failed to submit verification documents.");
        }

        response.sendRedirect(request.getContextPath() + "/broker/verification");
    }

    private void refreshSessionUser(HttpSession session, int userId) {
        User latestUser = new UserDAO().findById(userId);
        if (latestUser != null) {
            SessionUser refreshed = new SessionUser(latestUser);
            session.setAttribute("currentUser", refreshed);
            session.setAttribute("verificationStatus", refreshed.getVerificationStatus());
        }
    }

    private String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return "unknown";
    }
}
