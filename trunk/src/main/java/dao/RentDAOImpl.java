/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.Date;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pojo.Film;
import pojo.Rented;
import pojo.User;

/**
 *
 * @author lorenzo
 */
@Repository
@Transactional
public class RentDAOImpl implements RentDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void rent(User user, Film film, Date dayOfRent) {

        Rented movieRent = new Rented(user, film, dayOfRent);
        sessionFactory.getCurrentSession().save(movieRent);
    }

    @Override
    public List<Rented> myRentedMovie(int user_iduser) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
