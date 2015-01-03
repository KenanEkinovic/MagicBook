package etf.magicbook;

import android.content.DialogInterface;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.DialogFragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.ArrayList;

/**
 * Created by Kenan on 3.1.2015.
 */
public class DeckStatistic extends DialogFragment {

    ArrayList<Card> cards_in_deck;
    Deck deck;

    public DeckStatistic(ArrayList<Card> cards_in_deck, Deck deck){
        this.cards_in_deck = cards_in_deck;
        this.deck = deck;
    }

    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.dialog_deck_statistics, null);
        setCancelable(true);

        getDialog().setTitle(deck.getName().replace('_',' ') + " : " + deck.getHero());

        //counters
        int spells =0, minions=0, weapons=0;
        int cost0 =0;
        int cost1 =0;
        int cost2 =0;
        int cost3 =0;
        int cost4 =0;
        int cost5 =0;
        int cost6 =0;
        int cost7 =0;
        int free = 0, common = 0, rare = 0, epic = 0, legendary = 0;
        for(int i=0; i<cards_in_deck.size(); i++)
        {
            Card c = cards_in_deck.get(i);
            switch (c.getRarity()){
                case "Free": free++; break;
                case "Common": common++; break;
                case "Rare": rare++; break;
                case "Epic": epic++; break;
                case "Legendary": legendary++; break;
            }
            switch (c.getType()){
                case "Minion": minions++; break;
                case "Spell": spells++; break;
                case "Weapon": weapons++; break;
            }
            switch (c.getCost()){
                case "0": cost0++; break;
                case "1": cost1++; break;
                case "2": cost2++; break;
                case "3": cost3++; break;
                case "4": cost4++; break;
                case "5": cost5++; break;
                case "6": cost6++; break;
                default: cost7++; break; //7 or more
            }
        }

        //type
        ((TextView) view.findViewById(R.id.txtNumSpells)).setText("Spells: "+ spells);
        ((TextView) view.findViewById(R.id.txtNumWeapons)).setText("Weapons: "+ weapons);
        ((TextView) view.findViewById(R.id.txtNumMinions)).setText("Minions: "+ minions);

        //rarity
        ((TextView) view.findViewById(R.id.txtNumCommon)).setText("Common: "+ common);
        ((TextView) view.findViewById(R.id.txtNumRare)).setText("Rare: "+ rare);
        ((TextView) view.findViewById(R.id.txtNumLegendary)).setText("Legendary: "+ legendary);
        ((TextView) view.findViewById(R.id.txtNumEpic)).setText("Epic: "+ epic);
        ((TextView) view.findViewById(R.id.txtNumFree)).setText("Free: "+ free);

        //cost
        ((TextView) view.findViewById(R.id.txtCost0)).setText("0: "+ cost0);
        ((TextView) view.findViewById(R.id.txtCost1)).setText("1: "+ cost1);
        ((TextView) view.findViewById(R.id.txtCost2)).setText("2: "+ cost2);
        ((TextView) view.findViewById(R.id.txtCost3)).setText("3: "+ cost3);
        ((TextView) view.findViewById(R.id.txtCost4)).setText("4: "+ cost4);
        ((TextView) view.findViewById(R.id.txtCost5)).setText("5: "+ cost5);
        ((TextView) view.findViewById(R.id.txtCost6)).setText("6: "+ cost6);
        ((TextView) view.findViewById(R.id.txtCost7)).setText("7+: "+ cost7);
        return view;
    }
}
