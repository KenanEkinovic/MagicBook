package etf.magicbook;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;

/**
 * Created by Kenan on 27.12.2014.
 */
public class ApiConnector {

    static String url = "http://192.168.0.102/magicbook/myadminscript.php";
    static HttpEntity httpEntity = null;
    static JSONArray ja = null;

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
             extension = "";
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
