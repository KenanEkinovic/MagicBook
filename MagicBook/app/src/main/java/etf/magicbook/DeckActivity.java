package etf.magicbook;

import android.content.Context;
import android.graphics.Color;
import android.os.AsyncTask;
import android.os.Handler;
import android.os.Message;
import android.os.StrictMode;
import android.support.v4.app.Fragment;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.util.AttributeSet;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.Toast;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;

import java.lang.reflect.Array;
import java.util.ArrayList;


public class DeckActivity extends ActionBarActivity{
    public static ArrayList<String> cards_in_deck = new ArrayList<String>();
    FrameLayout card_manager;

    Deck myDeck;
    public void onDialogClosed(int  card_id, boolean insert2, boolean delete){
        DatabaseHandler dbh = DatabaseHandler.getInstance(getApplicationContext());
        Card card = dbh.getCard(card_id);

        if(delete) { //remove card
            new DeleteCardFromDeck(card, myDeck).execute(new ApiConnector());
            for(int i=0; i<cards_in_deck.size(); i++){
                if(cards_in_deck.get(i).replace('_',' ').equals(card.getName().replace('_',' ')))
                {
                    cards_in_deck.remove(i);
                    i--;
                }
            }
            refreshCardListView();
            return;
        }
        //does card exist in deck?
        int number_of_occurances = 0;
        for(int i=0; i<cards_in_deck.size(); i++){
            if(cards_in_deck.get(i).equals(card.getName()))
            {
                number_of_occurances++;
                if((number_of_occurances == 1 && card.getRarity().equals("Legendary") ) || number_of_occurances == 2)
                {
                    Toast.makeText(getApplicationContext(), "This card already exists in this deck", Toast.LENGTH_SHORT).show();
                    return;
                }
            }
        }
        if(number_of_occurances == 2 && delete == false){
            Toast.makeText(getApplicationContext(), "Card is already in the deck", Toast.LENGTH_SHORT).show();
            return;
        }
        if(number_of_occurances == 1 && !card.getRarity().equals("Legendary"))
        {
            new InsertCardInDeck(card, myDeck, false).execute(new ApiConnector());
            number_of_occurances = 2;
            if(insert2)
                Toast.makeText(getApplicationContext(), "Only 1 card added, your deck already had 1 of this card", Toast.LENGTH_SHORT).show();
        }

        if(!delete && number_of_occurances != 2) //add card
        {
            if(cards_in_deck.size()>=30)
            {
                Toast.makeText(getApplicationContext(), "You already got 30 cards in this deck", Toast.LENGTH_SHORT).show();
                return;
            }
            if(insert2 == false){
                new InsertCardInDeck(card, myDeck, insert2).execute(new ApiConnector());
            }
            if(insert2 == true){
                if(cards_in_deck.size()==29)
                {
                    Toast.makeText(getApplicationContext(), "Only 1 card added, your deck got 30 cards now.", Toast.LENGTH_SHORT).show();
                    new InsertCardInDeck(card, myDeck, false).execute(new ApiConnector());
                }
                else if(cards_in_deck.size()<29)
                    new InsertCardInDeck(card, myDeck, insert2).execute(new ApiConnector());
            }
        }

        refreshCardListView();
    }

    private LinearLayout myCardsLayout;

    private void refreshCardListView(){
        final DatabaseHandler dbh = DatabaseHandler.getInstance(this.getApplicationContext());
        myCardsLayout.removeAllViews();
        //Toast.makeText(getApplicationContext(), ""+cards_in_deck.size(),Toast.LENGTH_SHORT).show();
        for(int i=0; i<cards_in_deck.size(); i++)
        {
            Button btnCard = new Button(this);
            String provjera = cards_in_deck.get(i);
            Card c = dbh.getCard(provjera);
            //Card c = dbh.getCard(cards_in_deck.get(i).getId());
            //btnCard.setText("OUYEAR " + c.getName());
            btnCard.setText(c.getName().replace('_',' '));
            //btnCard.setText(c.getName());
            btnCard.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Button btn = (Button) v;
                    Card c = dbh.getCard(btn.getText().toString());
                    CardDialog cd = new CardDialog(c);
                    cd.setDeckLayoutOptions(true);
                    cd.show(getSupportFragmentManager(), "CardDialog");
                    //cd.setDeckLayoutOptions(true);
                    //cd.show(getCallingActivity().getFragmentManager(), "CardDialog");
                }
            });
            myCardsLayout.addView(btnCard);
        }

    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_deck);
        card_manager = (FrameLayout) findViewById(R.id.cardManagerLayout);
        card_manager.setVisibility(View.GONE);
        myCardsLayout = (LinearLayout) findViewById(R.id.myCardsLayout);
        Button btnManageCards = (Button) findViewById(R.id.btnManageCards);
        btnManageCards.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(card_manager.getVisibility() == View.VISIBLE)
                    card_manager.setVisibility(View.GONE);
                else if(card_manager.getVisibility() == View.GONE)
                    card_manager.setVisibility(View.VISIBLE);
            }
        });

        Bundle b = getIntent().getExtras();
        int deck_id = b.getInt("deck_id");
        final DatabaseHandler dbh = DatabaseHandler.getInstance(getApplicationContext());
        myDeck = dbh.getDeck(deck_id);

        setTitle( "Deck menu : " + myDeck.getName());

        GetCardsFromDeck a = new GetCardsFromDeck(this, myDeck);
        a.execute(new ApiConnector());

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
        getSupportFragmentManager().beginTransaction().add(R.id.cardManagerLayout, f).commit();
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();

        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    private class InsertCardInDeck extends AsyncTask<ApiConnector, Long, JSONArray>{

        Card c;
        Deck d;
        boolean insert2;
        InsertCardInDeck(Card c ,Deck d, boolean insert2){
            this.c = c;
            this.d = d;
            this.insert2 = insert2;
            cards_in_deck.add(c.getName());
            if(insert2)
                cards_in_deck.add(c.getName());
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
    private class GetCardsFromDeck extends AsyncTask<ApiConnector, Long, ArrayList<String>>{

        Deck d;
        DeckActivity parent;
        public GetCardsFromDeck(DeckActivity l, Deck d){
            this.d = d;
            this.parent = l;
        }
        @Override
        protected ArrayList<String> doInBackground(ApiConnector... params) {
            ArrayList<String> result = new ArrayList<String>();
            JSONArray jsonArray = params[0].getCardsInDeck(d);
            final DatabaseHandler dbh = DatabaseHandler.getInstance(getApplicationContext());
            JSONObject jo = null;
            try{
                for(int i=0; i<jsonArray.length(); i++) {
                    jo = jsonArray.getJSONObject(i);
                    int card_id = jo.getInt("card");
                    String card_name = jo.getString("name");
                    result.add(card_name);
                    Button b = new Button(parent.getApplicationContext());
                    b.setText(card_name);
                    b.setTextColor(Color.BLACK);
                    myCardsLayout.addView(b);
                    b.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            Button btn = (Button) v;
                            Card c = dbh.getCard(btn.getText().toString());
                            CardDialog cd = new CardDialog(c);
                            cd.setDeckLayoutOptions(true);
                            cd.show(getSupportFragmentManager(), "CardDialog");
                        }
                    });
                }
            }catch(Exception e){
                e.printStackTrace();
            }
            return result;
        }

        @Override
        protected void onPostExecute(ArrayList<String> res) {
            cards_in_deck = res;
            //refreshCardListView();
        }
    }
}
