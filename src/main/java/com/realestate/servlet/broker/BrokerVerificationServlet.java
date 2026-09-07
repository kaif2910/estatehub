package com.realestate.servlet.broker;

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
    maxRequestSize = 1024 * 1024 * 2
)
public class BrokerVerificationServlet extends HttpServlet {

    private final VerificationService verificationService = new VerificationService();
    private static final String UPLOAD_DIR = "C:\\Users\\admin\\OneDrive\\Desktop\\sem1\\EstateHub\\uploads";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("currentUser") : null;
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }

        VerificationRequest req = verificationService.getStatusForUser(currentUser.getUserId());
        request.setAttribute("verification", req);
        request.getRequestDispatcher("/views/verification.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("currentUser") : null;
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }

        String businessName = request.getParameter("businessName");
        String licenseNumber = request.getParameter("licenseNumber");
        String taxId = request.getParameter("taxId");
        String docTypeStr = request.getParameter("documentType");

        Part filePart = request.getPart("certificate");
        if (filePart == null || filePart.getSize() == 0) {
            session.setAttribute("errorMessage", "Please upload a certificate document.");
            response.sendRedirect(request.getContextPath() + "/broker/verification");
            return;
        }

        // Limit to 25 KB
        if (filePart.getSize() > 25 * 1024) {
            session.setAttribute("errorMessage", "Certificate document size must not exceed 25 KB.");
            response.sendRedirect(request.getContextPath() + "/broker/verification");
            return;
        }

        String fileName = System.currentTimeMillis() + "_" + getSubmittedFileName(filePart);
        String savePath = UPLOAD_DIR + File.separator + fileName;
        filePart.write(savePath);

        List<VerificationDocument> docs = new ArrayList<>();
        VerificationDocument doc = new VerificationDocument();
        doc.setDocumentType(docTypeStr != null ? VerificationDocument.DocumentType.valueOf(docTypeStr) : VerificationDocument.DocumentType.BROKER_LICENSE);
        doc.setFilePath(fileName);
        doc.setOriginalFileName(getSubmittedFileName(filePart));
        doc.setFileSizeKb((int) (filePart.getSize() / 1024));
        docs.add(doc);

        int reqId = verificationService.submitVerificationRequest(currentUser.getUserId(), businessName, licenseNumber, taxId, docs);
        if (reqId > 0) {
            session.setAttribute("successMessage", "Broker verification documents submitted. Awaiting Administrator approval.");
        } else {
            session.setAttribute("errorMessage", "Failed to submit verification documents.");
        }

        response.sendRedirect(request.getContextPath() + "/broker/verification");
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
