package magicbookGUI;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CardCollector {

	private static DBConnect DBconn;
	private static int card_id;
	
	public static void main(String[] args) {
		DBconn = new DBConnect();
		start();
	}
	
	public CardCollector(DBConnect connection){
		DBconn = connection;
		card_id = 1;
	}
	
	private static String testRegex(String regex, String inputLine)
	{
		Pattern b = Pattern.compile(regex);
		Matcher m = b.matcher(inputLine);
		if(m.matches())
			return (m.group(1));
			
		return "";
	}
	
	private static void loadSite(String rarity) throws MalformedURLException, IOException
	{
		String URLExtension = rarity +"_card_list";
		findCardsOnSite(URLExtension, rarity);
	}
	
	public static void start() {
		
		DBconn.executeUpdate("delete from card");
		card_id = 1;
		
			long startTime = System.currentTimeMillis();
			
			try {
				loadSite("Free");
				loadSite("Common");
				loadSite("Rare");
				loadSite("Epic");
				loadSite("Legendary");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		    System.out.println("Time: " + (( System.currentTimeMillis() - startTime )/(1000)));
	}

	private static void findCardsOnSite(String URLExtension, String rarity) throws IOException,
			MalformedURLException {
		
		URLConnection conn;
		conn = (new URL("http://hearthstone.gamepedia.com/" + URLExtension)).openConnection();
		
		conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36");
		conn.setReadTimeout(0);
		conn.connect();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

		String inputLine;
		while ((inputLine = br.readLine()) != null)
		{
			if(inputLine.contains("<tr style=\"vertical-align: top;\">"))
			{
				String CardPart = "";
				
				while(!(inputLine.contains("</tr>")))
				{
					CardPart += inputLine;// + "\n";
					inputLine = br.readLine();
				}
				
				String name = "";
				String type = "";
				String subtype = "";
				long hero = 0;			
				
				String pictureURL = "";
				
				int cost =0;
				int attack =0;
				int hp =0;
				
				boolean card_is_valid = true;
				
				Pattern regex = Pattern.compile(".*<td class=.*<a href=\"(.*)\" title=\".*");
				Matcher m = regex.matcher(CardPart);
				if(m.matches())
				{
					System.out.println("Accesing site: ..."+m.group(1));
					
					URLConnection conn2 = (new URL("http://hearthstone.gamepedia.com"+m.group(1))).openConnection();
					
					conn2.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36");
					conn2.setReadTimeout(0);
					conn2.connect();
					
					BufferedReader br2 = new BufferedReader(new InputStreamReader(conn2.getInputStream()));

					
					String inputLine2;
					while ((inputLine2 = br2.readLine()) != null)
					{
						//check if uncollectible
						if(inputLine2.contains("<a href=\"/Uncollectible\" title=\"Uncollectible\">uncollectible</a>"))
						{
							card_is_valid = false;
							break;
						}
						//name
						if(inputLine2.contains("<title>"))
						{
							//<title>Bloodfen Raptor - Hearthstone: Heroes of Warcraft Wiki</title>
							regex = Pattern.compile(".*<title>(.*) -.*</title>*");
							m = regex.matcher(inputLine2);
							if(m.matches())
								name = m.group(1);
						}
						//type
						if(inputLine2.contains("<b>Type:</b>"))
						{
							inputLine2 = br2.readLine();
							inputLine2 = br2.readLine();
							type = testRegex(".*>(.*)</a>.*", inputLine2);
						}
						//subtype
						if(inputLine2.contains("<b>Subtype:</b>"))
						{
							inputLine2 = br2.readLine();
							inputLine2 = br2.readLine();
							subtype = testRegex(".*>(.*)</a>.*", inputLine2);
						}
						//hero
						if(inputLine2.contains("<th> <b>Class:</b>"))
						{
							inputLine2 = br2.readLine();
							inputLine2 = br2.readLine();
							String hero_name = testRegex(".*>(.*)</a>.*", inputLine2);

							switch(hero_name)
							{
								//id of hero in the database
								case "Priest": hero = 1; break;
								case "Warrior": hero = 2; break;
								case "Mage": hero = 3; break;
								case "Rogue": hero = 4; break;
								case "Druid": hero = 5; break;
								case "Warlock": hero = 6; break;
								case "Hunter": hero = 7; break;
								case "Paladin": hero = 8; break;
								case "Shaman": hero = 9; break;
							}
						}
						//cost
						if(inputLine2.contains("<th> <b>Cost:</b>"))
						{
							inputLine2 = br2.readLine();
							inputLine2 = br2.readLine();
							cost = Integer.parseInt(testRegex(".*<td> (.*) <img alt=\"Mana icon.png\".*", inputLine2));
						}
						//attack
						if(inputLine2.contains("<th> <b>Attack:</b>"))
						{
							inputLine2 = br2.readLine();
							inputLine2 = br2.readLine();
							attack = Integer.parseInt(testRegex(".*<td> (.*) <img alt=\"Attack icon.png\".*", inputLine2));
						}
						//HP
						if(inputLine2.contains("<th> <b>Health:</b>"))
						{
							inputLine2 = br2.readLine();
							inputLine2 = br2.readLine();
							hp = Integer.parseInt( testRegex(".*<td> (.*) <img alt=\"Health icon.png\".*", inputLine2));
						}
						//pictureURL
						if(inputLine2.contains("<div class=\"image\"><a href=\"/File:"))
						{
							String newURL = testRegex(".*src=\"(.*)\" width.*",inputLine2); //will be golden card if exists
							pictureURL = newURL;
							newURL = testRegex(".*src=\"(.*)\" width.*src=.*",inputLine2);
							if(!newURL.equals(""))
								pictureURL = newURL;
						}
					}
					
					if(card_is_valid){
						System.out.println(name + " " + hero + " " + type + " " + subtype + " " + cost + " " + attack + " " + hp + " ");
						System.out.println(pictureURL);
					}
				}
				
				if(card_is_valid)
				//creating the card into database
					createCard(name, rarity, type, subtype, hero, pictureURL, cost, attack, hp);
				
			}
			
		}
	}

	private static void createCard(String name, String rarity, String type,
			String subtype, long hero, String pictureURL, int cost, int attack,
			int hp) {
		if(name.contains("'"))
		{
			StringBuilder sbname = new StringBuilder(name);
			
			for(int j=0; j<sbname.length(); j++)
			{
				if(sbname.charAt(j)=='\'')
					sbname.setCharAt(j, '^');
					
			}
			name = sbname.toString();
		}
		String sql = "INSERT INTO card " +
		           "VALUES ("+card_id+", '"+name+"', ";
		card_id++;
		if(hero!=0)
			sql += ""+hero;
		else
			sql += "NULL";
		sql += ", '"+rarity+"', '"+type+"', ";
		if(subtype.equals(""))
			sql += "NULL";
		else
			sql += "'" + subtype + "'";
		sql += ", '"+cost+"', '"+attack+"', '"+hp+"','"+pictureURL+"' )";
		
		DBconn.executeUpdate(sql);
	}

}
