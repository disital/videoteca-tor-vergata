/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.Charset;
import org.apache.http.ParseException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

/**
 *
 * @author lorenzo
 */
public class JsonParser {

    private static String readAll(Reader rd) throws IOException {
        StringBuilder sb = new StringBuilder();
        int cp;
        while ((cp = rd.read()) != -1) {
            sb.append((char) cp);
        }
        return sb.toString();
    }

    public static JSONObject readJsonFromUrl(String url) throws IOException, ParseException, org.json.simple.parser.ParseException {
//        JSONParser parser = new JSONParser();
        URLConnection conn = new URL(url).openConnection();
        //  URLConnection conn = ur.openConnection();
        conn.setRequestProperty("User-Agent",
                "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.4;"
                + " en-US; rv:1.9.2.2) "
                + "Gecko/20100316 Firefox/3.6.2");
        InputStream is = conn.getInputStream();
        System.out.println("ur.getHost() " + conn.getURL());
//        //  InputStream is = ur.openStream();
        try {
            BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
            String jsonText = readAll(rd);
            Object obj = JSONValue.parse(jsonText);
            JSONArray array = (JSONArray) obj;

            JSONObject jsonobj = (JSONObject) array.get(0);
            //JSONObject json = new JSONObject(jsonText);
            System.out.println("RESULT" + array);
            return jsonobj;

        } finally {
        }
    }
}