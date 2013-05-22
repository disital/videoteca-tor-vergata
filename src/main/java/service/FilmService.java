/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.io.File;
import java.util.List;
import pojo.Film;
import pojo.User;

/**
 *
 * @author lorenzo
 */
public interface FilmService {

    public void persist(Film transientInstance);

    public void addMovie(User user, String titolo, int id_user);

    public void delete(Integer idFilm);

    public byte[] getUserMovieImage(int id_userid);

    public List<Film> getFilmTitles(int startID, int endID);
    
    public void writeMovieDetails(String titolo, byte[] poster_byte, File local_file, String plot, String imdb_url);

    public List<Film> loadUserFilm(int id_userid);
    
    public Film loadFilmDetail(int idFilm);

}
