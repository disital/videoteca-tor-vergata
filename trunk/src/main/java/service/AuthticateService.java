/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

/**
 *  Classe non utilizzata..
 * @author lorenzo
 */



import java.util.List;
import org.springframework.orm.hibernate3.HibernateTemplate;
import pojo.User;


public class AuthticateService {

    private HibernateTemplate hibernateTemplate;

    public AuthticateService() {
// TODO Auto-generated constructor stub
    }

    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    public boolean verifyUserNameAndPassword(String userName, String password) {
        System.out.println("Inside into service class");
        boolean userStatus = false;
        try {
            @SuppressWarnings("unchecked")
            List<User> userObjs = hibernateTemplate.find("from User u where u.username=? and u.password=?", userName, password);
            if (userObjs.size() != 0) {
//System.out.println("User ID : " + userObjs.get(0).getUserId() + ", User name : " + userObjs.get(0).getUserName() + ", Password : " + userObjs.get(0).getPassword());
                userStatus = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userStatus;
    }
}