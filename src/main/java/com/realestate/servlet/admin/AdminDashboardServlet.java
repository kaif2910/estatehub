package com.realestate.servlet.admin;

import com.realestate.dao.InquiryDAO;
import com.realestate.dao.PropertyDAO;
import com.realestate.dao.UserDAO;
import com.realestate.dao.VerificationDAO;
import com.realestate.model.Inquiry;
import com.realestate.model.Property;
import com.realestate.model.User;
import com.realestate.model.VerificationRequest;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAO();
    private final PropertyDAO propertyDAO = new PropertyDAO();
    private final VerificationDAO verificationDAO = new VerificationDAO();
    private final InquiryDAO inquiryDAO = new InquiryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<User> users = userDAO.findAllUsers(null, null, null);
        List<Property> properties = propertyDAO.findAllAdmin(null, null);
        List<VerificationRequest> verifications = verificationDAO.findAll("PENDING");
        List<Inquiry> inquiries = inquiryDAO.findAllAdmin();

        long totalUsers = users.size();
        long customers = users.stream().filter(u -> u.getRole() == User.Role.CUSTOMER).count();
        long sellers = users.stream().filter(u -> u.getRole() == User.Role.SELLER).count();
        long brokers = users.stream().filter(u -> u.getRole() == User.Role.BROKER).count();
        long verifiedProviders = users.stream().filter(u -> u.getVerificationStatus() == User.VerificationStatus.VERIFIED && (u.getRole() == User.Role.SELLER || u.getRole() == User.Role.BROKER)).count();

        long totalProperties = properties.size();
        long pendingProperties = properties.stream().filter(p -> p.getVerificationStatus() == Property.VerificationStatus.PENDING).count();
        long verifiedProperties = properties.stream().filter(p -> p.getVerificationStatus() == Property.VerificationStatus.VERIFIED).count();

        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("customers", customers);
        request.setAttribute("sellers", sellers);
        request.setAttribute("brokers", brokers);
        request.setAttribute("verifiedProviders", verifiedProviders);
        request.setAttribute("totalProperties", totalProperties);
        request.setAttribute("pendingProperties", pendingProperties);
        request.setAttribute("verifiedProperties", verifiedProperties);
        request.setAttribute("totalInquiries", inquiries.size());
        request.setAttribute("pendingVerifications", verifications);
        request.setAttribute("recentProperties", properties.subList(0, Math.min(6, properties.size())));

        request.getRequestDispatcher("/views/admin-dashboard.jsp").forward(request, response);
    }
}
