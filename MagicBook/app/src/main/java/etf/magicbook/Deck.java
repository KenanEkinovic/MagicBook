package etf.magicbook;

/**
 * Created by Kenan on 1.1.2015.
 */
public class Deck {
    private String hero;
    private int id;
    private String name;
    private int number_of_wins;
    private int number_of_losses;
    private String player;
    public Deck(int id, String player, String name, String hero, int number_of_wins, int number_of_losses){
        this.id = id;
        this.name = name;
        this.hero = hero;
        this.number_of_losses = number_of_losses;
        this.number_of_wins = number_of_wins;
        this.player = player;
    }

    public String getPlayer(){
        return player;
    }

    public String getHero() {
        return hero;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getNumber_of_wins() {
        return number_of_wins;
    }

    public int getNumber_of_losses() {
        return number_of_losses;
    }
}
