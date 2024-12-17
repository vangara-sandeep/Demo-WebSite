package com.vtalent;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // In a real application, replace this with a database check
        if ("admin".equals(username) && "password123".equals(password)) {
            response.sendRedirect("index.html"); // Redirect to the landing page
        } else {
            response.sendRedirect("login.html"); // Redirect back to login page
        }
    }
}
