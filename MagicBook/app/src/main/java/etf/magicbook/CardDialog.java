package etf.magicbook;

import android.content.DialogInterface;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.DialogFragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Created by Kenan on 28.12.2014.
 */
public class CardDialog extends DialogFragment {

    Card myCard;

    boolean showDeckLayoutOptions;

    LinearLayout DeckCardLayout;
    public CardDialog(Card c){myCard = c;}
    public CardDialog(){}
    
    public void setDeckLayoutOptions(boolean showDeckLayoutOptions){
        this.showDeckLayoutOptions = showDeckLayoutOptions;
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.dialog_card_layout, null);
        getDialog().setTitle(myCard.getName().replace('_',' '));
        setCancelable(true);

        DeckCardLayout = (LinearLayout) view.findViewById(R.id.cardInDeckOptionsLayout);

        if(showDeckLayoutOptions) {
            DeckCardLayout.setVisibility(View.VISIBLE);
            initializeButtonListeners(view);
        }
        else
            DeckCardLayout.setVisibility(View.GONE);

        TextView t = (TextView) view.findViewById(R.id.card_name);
        t.setText(myCard.getName().replace('_',' '));
        t = (TextView) view.findViewById(R.id.card_attack);
        t.setText(" attack: "+myCard.getAttack());
        t = (TextView) view.findViewById(R.id.card_cost);
        t.setText("cost: "+ myCard.getCost());
        t = (TextView) view.findViewById(R.id.card_hero);
        if(myCard.getHero().equals("null") || myCard.getHero().equals(""))
            t.setText("All heroes");
        else
            t.setText("Hero: " + myCard.getHero());
        t = (TextView) view.findViewById(R.id.card_hp);
        t.setText(" hp: "+myCard.getHp());
        t = (TextView) view.findViewById(R.id.card_rarity);
        t.setText("Rarity: " +myCard.getRarity());
        t = (TextView) view.findViewById(R.id.card_subtype);
        if(myCard.getSubtype().equals("null") || myCard.getSubtype().equals(""))
            t.setText("");
        else
            t.setText("Subtype: " + myCard.getSubtype());
        t = (TextView) view.findViewById(R.id.card_type);
        t.setText("Type: "+myCard.getType());
        ImageView iv = (ImageView) view.findViewById(R.id.card_picture);
        new ImageLoadTask(myCard.getPictureURL(), iv).execute();
        return view;
    }

    @Override
    public void onDismiss(DialogInterface dialog) {
        super.onDismiss(dialog);
    }

    @Override
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
    }

    public class ImageLoadTask extends AsyncTask<Void, Void, Bitmap> {

        private String url;
        private ImageView imageView;

        public ImageLoadTask(String url, ImageView imageView) {
            this.url = url;
            this.imageView = imageView;
        }

        @Override
        protected Bitmap doInBackground(Void... params) {
            try {
                URL urlConnection = new URL(url);
                HttpURLConnection connection = (HttpURLConnection) urlConnection
                        .openConnection();
                connection.setDoInput(true);
                connection.connect();
                InputStream input = connection.getInputStream();
                Bitmap myBitmap = BitmapFactory.decodeStream(input);
                return myBitmap;
            } catch (Exception e) {
                System.out.println("nesto nije ok");
                System.out.print(url);
                e.printStackTrace();
            }
            return null;
        }

        @Override
        protected void onPostExecute(Bitmap result) {
            super.onPostExecute(result);
            imageView.setImageBitmap(result);
        }

    }

    private void initializeButtonListeners(View view){
        Button btnAddCard = (Button) view.findViewById(R.id.btnAddCard);
        CheckBox checkBoxAdd2Instance2 = (CheckBox) view.findViewById(R.id.checkBoxAdd2);
        if(myCard.getRarity().equals("Legendary"))
            checkBoxAdd2Instance2.setEnabled(false);
        final CheckBox checkBoxAdd2 = (CheckBox) view.findViewById(R.id.checkBoxAdd2);
        Button btnRemoveCard = (Button) view.findViewById(R.id.btnRemoveCard);
        btnAddCard.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                DeckActivity d = (DeckActivity) getActivity();
                if(myCard != null)
                //Toast.makeText(getActivity().getApplicationContext(), ""+myCard.getId(), Toast.LENGTH_SHORT).show();
                d.onDialogClosed(myCard.getId(), checkBoxAdd2.isChecked(), false);
                dismiss();
            }
        });
        btnRemoveCard.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                DeckActivity d = (DeckActivity) getActivity();
                d.onDialogClosed(myCard.getId(), false, true);
                dismiss();
            }
        });
    }

}
