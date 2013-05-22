/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.RentDAO;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pojo.Film;
import pojo.Rented;
import pojo.User;

/**
 *
 * @author lorenzo
 */
@Service
@Transactional
public class RentServiceImpl implements RentService {

    @Autowired
    private RentDAO rentDAO;

    @Override
    public void rent(User user, Film film, Date day_of_rent) {

        rentDAO.rent(user, film, day_of_rent);

    }

    @Override
    public List<Rented> myRentedMovie(int user_iduser) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
