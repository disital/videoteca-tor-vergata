/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.util.Date;
import java.util.List;
import pojo.Film;
import pojo.Rented;
import pojo.User;

/**
 *
 * @author lorenzo
 */
public interface RentService {

    public void rent(User user, Film film, Date day_of_rent);

    public List<Rented> myRentedMovie(int user_iduser);
}
