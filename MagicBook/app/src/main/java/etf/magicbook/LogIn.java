package etf.magicbook;

import android.content.Context;
import android.content.Intent;
import android.database.sqlite.SQLiteDatabase;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


public class LogIn extends ActionBarActivity {
    SQLiteDatabase db;

    Intent main_activity;
    public static String PLAYER_USERNAME;
    public static int PLAYER_ID;

    private Button buttonLogin;
    private EditText txtUsername;
    private EditText txtPassword;
    LogIn reference;

    private Button buttonRegister;
    private EditText txtNewUsername;
    private EditText txtNewPassword;
    private EditText txtNewEmail;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_log_in);
        reference = this;

        this.buttonLogin = (Button) this.findViewById(R.id.buttonLogin);
        this.buttonRegister = (Button) this.findViewById(R.id.buttonRegister);
        ConnectivityManager cm = (ConnectivityManager)getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo netInfo = cm.getActiveNetworkInfo();

        if (netInfo == null)
        {
            Toast.makeText(getApplicationContext(), "Cannot connect to internet\nPlease, close the app and try again.", Toast.LENGTH_LONG).show();
            buttonLogin.setEnabled(false);
            buttonRegister.setEnabled(false);
        }
        else
        {
            new GetVersion(this).execute(new ApiConnector());
        }


        this.txtPassword = (EditText) this.findViewById(R.id.editTextPassword);
        this.txtUsername = (EditText) this.findViewById(R.id.editTextUsername);

        this.txtNewPassword = (EditText) this.findViewById(R.id.txtNewPassword);
        this.txtNewUsername = (EditText) this.findViewById(R.id.txtNewUsername);
        this.txtNewEmail = (EditText) this.findViewById(R.id.txtNewEmail);

        buttonLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new GetLogin(reference).execute(new ApiConnector());

                //closing the keyboard
                InputMethodManager im = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
                im.hideSoftInputFromWindow(getCurrentFocus().getWindowToken(), InputMethodManager.HIDE_NOT_ALWAYS);
            }
        });

        buttonRegister.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new Register(reference).execute(new ApiConnector());

                //closing the keyboard
                InputMethodManager im = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
                im.hideSoftInputFromWindow(getCurrentFocus().getWindowToken(), InputMethodManager.HIDE_NOT_ALWAYS);
            }
        });
    }

    private class GetLogin extends AsyncTask<ApiConnector,Long,JSONArray>
    {
        LogIn parent;
        GetLogin(LogIn l){
            parent = l;
        }
        @Override
        protected JSONArray doInBackground(ApiConnector... params) {
            return params[0].Login(txtUsername.getText().toString(), txtPassword.getText().toString());
        }

        @Override
        protected void onPostExecute(JSONArray jsonArray){

            String s = "";
            JSONObject jo = null;
                try{
                    jo = jsonArray.getJSONObject(0);
                    s = jo.getString("login");
                }
                catch (Exception e)
                {
                    e.printStackTrace();
                }

            if(!s.equals("0")) //login ok
            {
                Toast.makeText(parent, "Wellcome, "+ txtUsername.getText().toString(), Toast.LENGTH_SHORT).show();
                main_activity = new Intent(reference, MainActivity.class);
                reference.startActivity(main_activity);
                //closing the keyboard
                InputMethodManager im = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
                im.hideSoftInputFromWindow(getCurrentFocus().getWindowToken(), InputMethodManager.HIDE_NOT_ALWAYS);
                //storing player username
                PLAYER_USERNAME = txtUsername.getText().toString();
                try{
                    PLAYER_ID = Integer.parseInt(s);
                }
                catch (Exception e){
                    Toast.makeText(getApplicationContext(), "Cannot connect to the service", Toast.LENGTH_SHORT).show();
                    System.exit(0);
                    return;
                }

            }
            else
            {
                Toast.makeText(parent, "Invalid username and password.", Toast.LENGTH_SHORT).show();
            }
        }
    }

    private class Register extends AsyncTask<ApiConnector, Long, JSONArray>{
        LogIn parent;
        Register(LogIn l){
            parent = l;
        }

        @Override
        protected JSONArray doInBackground(ApiConnector... params) {
            String u = txtNewUsername.getText().toString();
            String p = txtNewPassword.getText().toString();
            String e = txtNewEmail.getText().toString();

            if(txtNewUsername.getText().toString().isEmpty())
                return null;
            else
                return params[0].Register(u,p,e);
        }

        @Override
        protected void onPostExecute(JSONArray jsonArray){
            String s = "";
            JSONObject jo = null;
            try{
                jo = jsonArray.getJSONObject(0);
                s = jo.getString("register");
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }

            if(!s.equals("0")) //register ok
            {
                Toast.makeText(parent, "You have been successfully registered, "+ txtNewUsername.getText().toString(), Toast.LENGTH_SHORT).show();
            }
            else
            {
                Toast.makeText(parent, "Player with that username already exists.\nPlease, choose another username.", Toast.LENGTH_SHORT).show();
            }
        }
    }

    private class GetVersion extends AsyncTask<ApiConnector,Long,JSONArray>{
        LogIn parent;
        GetVersion(LogIn l){parent = l;}
        @Override
        protected JSONArray doInBackground(ApiConnector... params) {
            return params[0].getMainDBVersion();
        }

        @Override
        protected void onPostExecute(JSONArray jsonArray) {
            DatabaseHandler dbh = DatabaseHandler.getInstance(parent.getApplicationContext());
            int localVersion = dbh.getVersion();
            try {
                JSONObject jo = jsonArray.getJSONObject(0);
                int mainVersion = jo.getInt("version");

                if(mainVersion != localVersion){
                    new GetCards(parent, mainVersion).execute(new ApiConnector());
                }

            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }

    private class GetCards extends AsyncTask<ApiConnector,Long,JSONArray>{
        LogIn parent;
        int newVersion;
        GetCards(LogIn l, int newVersion){
            parent = l;
            this.newVersion = newVersion;
        }

        @Override
        protected JSONArray doInBackground(ApiConnector... params) {
            JSONArray res = params[0].Cards(null);
            int a= 3;
            return  res;
        }

        @Override
        protected void onPostExecute(JSONArray jsonArray){
            final DatabaseHandler dbh = DatabaseHandler.getInstance(parent);
            dbh.deleteAllCards();
            dbh.deleteAllDecks();
            JSONObject jo = null;
            try{
                for(int i=0; i<jsonArray.length(); i++)
                {
                    jo = jsonArray.getJSONObject(i);
                    int id = Integer.valueOf(jo.getString("id"));
                    String name = jo.getString("name");
                    String hero = jo.getString("hero");
                    switch (hero){
                        case "1":{hero = "Priest"; break;}
                        case "2":{hero = "Warrior"; break;}
                        case "3":{hero = "Mage"; break;}
                        case "4":{hero = "Rogue"; break;}
                        case "5":{hero = "Druid"; break;}
                        case "6":{hero = "Warlock"; break;}
                        case "7":{hero = "Hunter"; break;}
                        case "8":{hero = "Paladin"; break;}
                        case "9":{hero = "Shaman"; break;}
                        default: hero = "null";
                    }
                    String rarity = jo.getString("rarity");
                    String type = jo.getString("type");
                    String subtype = jo.getString("subtype");
                    String cost = jo.getString("cost");
                    String attack = jo.getString("attack");
                    String hp = jo.getString("hp");
                    String pictureURL = jo.getString("picture");
                    Card c = new Card(id, name.replace(' ','_'), hero, type, subtype, rarity, cost, attack, hp, pictureURL);
                    dbh.createCard(c); //putting a card into batch
                }
                dbh.executeCardBatch();
                dbh.updateVersion(newVersion);
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
        }
    }
}
