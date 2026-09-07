package com.realestate.servlet.customer;

import com.realestate.dao.InquiryDAO;
import com.realestate.model.Inquiry;
import com.realestate.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/inquiries")
public class InquiryServlet extends HttpServlet {

    private final InquiryDAO inquiryDAO = new InquiryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("currentUser") : null;
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }

        List<Inquiry> inquiries;
        if (currentUser.getRole() == User.Role.SELLER || currentUser.getRole() == User.Role.BROKER) {
            inquiries = inquiryDAO.findBySellerId(currentUser.getUserId());
        } else if (currentUser.getRole() == User.Role.ADMIN) {
            inquiries = inquiryDAO.findAllAdmin();
        } else {
            inquiries = inquiryDAO.findByCustomerId(currentUser.getUserId());
        }

        request.setAttribute("inquiries", inquiries);
        request.getRequestDispatcher("/views/inquiries.jsp").forward(request, response);
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

        String action = request.getParameter("action");
        if ("reply".equalsIgnoreCase(action)) {
            // Seller/Broker reply
            int inquiryId = Integer.parseInt(request.getParameter("inquiryId"));
            String replyText = request.getParameter("replyText");
            inquiryDAO.replyInquiry(inquiryId, replyText);
            session.setAttribute("successMessage", "Reply submitted successfully.");
            response.sendRedirect(request.getContextPath() + "/inquiries");
            return;
        }

        // New customer inquiry
        String propertyIdStr = request.getParameter("propertyId");
        String message = request.getParameter("message");
        String contactPhone = request.getParameter("contactPhone");
        String visitDateStr = request.getParameter("preferredVisitDate");

        if (propertyIdStr != null && message != null && !message.trim().isEmpty()) {
            Inquiry inq = new Inquiry();
            inq.setPropertyId(Integer.parseInt(propertyIdStr));
            inq.setCustomerId(currentUser.getUserId());
            inq.setMessage(message.trim());
            inq.setContactPhone(contactPhone != null ? contactPhone.trim() : currentUser.getPhone());
            if (visitDateStr != null && !visitDateStr.isEmpty()) {
                try {
                    inq.setPreferredVisitDate(Date.valueOf(visitDateStr));
                } catch (Exception ignored) {}
            }

            int inqId = inquiryDAO.createInquiry(inq);
            if (inqId > 0) {
                session.setAttribute("successMessage", "Your inquiry has been delivered directly to the property provider!");
            } else {
                session.setAttribute("errorMessage", "Failed to submit inquiry. Please try again.");
            }
            response.sendRedirect(request.getContextPath() + "/property/details?id=" + propertyIdStr);
        } else {
            response.sendRedirect(request.getContextPath() + "/search");
        }
    }
}
