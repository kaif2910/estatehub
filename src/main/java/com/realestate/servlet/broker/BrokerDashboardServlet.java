package com.realestate.servlet.broker;

import com.realestate.dao.InquiryDAO;
import com.realestate.dao.PropertyDAO;
import com.realestate.dao.VerificationDAO;
import com.realestate.model.Inquiry;
import com.realestate.model.Property;
import com.realestate.model.SessionUser;
import com.realestate.model.User;
import com.realestate.model.VerificationRequest;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/broker/dashboard")
public class BrokerDashboardServlet extends HttpServlet {

    private final PropertyDAO propertyDAO = new PropertyDAO();
    private final InquiryDAO inquiryDAO = new InquiryDAO();
    private final VerificationDAO verificationDAO = new VerificationDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        SessionUser currentUser = (session != null) ? (SessionUser) session.getAttribute("currentUser") : null;
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }

        int userId = currentUser.getUserId();
        List<Property> properties = propertyDAO.findByUser(userId);
        List<Inquiry> inquiries = inquiryDAO.findBySellerId(userId);
        VerificationRequest verification = verificationDAO.findLatestByUserId(userId);

        long verifiedCount = properties.stream().filter(p -> p.getVerificationStatus() == Property.VerificationStatus.VERIFIED).count();
        long pendingCount = properties.stream().filter(p -> p.getVerificationStatus() == Property.VerificationStatus.PENDING).count();
        long totalViews = properties.stream().mapToInt(Property::getViewCount).sum();

        request.setAttribute("properties", properties);
        request.setAttribute("inquiries", inquiries);
        request.setAttribute("verification", verification);
        request.setAttribute("totalListings", properties.size());
        request.setAttribute("verifiedCount", verifiedCount);
        request.setAttribute("pendingCount", pendingCount);
        request.setAttribute("totalViews", totalViews);

        request.getRequestDispatcher("/views/broker-dashboard.jsp").forward(request, response);
    }
}
