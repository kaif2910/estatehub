package com.realestate.servlet.admin;

import com.realestate.dao.PropertyDAO;
import com.realestate.model.Property;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/properties")
public class AdminPropertyServlet extends HttpServlet {

    private final PropertyDAO propertyDAO = new PropertyDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String verificationFilter = request.getParameter("verification");
        String statusFilter = request.getParameter("status");

        if (verificationFilter == null) verificationFilter = "PENDING";

        List<Property> properties = propertyDAO.findAllAdmin(verificationFilter, statusFilter);
        request.setAttribute("properties", properties);
        request.setAttribute("selectedVerification", verificationFilter);
        request.setAttribute("selectedStatus", statusFilter);

        request.getRequestDispatcher("/views/admin-properties.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String action = request.getParameter("action");
        int propertyId = Integer.parseInt(request.getParameter("propertyId"));
        String reason = request.getParameter("rejectionReason");

        if ("approve".equalsIgnoreCase(action)) {
            propertyDAO.updateVerificationStatus(propertyId, Property.VerificationStatus.VERIFIED, null);
            if (session != null) session.setAttribute("successMessage", "Property APPROVED! It is now live on the public marketplace.");
        } else if ("reject".equalsIgnoreCase(action)) {
            propertyDAO.updateVerificationStatus(propertyId, Property.VerificationStatus.REJECTED, reason);
            if (session != null) session.setAttribute("successMessage", "Property REJECTED. Rejection reason recorded.");
        }

        response.sendRedirect(request.getContextPath() + "/admin/properties?verification=" + ("approve".equalsIgnoreCase(action) ? "VERIFIED" : "REJECTED"));
    }
}
