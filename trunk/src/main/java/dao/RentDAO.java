/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.Date;
import java.util.List;
import pojo.Film;
import pojo.Rented;
import pojo.User;

/**
 * Interfaccia per noleggia il film
 * @author lorenzo
 */
public interface RentDAO {
    
    public void rent(User user,Film film, Date day_of_rent);

    
    public List<Rented> myRentedMovie(int user_iduser);
    
}
