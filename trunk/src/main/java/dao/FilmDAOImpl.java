/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.File;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pojo.Film;
import pojo.User;

/**
 *
 * @author lorenzo
 */
@Repository
@Transactional
public class FilmDAOImpl implements FilmDAO {

    @Autowired
    private SessionFactory sessionFactory;
    private static Film film = new Film();
    //private static User user;

    @Override
    public void persist(Film transientInstance) {

        sessionFactory.getCurrentSession().save(transientInstance);
    }

    @Override
    public void addMovie(User user, String titolo, int id_user) {

        id_user = user.getIduser();
        film = new Film(user, titolo);
        film.getUser().setIduser(id_user);
        this.persist(film);

    }

    @Override
    public void delete(Integer idFilm) {

        film = (Film) sessionFactory.getCurrentSession().load(Film.class, idFilm);
        if (null != film) {
            sessionFactory.getCurrentSession().delete(film);
        }

    }

    @Override
    public byte[] getUserMovieImage(int id_userid) {
  
        byte[] movieImage = null;
        
      movieImage = (byte[]) sessionFactory.getCurrentSession().createQuery("from Film image where user_iduser= " +id_userid).list().get(10);
        
        return movieImage;
    }

    @Override
    public void writeMovieDetails(String titolo, byte[] poster_byte, File local_file, String plot, String imdb_url) {

        film = new Film();
        film.setImage(poster_byte);
//        String titolo_ = titolo.replaceAll("\\s","");
//        System.out.println("TITOLO PRIMA DELLA QUERY : " + titolo);
        sessionFactory.getCurrentSession().createSQLQuery("update film SET image = '" + poster_byte + ""
                + "' , trama = '" + plot.replaceAll("'", "''") + "' , imdb_url = '" + imdb_url + "' where film.titolo = '" + titolo.replaceAll("'", "''") + "'")
                .executeUpdate();
    }

    @Override
    public List<Film> loadUserFilm(int id_userid) {
        List<Film> userFilm = null;

        try {
            userFilm = (List<Film>) sessionFactory.getCurrentSession().createQuery("from Film where user_iduser =" + id_userid)
                    .list();
            System.out.println("NUMERO DI FILM DI " + id_userid + " " + userFilm.size());
            return userFilm;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return userFilm;
    }

    @Override
    public List<Film> getFilmTitles(int startID, int endID) {

        List<Film> filmList = null;
        try {

            filmList = sessionFactory.getCurrentSession().createQuery("from Film as film where film.idfilm between '" + startID + "' and '" + endID + "'").list();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return filmList;
    }

    @Override
    public List<Film> loadUserRentFilm(int id_userid) {

        List<Film> rentedFilm = null;
        try {
//            sessionFactory.getCurrentSession().createQuery
//                    ("from Film as film where film.idfilm between '" + startID + "' and '" + endID + "'");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rentedFilm;
    }

    @Override
    public Film loadFilmDetail(int idFilm) {

        Film currentFilm = (Film) sessionFactory.getCurrentSession().createQuery("from Film as film where film.idfilm = '" + idFilm + "'").uniqueResult();

        return currentFilm;
    }
}
