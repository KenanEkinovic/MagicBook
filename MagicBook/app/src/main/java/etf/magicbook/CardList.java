package etf.magicbook;

import android.app.Activity;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Created by Kenan on 27.12.2014.
 */
public class CardList extends Fragment {

    LinearLayout main_card_layout;
    EditText txtSearchCards;
    boolean showDeckOptions;

    Integer hero_id;
    private OnFragmentInteractionListener mListener;

    public static CardList newInstance(boolean showDeckOptions, Integer hero_id) {
        CardList fragment = new CardList(showDeckOptions, hero_id);
        Bundle args = new Bundle();
        fragment.setArguments(args);
        return fragment;
    }

    public CardList(boolean showDeckOptions, Integer hero_id){
        this.showDeckOptions = showDeckOptions;
        this.hero_id = hero_id;
    }
    public CardList() {
        this.showDeckOptions = false;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View v = inflater.inflate(R.layout.fragment_card_list, container, false);

        DatabaseHandler dbh = DatabaseHandler.getInstance(v.getContext());
        dbh.deleteAllCards();

        return v;
    }

    @Override
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);

        DatabaseHandler dbh = DatabaseHandler.getInstance(getActivity().getApplicationContext());
        dbh.deleteAllCards();
        main_card_layout = (LinearLayout) getActivity().findViewById(R.id.main_card_layout);
        if(showDeckOptions)
            new GetCards(this, hero_id).execute(new ApiConnector());
        else
            new GetCards(this, 0).execute(new ApiConnector());

        txtSearchCards = (EditText) getActivity().findViewById(R.id.txtSearchCards);
        txtSearchCards.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                for(int i=0; i<main_card_layout.getChildCount(); i++)
                {
                    Button b = (Button) main_card_layout.getChildAt(i);
                    String str = b.getText().toString();
                    str = str.toLowerCase();
                    String ss = s.toString();
                    ss.toLowerCase();
                    if(str.contains(ss))
                        b.setVisibility(View.VISIBLE);
                    else
                        b.setVisibility(View.GONE);
                }
            }

            @Override
            public void afterTextChanged(Editable s) {

            }
        });
    }

    @Override
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        try {
            mListener = (OnFragmentInteractionListener) activity;
        } catch (ClassCastException e) {
            //    throw new ClassCastException(activity.toString()
            //          + " must implement OnFragmentInteractionListener");
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


    private class GetCards extends AsyncTask<ApiConnector,Long,JSONArray>{
        CardList parent;
        int hero_id;
        GetCards(CardList l, int hero_id){
            parent = l; this.hero_id = hero_id;
        }

        @Override
        protected JSONArray doInBackground(ApiConnector... params) {
            if(hero_id == 0)
                return params[0].Cards(null);
            else
                return params[0].Cards(hero_id);
        }

        @Override
        protected void onPostExecute(JSONArray jsonArray){
            final DatabaseHandler dbh = DatabaseHandler.getInstance(parent.getActivity());
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


                    Button btnCard = new Button(parent.getActivity());
                    btnCard.setText(name);
                    btnCard.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            Button btn = (Button) v;
                            Card c = dbh.getCard(btn.getText().toString());
                            CardDialog cd = new CardDialog(c);
                            cd.setDeckLayoutOptions(showDeckOptions);
                            //cd.setDeckLayoutOptions(true);
                            cd.show(getFragmentManager(), "CardDialog");
                        }
                    });
                    main_card_layout.addView(btnCard);
                }
                dbh.executeCardBatch();
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
        }
    }
}