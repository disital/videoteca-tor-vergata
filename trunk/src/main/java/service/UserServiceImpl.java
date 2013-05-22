/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.UserDAO;
import dao.UserDAOImpl;
import java.util.List;
import pojo.Film;
import pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author lorenzo
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    @Override
    public void persist(User transientInstance) {
        userDAO.persist(transientInstance);
    }

    @Override
    public void delete(Integer idUser) {
        userDAO.delete(idUser);
    }

    @Override
    public User findByUsernamePassword(String username, String password) {
        return userDAO.findByUsernamePassword(username, password);
    }

    @Override
    public List<Film> getUserFilm(int id) {
        return userDAO.getUserFilm(id);
    }

    @Override
    public int findIDByUsername(String username) {
        return userDAO.findIDByUsername(username);
    }

    @Override
    public User userDetail(String username) {
        return userDAO.userDetail(username);
    }
}
