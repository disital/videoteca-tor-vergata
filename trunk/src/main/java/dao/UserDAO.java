/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author lorenzo
 */
import pojo.Film;
import pojo.User;
import java.util.List;

public interface UserDAO {

    public void persist(User transientInstance);

    public void delete(Integer idUser);

    public User findByUsernamePassword(String username, String pwd);

    public int findIDByUsername(String username);
    
    public List<Film> getUserFilm(int id);
    
    public User userDetail(String username);
}
