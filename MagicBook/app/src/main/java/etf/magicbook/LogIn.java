package etf.magicbook;

import android.content.Context;
import android.content.Intent;
import android.database.sqlite.SQLiteDatabase;
import android.os.AsyncTask;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Text;


public class LogIn extends ActionBarActivity {
    SQLiteDatabase db;

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
        this.txtPassword = (EditText) this.findViewById(R.id.editTextPassword);
        this.txtUsername = (EditText) this.findViewById(R.id.editTextUsername);

        this.buttonRegister = (Button) this.findViewById(R.id.buttonRegister);
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

            if(s.equals("1")) //login ok
            {
                Toast.makeText(parent, "Wellcome, "+ txtUsername.getText().toString(), Toast.LENGTH_SHORT).show();
                Intent i = new Intent(reference, MainActivity.class);
                reference.startActivity(i);
                //closing the keyboard
                InputMethodManager im = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
                im.hideSoftInputFromWindow(getCurrentFocus().getWindowToken(), InputMethodManager.HIDE_NOT_ALWAYS);
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

            if(s.equals("1")) //register ok
            {
                Toast.makeText(parent, "You have been successfully registered, "+ txtNewUsername.getText().toString(), Toast.LENGTH_SHORT).show();
            }
            else
            {
                Toast.makeText(parent, "Player with that username already exists.\nPlease, choose another username.", Toast.LENGTH_SHORT).show();
            }
        }
    }
}
