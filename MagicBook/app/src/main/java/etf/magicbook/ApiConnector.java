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

    public JSONArray Login(String username, String password){
        String extension = "?login&username=" + username + "&password=" + password;
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
