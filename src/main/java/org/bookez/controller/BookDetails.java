package org.bookez.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.bookez.utils.StringUtils;

import java.io.IOException;

@WebServlet(asyncSupported = true, urlPatterns = StringUtils.BOOK_DETAILS_SERVLET)
public class BookDetails extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(StringUtils.BOOK_DETAILS_PAGE).forward(req, resp);
    }
}