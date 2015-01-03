package etf.magicbook;

import android.os.AsyncTask;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.app.ActionBarActivity;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.Locale;


public class MainActivity extends ActionBarActivity {

    SectionsPagerAdapter mSectionsPagerAdapter;

    ViewPager mViewPager;

    @Nullable
    @Override
    protected void onStart() {
        super.onStart();
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event)
    {
        if ((keyCode == KeyEvent.KEYCODE_BACK))
            finish();
        return super.onKeyDown(keyCode, event);
    }
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mSectionsPagerAdapter = new SectionsPagerAdapter(getSupportFragmentManager());

        mViewPager = (ViewPager) findViewById(R.id.pager);
        mViewPager.setAdapter(mSectionsPagerAdapter);

        new GetLevel().execute(new ApiConnector());
    }

    @Override
    protected void onResume() {
        super.onResume();
        new GetLevel().execute(new ApiConnector());
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();

        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    public class SectionsPagerAdapter extends FragmentPagerAdapter {

        public SectionsPagerAdapter(FragmentManager fm) {
            super(fm);
        }

        @Override
        public Fragment getItem(int position) {
            if(position == 0)
                return CardList.newInstance(false, null);
            else
                return DeckList.newInstance();
        }

        @Override
        public int getCount() { //number of pages
            return 2;
        }

        @Override
        public CharSequence getPageTitle(int position) {
            Locale l = Locale.getDefault();
            switch (position) {
                case 0:
                    return "Cards";
                case 1:
                    return "Decks";
            }
            return null;
        }
    }

    private class GetLevel extends AsyncTask<ApiConnector,Long,JSONArray>{

        @Override
        protected JSONArray doInBackground(ApiConnector... params) {
            return params[0].getLevel();
        }

        @Override
        protected void onPostExecute(JSONArray jsonArray) {
            try {
                JSONObject jo = jsonArray.getJSONObject(0);
                int level = jo.getInt("level");

                if(level != 0)
                {
                    setTitle(LogIn.PLAYER_USERNAME + " : level " + level);
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }
}
