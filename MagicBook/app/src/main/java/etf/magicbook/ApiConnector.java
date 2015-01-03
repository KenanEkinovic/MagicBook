package etf.magicbook;

import android.os.StrictMode;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONException;

import java.io.IOException;

/**
 * Created by Kenan on 27.12.2014.
 */
public class ApiConnector {

    ApiConnector(){ ja = null;}

    static String url = "http://192.168.0.102/magicbook/myadminscript.php";
    static HttpEntity httpEntity = null;
    JSONArray ja;
    public JSONArray getCardsInDeck(Deck d){
        //?cardsInDeck&player_id=22&deck_id=1
        //do_it("?cardsInDeck&player_id="+LogIn.PLAYER_ID+"&deck_id="+d.getId());
        String response = null;
        JSONArray result  = null;
        try {
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);
        DefaultHttpClient httpClient = new DefaultHttpClient();
        HttpGet httpGet = new HttpGet(url+"?cardsInDeck&player_id="+LogIn.PLAYER_ID+"&deck_id="+d.getId());
        HttpResponse httpResponse = httpClient.execute(httpGet);
        httpEntity = httpResponse.getEntity();

            response = EntityUtils.toString(httpEntity);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //Log.e("Entity Response: ", response);

        try {
            result = new JSONArray(response);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }
    public JSONArray deleteCardFromDeck(Card c, Deck d){
        String extension = "?deleteCardFromDeck&player_id="+LogIn.PLAYER_ID +"&deck_id="+d.getId()+"&card_id="+c.getId();
        do_it(extension);
        return ja;
    }

    public JSONArray insertCardInDeck(Card c, Deck d, boolean insert2){
        String extension = "?insertCardInDeck&player_id="+LogIn.PLAYER_ID +"&deck_id="+d.getId()+"&card_id="+c.getId();
        if(insert2)
            extension += "&doubleInsert";
        do_it(extension);
        return ja;
    }
    public JSONArray createDeck(Deck d){
        String hero = d.getHero();
        int hero_id=0;
        switch (hero){
            case "Priest":{hero_id = 1; break;}
            case "Warrior":{hero_id = 2; break;}
            case "Mage":{hero_id = 3; break;}
            case "Rogue":{hero_id = 4; break;}
            case "Druid":{hero_id = 5; break;}
            case "Warlock":{hero_id = 6; break;}
            case "Hunter":{hero_id = 7; break;}
            case "Paladin":{hero_id = 8; break;}
            case "Shaman":{hero_id = 9; break;}
        }
        do_it("?newDeck&id="+d.getId()+"&name="+d.getName()+"&hero="+hero_id+"&player_id="+LogIn.PLAYER_ID);
        return ja;
    }
    public JSONArray Decks(String username){
        do_it("?player_decks&username="+username);
        return ja;
    }

    public JSONArray Cards(Integer hero){
        String extension = "";
        if(hero != null)
             extension = "?cards_from_hero="+hero;
        else
            extension = "?cards" ; //getting all cards
        do_it(extension);
        return ja;
    }

    public JSONArray Login(String username, String password){
        String extension = "?login&username=" + username + "&password=" + password;
        do_it(extension);
        return ja;
    }

    public JSONArray Register(String username, String password, String email){
        String extension = "?register&username="+ username + "&password="+password+"&email="+email;
        do_it(extension);
        return ja;
    }

    private void do_it(String extension){
        try{
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);
            DefaultHttpClient httpClient = new DefaultHttpClient();
            HttpGet httpGet = new HttpGet(url+extension);
            HttpResponse httpResponse = httpClient.execute(httpGet);
            httpEntity = httpResponse.getEntity();

            String response = EntityUtils.toString(httpEntity);
            //Log.e("Entity Response: ", response);

            ja = new JSONArray(response);
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
