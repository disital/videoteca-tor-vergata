/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import pojo.Film;

/**
 *
 * @author lorenzo
 */
public interface SearchDAO {
    
    public List<Film> searchWord(String word);
}
