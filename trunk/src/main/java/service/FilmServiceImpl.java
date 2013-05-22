/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.FilmDAO;
import java.io.File;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pojo.Film;
import pojo.User;

/**
 *
 * @author lorenzo
 */
@Service
@Transactional
public class FilmServiceImpl implements FilmService {

    @Autowired
    private FilmDAO filmDAO;

    @Override
    public void persist(Film transientInstance) {
        filmDAO.persist(transientInstance);
    }

    @Override
    public void addMovie(User user, String titolo, int id_user) {
        filmDAO.addMovie(user, titolo, id_user);
    }

    @Override
    public void delete(Integer idFilm) {
        filmDAO.delete(idFilm);
    }

    @Override
    public byte[] getUserMovieImage(int id_userid) {
        return filmDAO.getUserMovieImage(id_userid);
    }

    @Override
    public void writeMovieDetails(String titolo, byte[] poster_byte, File local_file, String plot, String imdb_url) {
        filmDAO.writeMovieDetails(titolo, poster_byte, local_file, plot, imdb_url);
    }

    @Override
    public List<Film> getFilmTitles(int startID, int endID) {
        return filmDAO.getFilmTitles(startID, endID);
    }

    @Override
    public List<Film> loadUserFilm(int id_userid) {
        return filmDAO.loadUserFilm(id_userid);
    }

    @Override
    public Film loadFilmDetail(int idFilm) {
        return filmDAO.loadFilmDetail(idFilm);
    }
}
