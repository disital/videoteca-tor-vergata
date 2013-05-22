/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.Calendar;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import pojo.Film;
import pojo.User;
import service.FilmService;
import service.RentService;

/**
 *
 * @author lorenzo
 */
@Controller
public class RentController {

    @Autowired
    private RentService rentService;
    @Autowired
    private FilmService filmService;
    private Film film = new Film();

    @RequestMapping(value = "/rent/{idfilm}.htm")
    public String rentMovie(@PathVariable("idfilm") int idFilm, String currentFilmID, HttpServletRequest request) {

        Calendar calendar = Calendar.getInstance();
        Date day_of_rent = (Date) calendar.getTime();
        User currentUser = (User) request.getSession().getAttribute("user");

        film = (Film) filmService.loadFilmDetail(idFilm);
        System.out.println("CURRENT FILM ID: " + idFilm);

        /*  Fare l'update dello stato del film -> rented=true\false*/
        rentService.rent(currentUser, film, day_of_rent);

        return "redirect:/index.htm";

    }

    @RequestMapping(value = "/movieDetail/{idfilm}.htm", method = RequestMethod.GET)
    public String movieDetail(@PathVariable("idfilm") int idFilm) {

        filmService.loadFilmDetail(idFilm);

        return "";

    }
}
