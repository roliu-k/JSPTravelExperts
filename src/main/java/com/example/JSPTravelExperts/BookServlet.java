package com.example.JSPTravelExperts;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

// Ronnie's work

@WebServlet(name = "bookingdetail", value = "/bookingdetail")
public class BookServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        int packageId = Integer.parseInt(request.getParameter("packageId"));

        request.setAttribute("packageId", packageId);

        try {
            request.getRequestDispatcher("bookpackage.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        }

    }

    public void destroy() {
    }
}


