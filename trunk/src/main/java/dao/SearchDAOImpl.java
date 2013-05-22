/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pojo.Film;

/**
 *
 * @author lorenzo
 */
@Repository
@Transactional
public class SearchDAOImpl implements SearchDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Film> searchWord(String word) {
        List<Film> results;

        results = (List<Film>) sessionFactory.getCurrentSession().createQuery("from Film where "
                + "concat_ws(' - ', ifnull(titolo,''),ifnull(genere,''),"
                + " ifnull(link,''), ifnull(trama,''))"
                + "  LIKE '%" + word + "%'").list();
        System.out.println("DIMENSIONI DI RESULTS : " + results.size());
        return results;

    }
}
