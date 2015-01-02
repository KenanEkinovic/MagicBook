package etf.magicbook;

import android.app.Activity;
import android.view.View.OnClickListener;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.provider.ContactsContract;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;

/**
 * Created by Kenan on 28.12.2014.
 */
public class DeckList extends Fragment {

    LinearLayout main_deck_layout;
    Button btnNewDeck;
    Spinner spinnerHero;
    EditText newDeckName;

    private OnFragmentInteractionListener mListener;

    public static DeckList newInstance() {
        DeckList fragment = new DeckList();
        Bundle args = new Bundle();
        fragment.setArguments(args);
        return fragment;
    }

    public DeckList() {
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View v = inflater.inflate(R.layout.fragment_deck_list, container, false);

        main_deck_layout = (LinearLayout) v.findViewById(R.id.main_deck_layout);
        DatabaseHandler dbh = DatabaseHandler.getInstance(v.getContext());
        dbh.deleteAllDecks();
        ArrayList<Deck> allDecks = dbh.getAllDecks();
        if(allDecks != null)
            if(allDecks.size() != 0)
                for(int j =0; j<allDecks.size(); j++) {
                    Button btnNew = new Button(v.getContext());
                    btnNew.setText(allDecks.get(j).getHero() + "\n" + allDecks.get(j).getName());
                    main_deck_layout.addView(btnNew);
                }
        spinnerHero = (Spinner) v.findViewById(R.id.spinnerHero);
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(v.getContext(),
                R.array.heroes_array, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinnerHero.setAdapter(adapter);
        newDeckName = (EditText) v.findViewById(R.id.txtNewDeckName);
        btnNewDeck = (Button) v.findViewById(R.id.btnNewDeck);
        btnNewDeck.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //Toast.makeText(v.getContext(), newDeckName.getText().toString() + " " + spinnerHero.getSelectedItem().toString(), Toast.LENGTH_SHORT).show();
                final DatabaseHandler dbh = DatabaseHandler.getInstance(getActivity().getApplicationContext());
                ArrayList<Deck> allDecks = dbh.getAllDecks();
                if(allDecks == null)
                    allDecks = new ArrayList<Deck>();
                if(allDecks.size() < 9) {
                    Deck d = new Deck(allDecks.size()+1, LogIn.PLAYER_USERNAME, newDeckName.getText().toString(), spinnerHero.getSelectedItem().toString(), 0, 0);

                    dbh.makeNewDeck(d); // creating the deck in the local database

                    new CreateDeck(d).execute(new ApiConnector()); // creating the deck in the main database
                    allDecks = dbh.getAllDecks();

                        //refresh deck list
                        main_deck_layout.removeAllViews();
                        for (int j = 0; j < allDecks.size(); j++) {
                            Button btnNew = new Button(v.getContext());
                            btnNew.setText(allDecks.get(j).getHero() + "\n" + allDecks.get(j).getName().replace('_',' '));
                            btnNew.setOnClickListener(new DeckButtonListener());
                            main_deck_layout.addView(btnNew);
                        }
                }
                else
                    Toast.makeText(getActivity().getApplicationContext(), "You can not have more than 9 decks", Toast.LENGTH_SHORT).show();
            }
        });

        new GetDecks(this).execute(new ApiConnector());
        return v;
    }

    public void onButtonPressed(Uri uri) {
        if (mListener != null) {
        }
    }

    @Override
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        try {
            mListener = (OnFragmentInteractionListener) activity;
        } catch (ClassCastException e) {
            //throw new ClassCastException(activity.toString()
            //      + " must implement OnFragmentInteractionListener");
        }
    }

    @Override
    public void onDetach() {
        super.onDetach();
        mListener = null;
    }

    public interface OnFragmentInteractionListener {
        public void onFragmentInteraction(Uri uri);
    }

    private class CreateDeck extends AsyncTask<ApiConnector, Long, JSONArray>{
        Deck d;
        CreateDeck(Deck d){
            this.d = d;
        }

        @Override
        protected JSONArray doInBackground(ApiConnector... params) {
            return params[0].createDeck(d);
        }

        @Override
        protected void onPostExecute(JSONArray jsonArray) {
            JSONObject jo = null;
            try{
                jo = jsonArray.getJSONObject(0);
                String result = jo.getString("newDeck");

                if(result.equals("0")){ //failed to create new deck
                    Toast.makeText(getActivity().getApplicationContext(), "Failed to create new deck", Toast.LENGTH_SHORT).show();
                }
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }

    private class GetDecks extends AsyncTask<ApiConnector, Long, JSONArray>{
        DeckList parent;

        GetDecks(DeckList l){
            parent = l;
        }

        @Override
        protected JSONArray doInBackground(ApiConnector... params) {
            return params[0].Decks(LogIn.PLAYER_USERNAME);
        }

        @Override
        protected void onPostExecute(JSONArray jsonArray) {
            final DatabaseHandler dbh = DatabaseHandler.getInstance(parent.getActivity().getApplicationContext());
            JSONObject jo = null;
            try{
                for(int i=0; i<jsonArray.length(); i++)
                {
                    jo = jsonArray.getJSONObject(i);
                    int id = Integer.valueOf(jo.getString("id"));
                    String name = jo.getString("Deck name");
                    String hero = jo.getString("Hero name");
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
                        //default: hero = "null"; //deck must have a hero set
                    }
                    int number_of_wins = Integer.valueOf(jo.getString("number_of_wins"));
                    int number_of_losses = Integer.valueOf(jo.getString("number_of_losses"));
                    Deck d = new Deck(id, LogIn.PLAYER_USERNAME, name.replace(' ','_'), hero, number_of_wins, number_of_losses);
                    dbh.createDeck(d); //putting a card into batch


                    Button btnDeck = new Button(parent.getActivity());
                    btnDeck.setText(hero + "\n" + name);
                    btnDeck.setOnClickListener(new DeckButtonListener());
                    main_deck_layout.addView(btnDeck);
                }
                dbh.executeDeckBatch();
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
        }
    }

    private class DeckButtonListener implements OnClickListener {
        @Override
        public void onClick(View v) {
            DatabaseHandler dbh = DatabaseHandler.getInstance(getActivity().getApplicationContext());
            Button btn = (Button)v;
            String deckName = (btn.getText().toString());

            for(int c = 0; c<deckName.length(); c++){
                if(deckName.charAt(c) == '\n') {
                    deckName = deckName.substring(c + 1);
                    break;
                }
            }
            Intent inte = new Intent(getActivity(), DeckActivity.class);
            Deck d = dbh.getDeck(deckName.replace(' ','_'));
            Bundle b = new Bundle();
            b.putInt("deck_id", d.getId());
            inte.putExtras(b);
            startActivity(inte);
        }
    }
}