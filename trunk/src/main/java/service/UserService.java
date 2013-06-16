/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.util.List;
import pojo.Film;
import pojo.User;

/**
 *
 * @author lorenzo
 */
public interface UserService {
   
    
    public void persist(User transientInstance);

    public void delete(Integer idUser);
    
    public void updateAvatar(String pathAvatar,String username);

    public User findByUsernamePassword(String username, String pwd);

    public int findIDByUsername(String username);
    
    public List<Film> getUserFilm(int id);
    
    public User userDetail(String username);
}
