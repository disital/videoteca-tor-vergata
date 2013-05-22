/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import pojo.User;
import service.UserService;

/**
 *
 * @author lorenzo
 */
@Controller
public class LoginController {

//    @Autowired //Inietto Auth in questo Controller , per non uso UserService
//    private AuthticateService authenticateService;
    @Autowired
    private UserService userService;
    private User currentUser;

    @RequestMapping(value = "/Login.htm", method = RequestMethod.POST)
    public String processCredentials(@RequestParam("username") String username,
            @RequestParam("password") String password, HttpServletRequest request, HttpServletResponse response) {

        String message = "Invalid credentials";

        if (userService.findByUsernamePassword(username, password) == null) {

            return "redirect:/register.jsp";
        } else {
            /* Carico le info relative a questo utente */
            currentUser = userService.userDetail(username);

            /* Voglio portarmi dietro questo utente nella sessione per operazioni future*/
            request.getSession().setAttribute("user", currentUser);
            request.getSession().setAttribute("username", username);
            message = "Welcome " + username + "!!";
            return "redirect:/index.htm";
        }
    }

    @RequestMapping(value = "/logout.htm")
    public String logout(HttpServletRequest request, HttpServletResponse response) {

        request.getSession().invalidate();
        return "redirect:/index.jsp";
    }

    @RequestMapping(value = "/register.htm")
    public String register(@RequestParam("username") String username,
            @RequestParam("password") String password, HttpServletRequest request, HttpServletResponse response) {

        currentUser = new User(username, password);


        userService.persist(currentUser);
        request.getSession().setAttribute("user", currentUser);
        request.getSession().setAttribute("username", username);
        return "redirect:/index.htm";
    }
}