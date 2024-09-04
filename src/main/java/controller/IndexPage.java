package controller;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Genre;
import service.GenreDao;
import utils.StringUtils;

import java.io.IOException;
import java.util.List;

@WebServlet(asyncSupported = true, urlPatterns = StringUtils.INDEX_SERVLET)
public class IndexPage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public GenreDao genreDao;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        this.genreDao = new GenreDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Genre> allGenres = genreDao.getAllGenre();
        req.setAttribute(StringUtils.GENRE_OBJECT, allGenres);
        req.getRequestDispatcher(StringUtils.INDEX_PAGE).forward(req, resp);
    }

}
