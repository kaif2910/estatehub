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

        List<VerificationRequest> requests = verificationService.getAllRequests(statusFilter);
        request.setAttribute("requests", requests);
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
        int requestId = Integer.parseInt(request.getParameter("requestId"));
        String adminNotes = request.getParameter("adminNotes");

        boolean approved = "approve".equalsIgnoreCase(action);
        verificationService.reviewRequest(requestId, approved, adminNotes, adminUser.getUserId());

        if (session != null) {
            session.setAttribute("successMessage", approved ?
                    "Verification APPROVED! The seller/broker has been awarded the Verified Provider Badge." :
                    "Verification REJECTED. Rejection reason has been recorded and communicated.");
        }

        response.sendRedirect(request.getContextPath() + "/admin/verification?status=" + (approved ? "APPROVED" : "REJECTED"));
    }
}
