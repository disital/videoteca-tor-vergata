/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.File;
import java.util.List;
import pojo.Film;
import pojo.User;

/**
 *
 * @author lorenzo
 */
public interface FilmDAO {

    public void persist(Film transientInstance);

    public void addMovie(User user, String titolo, int id_user);

    public void delete(Integer idFilm);
    
    public List<Film> getFilmTitles(int startID, int endID);

    public byte[] getUserMovieImage(int id_userid);

    public void writeMovieDetails(String titolo,String genere, byte[] poster_byte, File local_file, String plot, String imdb_url);

    public List<Film> loadUserFilm(int id_userid);
    
    public List<Film> loadUserRentFilm(int id_userid);
    
    public Film loadFilmDetail(int idFilm);
}
