package com.realestate.servlet.admin;

import com.realestate.model.SessionUser;
import com.realestate.model.User;
import com.realestate.model.VerificationRequest;
import com.realestate.service.VerificationService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/verification")
public class AdminVerificationServlet extends HttpServlet {

    private final VerificationService verificationService = new VerificationService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String statusFilter = request.getParameter("status");
        if (statusFilter == null || statusFilter.isEmpty()) {
            statusFilter = "PENDING";
        }
        if (!java.util.Set.of("PENDING", "APPROVED", "REJECTED", "ALL").contains(statusFilter)) {
            statusFilter = "PENDING";
        }

        List<VerificationRequest> requests = verificationService.getAllRequests(statusFilter);
        request.setAttribute("verificationRequests", requests);
        request.setAttribute("selectedStatus", statusFilter);

        request.getRequestDispatcher("/views/admin-verification.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        SessionUser adminUser = (session != null) ? (SessionUser) session.getAttribute("currentUser") : null;
        if (adminUser == null) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }

        String action = request.getParameter("action");
        if (!"approve".equalsIgnoreCase(action) && !"reject".equalsIgnoreCase(action)) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid review action.");
            return;
        }
        int requestId;
        try {
            requestId = Integer.parseInt(request.getParameter("requestId"));
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid verification request.");
            return;
        }
        String adminNotes = request.getParameter("adminNotes");

        boolean approved = "approve".equalsIgnoreCase(action);
        boolean reviewed = verificationService.reviewRequest(requestId, approved, adminNotes, adminUser.getUserId());
        if (!reviewed) {
            session.setAttribute("errorMessage", "Could not save the verification review. Please try again.");
            response.sendRedirect(request.getContextPath() + "/admin/verification");
            return;
        }

        if (session != null) {
            session.setAttribute("successMessage", approved ?
                    "Verification APPROVED! The seller/broker has been awarded the Verified Provider Badge." :
                    "Verification REJECTED. Rejection reason has been recorded and communicated.");
        }

        response.sendRedirect(request.getContextPath() + "/admin/verification?status=" + (approved ? "APPROVED" : "REJECTED"));
    }
}
