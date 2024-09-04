package controller;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Book;
import service.BookDao;
import utils.StringUtils;

import java.io.IOException;

@WebServlet(asyncSupported = true, urlPatterns = StringUtils.BOOK_DETAILS_SERVLET)
public class BookDetails extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private BookDao bookDao;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        this.bookDao = new BookDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bookID = req.getParameter("bookId");
        if (bookID != null) {
            int bookId = Integer.parseInt(bookID);
            Book book = bookDao.getBookByID(bookId);
            req.setAttribute(StringUtils.BOOK_OBJECT, book);
        }
        req.getRequestDispatcher(StringUtils.BOOK_DETAILS_PAGE).forward(req, resp);
    }
}