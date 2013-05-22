/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.util.List;
import pojo.Film;

/**
 *
 * @author lorenzo
 */
public interface SearchService {
    
    public List<Film> searchWord(String word);
}
