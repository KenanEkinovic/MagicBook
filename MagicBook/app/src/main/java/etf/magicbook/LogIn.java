package etf.magicbook;

import android.os.AsyncTask;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Text;


public class LogIn extends ActionBarActivity {

    private Button buttonLogin;
    private TextView txtUsername;
    private TextView txtPassword;
    private TextView test;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_log_in);

        this.buttonLogin = (Button) this.findViewById(R.id.buttonLogin);
        this.txtPassword = (TextView) this.findViewById(R.id.editTextPassword);
        this.txtUsername = (TextView) this.findViewById(R.id.editTextUsername);
        this.test = (TextView) this.findViewById(R.id.test);

        buttonLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new GetLogin().execute(new ApiConnector());
            }
        });
        //this.test = (TextView) this.findViewById(R.id.test);

        //new GetUser().execute(new ApiConnector());
    }

    public void setTextToTextView(JSONArray jsonArray){
        try {
            JSONObject jo = jsonArray.getJSONObject(0);

        } catch (JSONException e) {
            e.printStackTrace();
        }

        /*String s = "";
        for(int i=0; i<jsonArray.length(); i++){
            JSONObject jo = null;
            try{
                jo = jsonArray.getJSONObject(i);
                s = s + jo.getString("username") + " " + jo.getString("password");

            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
        }
        this.test.setText(s);*/
    }

    private class GetLogin extends AsyncTask<ApiConnector,Long,JSONArray>
    {

        @Override
        protected JSONArray doInBackground(ApiConnector... params) {
            return params[0].Login(txtUsername.getText().toString(), txtPassword.getText().toString());
        }

        @Override
        protected void onPostExecute(JSONArray jsonArray){

            //new activity -------
            String s = "";
            for(int i=0; i<jsonArray.length(); i++){
                JSONObject jo = null;
                try{
                    jo = jsonArray.getJSONObject(i);
                    s = s + jo.getString("login");

                }
                catch (Exception e)
                {
                    e.printStackTrace();
                }
            }
            test.setText(s);
        }
    }
}
