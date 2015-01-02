package etf.magicbook;

import android.content.Context;
import android.os.AsyncTask;
import android.os.PersistableBundle;
import android.provider.ContactsContract;
import android.support.v4.app.Fragment;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.util.AttributeSet;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.Toast;

import org.json.JSONArray;

import java.util.ArrayList;


public class DeckActivity extends ActionBarActivity {
    ArrayList<Card> cards_in_deck;

    Deck myDeck;

    public void onDialogClosed(int  card_id, boolean insert2, boolean delete){
        DatabaseHandler dbh = DatabaseHandler.getInstance(getApplicationContext());
        Card card = dbh.getCard(card_id);

        if(delete) //remove card
            new DeleteCardFromDeck(card, myDeck).execute(new ApiConnector());
        else //add card
            new InsertCardInDeck(card, myDeck, insert2).execute(new ApiConnector());
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_deck);

        Bundle b = getIntent().getExtras();
        int deck_id = b.getInt("deck_id");
        DatabaseHandler dbh = DatabaseHandler.getInstance(getApplicationContext());
        myDeck = dbh.getDeck(deck_id);

        Integer hero_id = null;
        String hero_name = myDeck.getHero();
        switch (hero_name){
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
        Fragment f = CardList.newInstance(true,hero_id);
        getSupportFragmentManager().beginTransaction().add(R.id.deckCardLayout, f).commit();
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();

        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    private class GetCardsInDeck extends AsyncTask<ApiConnector, Long, JSONArray>{

        @Override
        protected JSONArray doInBackground(ApiConnector... params) {
            return null;
        }

        @Override
        protected void onPostExecute(JSONArray jsonArray) {
            super.onPostExecute(jsonArray);
        }
    }

    private class InsertCardInDeck extends AsyncTask<ApiConnector, Long, JSONArray>{

        Card c;
        Deck d;
        boolean insert2;
        InsertCardInDeck(Card c ,Deck d, boolean insert2){
            this.c = c;
            this.d = d;
            this.insert2 = insert2;
        }
        @Override
        protected JSONArray doInBackground(ApiConnector... params) {
            return params[0].insertCardInDeck(c,d,insert2);
        }
    }

    private class DeleteCardFromDeck extends AsyncTask<ApiConnector, Long, JSONArray>{
        Card c;
        Deck d;
        DeleteCardFromDeck(Card c, Deck d){
            this.d = d;
            this.c = c;
        }
        @Override
        protected JSONArray doInBackground(ApiConnector... params) {
            return params[0].deleteCardFromDeck(c,d);
        }
    }
}
