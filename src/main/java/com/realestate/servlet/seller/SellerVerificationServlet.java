package com.realestate.servlet.seller;

import com.realestate.dao.VerificationDAO;
import com.realestate.model.SessionUser;
import com.realestate.model.User;
import com.realestate.model.VerificationDocument;
import com.realestate.model.VerificationRequest;
import com.realestate.service.VerificationService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/seller/verification")
public class SellerVerificationServlet extends HttpServlet {

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

        String businessName = request.getParameter("businessName");
        String licenseNumber = request.getParameter("licenseNumber");
        String taxId = request.getParameter("taxId");
        String docTypeStr = request.getParameter("documentType");
        String docPath = request.getParameter("documentPath");

        List<VerificationDocument> docs = new ArrayList<>();
        VerificationDocument doc = new VerificationDocument();
        doc.setDocumentType(docTypeStr != null ? VerificationDocument.DocumentType.valueOf(docTypeStr) : VerificationDocument.DocumentType.GOVT_ID);
        doc.setFilePath(docPath != null && !docPath.isEmpty() ? docPath : "uploads/verification/" + currentUser.getUserId() + "_id_document.pdf");
        doc.setOriginalFileName("verification_credential.pdf");
        doc.setFileSizeKb(1240);
        docs.add(doc);

        int reqId = verificationService.submitVerificationRequest(currentUser.getUserId(), businessName, licenseNumber, taxId, docs);
        if (reqId > 0) {
            session.setAttribute("successMessage", "Verification request submitted successfully. Our compliance team will review your credentials within 24 hours.");
        } else {
            session.setAttribute("errorMessage", "Failed to submit verification request. Please try again.");
        }

        response.sendRedirect(request.getContextPath() + "/seller/verification");
    }
}
