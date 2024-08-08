package org.bookez.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.bookez.utils.StringUtils;

import java.io.IOException;

@WebServlet(asyncSupported = true, urlPatterns = StringUtils.INDEX_SERVLET)
public class IndexPage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public IndexPage() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(StringUtils.HOME_PAGE).forward(req, resp);
    }

}
