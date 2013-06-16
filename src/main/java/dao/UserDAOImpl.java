/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.File;
import pojo.Film;
import pojo.User;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author lorenzo
 */
@Repository
@Transactional
public class UserDAOImpl implements UserDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void persist(User transientInstance) {

        sessionFactory.getCurrentSession().save(transientInstance);
    }

    @Override
    public void delete(Integer idUser) {

        User user = (User) sessionFactory.getCurrentSession().load(User.class, idUser);
        if (null != user) {
            sessionFactory.getCurrentSession().delete(user);
        }

    }

    @Override
    public User findByUsernamePassword(String username, String pwd) {

        List<User> user_list = null;

        user_list = sessionFactory.getCurrentSession().createQuery("from User as u where u.username='" + username + "' and u.password='" + pwd + "'").list();
        if (user_list == null || user_list.size() == 0) {
            return null;
        }
        return user_list.get(0);
    }

    @Override
    public List<Film> getUserFilm(int id) {
        return sessionFactory.getCurrentSession().createQuery("from model.Film film where user_iduser =" + id)
                .list();

    }

    @Override
    public int findIDByUsername(String username) {

        Integer id = (Integer) sessionFactory.getCurrentSession().createQuery("select u.iduser from User as u where u.username =:username")
                .setParameter("username", username).uniqueResult();
        System.out.println("IDDDDDD : " + id);

        return id;
    }

    @Override
    public User userDetail(String username) {

        List detail = sessionFactory.getCurrentSession().createQuery("from User as u where u.username =:username")
                .setParameter("username", username).list();
        User user = (User) detail.get(0);

        return user;
    }

    @Override
    public void updateAvatar(String pathAvatar,String username) {
       sessionFactory.getCurrentSession().createSQLQuery("update user SET avatar = '" + pathAvatar  + "' where user.username = '" + username + "'")
                .executeUpdate();
    }
}