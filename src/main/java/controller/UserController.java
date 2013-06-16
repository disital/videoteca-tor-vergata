/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.UserService;

/**
 *
 * @author ldisita
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/editProfile.htm", method = RequestMethod.POST)
    public String editProfile(@RequestParam("name") String name,
            @RequestParam("surname") String surname, HttpServletRequest request, HttpServletResponse response) {
        
        System.out.println("NAME : " + name);
        return "redirect:/profile.htm";


    }

    @RequestMapping(value = "/profile.htm")
    public ModelAndView profile(HttpServletRequest request, HttpServletResponse response) {



        return new ModelAndView("profile");


    }
}
