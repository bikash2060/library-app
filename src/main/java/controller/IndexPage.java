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
        req.setAttribute(StringUtils.ALL_BOOKS_OBJECT, allBooks);
        req.setAttribute(StringUtils.FEATURED_BOOKS_OBJECT, featuredBooks);
        req.setAttribute(StringUtils.GENRE_OBJECT, allGenres);
        req.getRequestDispatcher(StringUtils.INDEX_PAGE).forward(req, resp);
    }

}
