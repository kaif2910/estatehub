package com.realestate.servlet.admin;

import com.realestate.dao.InquiryDAO;
import com.realestate.model.Inquiry;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/inquiries")
public class AdminInquiryServlet extends HttpServlet {

    private final InquiryDAO inquiryDAO = new InquiryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Inquiry> inquiries = inquiryDAO.findAllAdmin();
        request.setAttribute("inquiries", inquiries);
        request.getRequestDispatcher("/views/admin-inquiries.jsp").forward(request, response);
    }
}
