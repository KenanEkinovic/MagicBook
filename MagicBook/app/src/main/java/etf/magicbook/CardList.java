package etf.magicbook;

import android.app.Activity;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.provider.ContactsContract;
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

import java.util.ArrayList;

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

        return v;
    }
    ArrayList<Card> cards;
    @Override
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);

        final DatabaseHandler dbh = DatabaseHandler.getInstance(getActivity().getApplicationContext());
        main_card_layout = (LinearLayout) getActivity().findViewById(R.id.main_card_layout);
        if(showDeckOptions) {
           cards = dbh.getCards(hero_id);
        }
        else {
           cards =  dbh.getCards(null);
        }

        for(int i=0; i<cards.size(); i++){
            Button btnCard = new Button(getActivity());
            btnCard.setText(cards.get(i).getName());
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



}