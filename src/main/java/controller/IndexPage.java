package controller;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Book;
import model.Genre;
import service.BookDao;
import service.GenreDao;
import utils.StringUtils;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@WebServlet(asyncSupported = true, urlPatterns = StringUtils.INDEX_SERVLET)
public class IndexPage extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private GenreDao genreDao;
    private BookDao bookDao;
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        this.genreDao = new GenreDao();
        this.bookDao = new BookDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Genre> allGenres = genreDao.getAllGenre();
        List<Book> featuredBooks = bookDao.getFeaturedBook();
        List<Book> allBooks = bookDao.getAllBook();

        // Get sorting order parameter from the request
        String sortOrder = req.getParameter("sortOrder");

        // If no sort order is selected, shuffle the list for random order
        if (sortOrder != null) {
            // Sort the books based on price according to the selected order
            if (sortOrder.equals("low-high")) {
                allBooks.sort(Comparator.comparingDouble(Book::getPrice));  // Low to high
            } else if (sortOrder.equals("high-low")) {
                allBooks.sort(Comparator.comparingDouble(Book::getPrice).reversed());  // High to low
            }
        }

        req.setAttribute(StringUtils.ALL_BOOKS_OBJECT, allBooks);
        req.setAttribute(StringUtils.FEATURED_BOOKS_OBJECT, featuredBooks);
        req.setAttribute(StringUtils.GENRE_OBJECT, allGenres);
        req.getRequestDispatcher(StringUtils.INDEX_PAGE).forward(req, resp);
    }


}
