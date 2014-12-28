package etf.magicbook;

/**
 * Created by Kenan on 28.12.2014.
 */
public class Card {
    private String name;
    private String type;
    private String hero;
    private String subtype;
    private String rarity;
    private String cost;
    private String attack;
    private String hp;
    private String pictureURL;
    private int id;

    /*id,name,hero,  type,subtype,rarity,  cost,attack,hp, pictureURL*/
    public Card(int id, String name, String hero, String type, String subtype, String rarity,
                String cost, String attack, String hp, String pictureURL){
        this.name = name;
        this.id = id;
        this.hero = hero;
        this.type = type;
        this.subtype = subtype;
        this.cost = cost;
        this.hp = hp;
        this.attack = attack;
        this.pictureURL = pictureURL;
        this.rarity = rarity;
    }

    public String getName() {
        return name;
    }

    public String getType() {
        return type;
    }

    public String getHero() {
        return hero;
    }

    public String getSubtype() {
        return subtype;
    }

    public String getRarity() {
        return rarity;
    }

    public String getCost() {
        return cost;
    }

    public String getAttack() {
        return attack;
    }

    public String getHp() {
        return hp;
    }

    public String getPictureURL() {
        return pictureURL;
    }

    public int getId() {
        return id;
    }
}
