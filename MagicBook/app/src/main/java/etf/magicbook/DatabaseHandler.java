package etf.magicbook;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import java.util.ArrayList;

/**
 * Created by Kenan on 28.12.2014.
 */
public class DatabaseHandler extends SQLiteOpenHelper {

    private static DatabaseHandler instance;
    public static DatabaseHandler getInstance(Context context){
        if(instance == null){
            instance = new DatabaseHandler(context);
        }
        return instance;
    }

    private static final int DATABASE_VERSION = 1;
    private static final String DATABASE_NAME = "magicbookdb";
    private static final String TABLE_CARDS = "card",
    KEY_ID = "id",
    KEY_NAME = "name",
    KEY_HERO = "hero",
    KEY_RARITY = "rarity",
    KEY_SUBTYPE = "subtype",
    KEY_TYPE = "type",
    KEY_HP = "hp",
    KEY_COST = "cost",
    KEY_ATTACK = "attack",
    KEY_PICTURE = "picture";

    private DatabaseHandler(Context context){
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }
    @Override
    public void onCreate(SQLiteDatabase db) {
        //db.execSQL("DROP TABLE IF EXISTS card");
        /*id,name,hero,  type,subtype,rarity,  cost,attack,hp, pictureURL*/
        db.execSQL("CREATE TABLE card (id INTEGER PRIMARY KEY, name TEXT, " +
                "hero INTEGER, type TEXT, subtype TEXT, rarity TEXT, " +
                "cost INTEGER, attack INTEGER, hp INTEGER, picture TEXT)");
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL("DROP TABLE IF EXISTS card");
        onCreate(db);
    }

    public void executeCardBatch(){
        SQLiteDatabase db = getWritableDatabase();
        try{
            db.beginTransaction();
            //System.out.println("Executing batch");
            for(int i=0; i<myCards.size();i++){
                //System.out.println("Inserting card");
                Card c = myCards.get(i);
                /*id,name,hero,  type,subtype,rarity,  cost,attack,hp, pictureURL*/
                ContentValues values = new ContentValues();
                values.put("id", c.getId());
                values.put("name", c.getName());
                values.put("hero", c.getHero());
                values.put("type", c.getType());
                values.put("subtype", c.getSubtype());
                values.put("rarity", c.getRarity());
                values.put("cost", c.getCost());
                values.put("attack", c.getAttack());
                values.put("hp", c.getHp());
                values.put("picture", c.getPictureURL());
                //System.out.println("Slika: "+ c.getPictureURL());
                //values.put("picture", "nista");
                db.insert("card",null,values);
            }
            db.setTransactionSuccessful();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            db.endTransaction();
            db.close();
            myCards = new ArrayList<Card>();
        }
    }

    private ArrayList<Card> myCards = new ArrayList<Card>();
    public void createCard(Card c){
        //SQLiteDatabase db = getWritableDatabase();
        myCards.add(c);
/*
        ContentValues values = new ContentValues();
        values.put("id", c.getId());
        values.put("name", c.getName());
        values.put("hero", c.getHero());
        values.put("type", c.getType());
        values.put("subtype", c.getSubtype());
        values.put("rarity", c.getRarity());
        values.put("cost", c.getCost());
        values.put("attack", c.getAttack());
        values.put("hp", c.getHp());
        //values.put("picture", c.getPictureURL());
        //System.out.println("Slika: "+ c.getPictureURL());
        values.put("picture", "nista");
        db.insert("card",null,values);*/
    }

    public Card getCard(String name){
        name = name.replace(' ','_');
        SQLiteDatabase db = getReadableDatabase();
        /*id,name,hero,  type,subtype,rarity,  cost,attack,hp, pictureURL*/
        String[] what = new String[]{"id","name","hero","type","subtype","rarity","cost","attack","hp","picture"};
        String[] where = new String[]{name};
        Cursor cursor = db.query("card", what, "name=?", where, null, null, null, null);
        if(cursor != null)
            cursor.moveToFirst();
        Card c = null;
        try {
            c = new Card(Integer.parseInt(cursor.getString(0)), cursor.getString(1), cursor.getString(2), cursor.getString(3),
                    cursor.getString(4), cursor.getString(5), cursor.getString(6), cursor.getString(7), cursor.getString(8), cursor.getString(9));
        }
        catch(Exception e){
            c = new Card(1,"","","","","","","","","");
        }
        db.close();
        return c;
    }
}
