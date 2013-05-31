/*
 * Spring Controller per la Home
 * ----------------------------
 * @addMovie
 * @myMovie
 * @home
 * @search
 */
 
package controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import main.JsonParser;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pojo.Film;
import pojo.User;
import service.FilmService;
import service.SearchService;

/**
 *
 * @author Lorenzo - disital@gmail.com
 */
@Controller
public class HomeController {

    @Autowired
    private FilmService filmService;
    @Autowired
    private SearchService searchService;

    @RequestMapping(value = "/addMovie.htm", method = RequestMethod.POST)
    public String addMovie(@RequestParam("titolo") String titolo,
            HttpServletRequest request, HttpServletResponse response) {
        String message = "ok";

        try {
            /* Recupero l'utente in sessione per operazioni */
            User currentUser = (User) request.getSession().getAttribute("user");

            filmService.addMovie(currentUser, titolo, currentUser.getIduser());

            /* Chiamo il JsonParser per recuperare il json da imdbapi
            * @url .         Url di imdbapi più titolo
            * @plot          Trama del film
            * @poster_url    Locandina del film
            */
            try {
                String url = "http://imdbapi.org/?title=" + titolo;
                JSONObject json = JsonParser.readJsonFromUrl(url);
                String plot = json.get("plot_simple").toString();
                String poster_url = json.get("poster").toString();
                String imdb_url = json.get("imdb_url").toString();
                URL img_url = new URL(poster_url);

                System.out.println("URL DELL'IMMAGINE :" + img_url);
                
                /* Scarico l'immagine e la salvo in locale */
                
                BufferedImage image = ImageIO.read(img_url);
                File local_file = new File("C:\\Users\\lorenzo\\Desktop\\Immagini\\" + titolo + ".jpg");
                ImageIO.write(image, "jpg", local_file);

                FileInputStream fileInputStream = new FileInputStream(local_file);
                ByteArrayOutputStream bos = new ByteArrayOutputStream();
                int length = fileInputStream.available();
                byte[] data = new byte[length];

                for (int readNum; (readNum = fileInputStream.read(data)) != -1;) {
                    bos.write(data, 0, readNum);
                    System.out.println("read " + readNum + " bytes,");
                }

                byte[] bytes = bos.toByteArray();

                filmService.writeMovieDetails(titolo, bytes, local_file, plot, imdb_url);
            } catch (Exception e) {
                e.printStackTrace();
            }

            return "redirect:/index.htm";
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/index.htm";
    }

    @RequestMapping(value = "/myMovie.htm", method = RequestMethod.GET)
    public ModelAndView myMovie(HttpServletRequest request) {
        String message = "ok";
        List listMovie;
        try {
            User currentUser = (User) request.getSession().getAttribute("user");
            int id_userid = currentUser.getIduser();

            listMovie = filmService.loadUserFilm(id_userid);
            if (listMovie.isEmpty()) {
                message = "Nessun film inserito da questo utente !!! ";
            }
            request.getSession().setAttribute("listMovie", listMovie);
            return new ModelAndView("myMovie", "message", message);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }

    @RequestMapping(value = "/index.htm")
    public ModelAndView home(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Film> listMovie;
        int startID = 1;
        int endID = 12;
        /*Pubblico uan decina di titoli compresi tra 1<>12 */
        listMovie = filmService.getFilmTitles(startID, endID);

        System.out.println("SIZE DI LISTMOVIE HOMEPAGE : " + listMovie.size());
        request.getSession().setAttribute("homeMovie", listMovie);
        response.setContentType("image/jpg");
     //  System.out.println("BLOOOOOOOOOOOB : " + listMovie.get(8).getImage());

        return new ModelAndView("home");
    }

    @RequestMapping(value = "/search.htm")
    public ModelAndView search(@RequestParam("word") String word, HttpServletRequest request) {

        String message = " ";

        List<Film> resultList = searchService.searchWord(word);
        if (resultList.isEmpty()) {
            message = " Nessun film è stato trovato con la parola :" + word;
        }
        request.getSession().setAttribute("resultList", resultList);
        return new ModelAndView("results", "message", message);
    }
}
