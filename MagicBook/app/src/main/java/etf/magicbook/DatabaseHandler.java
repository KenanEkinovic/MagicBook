package etf.magicbook;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.widget.Toast;

import java.sql.SQLData;
import java.util.ArrayList;

import javax.security.auth.login.LoginException;

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

    private DatabaseHandler(Context context){
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }
    @Override
    public void onCreate(SQLiteDatabase db) {
        /*id,name,hero,  type,subtype,rarity,  cost,attack,hp, pictureURL*/
        db.execSQL("CREATE TABLE card (id INTEGER PRIMARY KEY, name TEXT, " +
                "hero INTEGER, type TEXT, subtype TEXT, rarity TEXT, " +
                "cost INTEGER, attack INTEGER, hp INTEGER, picture TEXT)");
        db.execSQL("CREATE TABLE deck (id INTEGER, player TEXT, name TEXT, hero INTEGER," +
                "number_of_wins INTEGER, number_of_losses INTEGER)");
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL("DROP TABLE IF EXISTS card");
        db.execSQL("DROP TABLE IF EXISTS deck");
        onCreate(db);
    }

    public void executeDeckBatch(){
        SQLiteDatabase db = getWritableDatabase();
        try{
            db.beginTransaction();
            for(int i=0; i<myDecks.size(); i++){
                Deck d = myDecks.get(i);
                ContentValues values = new ContentValues();
                values.put("id", d.getId());
                values.put("player", d.getPlayer());
                values.put("name", d.getName());
                values.put("hero", d.getHero());
                values.put("number_of_wins", d.getNumber_of_wins());
                values.put("number_of_losses", d.getNumber_of_losses());
                db.insert("deck", null, values);
            }
            db.setTransactionSuccessful();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally
        {
            db.endTransaction();
            db.close();
        }
    }

    public Deck getDeck(String name)
    {
        SQLiteDatabase db = getReadableDatabase();
        Cursor cursor = db.rawQuery("SELECT id, player, name, hero, number_of_wins, number_of_losses from deck where name=?", new String[]{name});
        if(cursor != null)
            cursor.moveToFirst();
        Deck d = null;
        try {
            d = new Deck(Integer.parseInt(cursor.getString(0)), cursor.getString(1), cursor.getString(2).replace('_',' '), cursor.getString(3), Integer.parseInt(cursor.getString(4)),
                    Integer.parseInt(cursor.getString(5)));
        }
        catch(Exception e){
            d = new Deck(0, LogIn.PLAYER_USERNAME,"","",0,0);
        }
        db.close();
        return d;
    }
    public Deck getDeck(int id){
        SQLiteDatabase db = getReadableDatabase();
        /*id,name,hero,  wins, losses*/
        String[] what = new String[]{"id","player","name","hero","number_of_wins","number_of_losses"};
        String[] where = new String[]{""+id, LogIn.PLAYER_USERNAME};
        Cursor cursor = db.rawQuery("SELECT id, player, name, hero, number_of_wins, number_of_losses from deck where id=? and player=?", new String[]{""+id, LogIn.PLAYER_USERNAME});
        //Cursor cursor = db.query("deck", what, "id=?", where, null, null, null, null);
        if(cursor != null)
            cursor.moveToFirst();
        Deck d = null;
        try {
            d = new Deck(Integer.parseInt(cursor.getString(0)), cursor.getString(1), cursor.getString(2).replace('_',' '), cursor.getString(3), Integer.parseInt(cursor.getString(4)),
                    Integer.parseInt(cursor.getString(5)));
        }
        catch(Exception e){
            d = new Deck(1, LogIn.PLAYER_USERNAME,"","",0,0);
        }
        db.close();
        return d;
    }
    public void deleteAllCards(){
        SQLiteDatabase db = getWritableDatabase();
        db.execSQL("DELETE FROM card");
    }
    public void deleteAllDecks(){
        SQLiteDatabase db = getWritableDatabase();
        db.execSQL("DELETE FROM deck");
    }
    public ArrayList<Deck> getAllDecks(){
        SQLiteDatabase db = getReadableDatabase();
        ArrayList<Deck> result = new ArrayList<Deck>();
        Cursor cursor = db.rawQuery("Select id, player, name, hero, number_of_wins, number_of_losses  from deck where player='"+ LogIn.PLAYER_USERNAME + "'", new String[]{});
        if(cursor.moveToFirst() == false)
            return null;
        do
        {
            result.add(new Deck(Integer.parseInt(cursor.getString(0)), cursor.getString(1), cursor.getString(2).replace('_',' '), cursor.getString(3), Integer.parseInt(cursor.getString(4)),
                    Integer.parseInt(cursor.getString(5))));
        }
        while(cursor.moveToNext());
        return result;
    }

    public void makeNewDeck(Deck d){
        SQLiteDatabase db = getWritableDatabase();

        ContentValues values = new ContentValues();
        values.put("id", d.getId());
        values.put("player", d.getPlayer());
        values.put("name", d.getName());
        values.put("hero", d.getHero());
        values.put("number_of_wins", d.getNumber_of_wins());
        values.put("number_of_losses", d.getNumber_of_losses());
        db.insert("deck",null,values);
        myDecks.add(d);
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
                try {
                    //db.insert("card", null, values);
                    db.insertOrThrow("card",null,values);
                }catch(Exception e){}
            }
            db.setTransactionSuccessful();
        }
        catch (Exception e)
        {
            //e.printStackTrace();
        }
        finally
        {
            db.endTransaction();
            db.close();
        }
    }
    private static ArrayList<Deck> myDecks = new ArrayList<Deck>();
    public void createDeck(Deck d){
        myDecks.add(d);
    }

    private static ArrayList<Card> myCards = new ArrayList<Card>();
    public void createCard(Card c){
        myCards.add(c);
    }

    public Card getCard(int id){
        SQLiteDatabase db = getReadableDatabase();
        Cursor cursor = db.rawQuery("SELECT id,name,hero,type,subtype,rarity,cost,attack,hp,picture FROM card WHERE id=?", new String[]{String.valueOf(id)});
        if(cursor != null)
            cursor.moveToFirst();
        Card c = null;
        try {
            int b = cursor.getInt(0);
            String a = cursor.getString(0);
            String a1 = cursor.getString(1);
            String a2 = cursor.getString(2);
            String a3 = cursor.getString(3);
            String a4 = cursor.getString(4);
            String a5 = cursor.getString(5);
            String a6 = cursor.getString(6);
            String a7 = cursor.getString(7);
            String a8 = cursor.getString(8);
            String a9 = cursor.getString(9);
            c = new Card(Integer.valueOf(a),a1,a2,a3,a4,a5,a6,a7,a8,a9);
        }
        catch(Exception e){
            c = new Card(1,"","","","","","","","","");
        }
        db.close();
        return c;
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
