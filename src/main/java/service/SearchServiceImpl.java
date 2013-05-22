/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.SearchDAO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pojo.Film;

/**
 *
 * @author lorenzo
 */
@Service
@Transactional
public class SearchServiceImpl implements SearchService {

    @Autowired
    private SearchDAO searchDAO;

    @Override
    public List<Film> searchWord(String word) {

        return searchDAO.searchWord(word);
    }
}
