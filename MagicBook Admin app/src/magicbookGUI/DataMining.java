package magicbookGUI;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class DataMining {

	private static DBConnect DBconn;
	
	public static void main(String[] args) {
		DBconn = new DBConnect();
		start();
	}
	
	public DataMining(DBConnect connection){
		DBconn = connection;
	}
	
	
	
	public static void start() {
		
		DBconn.executeUpdate("delete from card");
		
		try {
			
			URLConnection conn; 
			
			long startTime = System.currentTimeMillis();
			
			int nuber_of_not_founds = 0;
			int number_of_IO_exceptions = 0;
			
			int i=0;
			while(nuber_of_not_founds < 2)
			{
				System.out.println("----Card: " + i);
				
				try{
					conn = (new URL("http://www.hearthpwn.com/cards/" + i)).openConnection();
					conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36");
					conn.setReadTimeout(0);
					conn.connect();
					
					BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
					
					boolean card_is_valid=true;
					
					//
					String name = "";
					String rarity = "";
					String type = "";
					long hero = 0;
					
					int cost;
					int attack;
					int hp;
					
					String pictureURL = "";
					//
					
					boolean image_not_found = true;
					
					String inputLine;
					String PageSource = "";
					while ((inputLine = in.readLine()) != null)
					{
						PageSource+=inputLine + "\n";
						//card name
						Pattern regex = Pattern.compile(".*hearthstone.gamepedia.com/(.*)\" target=.*");
						Matcher m = regex.matcher(inputLine);
						if(m.matches())
						{
							System.out.println("Name: " + m.group(1));
							name = m.group(1);
							continue;
						}

						//card type
						regex = Pattern.compile(".*<li>Type: <a href=.*>(.*)</a></li>");
						m = regex.matcher(inputLine);
						if(m.matches())
						{
							type = m.group(1);
							if(type.equals("Minion") || type.equals("Ability") || type.equals("Weapon"))
							{
								System.out.println("Type: " + m.group(1));
								continue;
							}
							else
							{
								System.out.println("Type: INVALID");
								card_is_valid = false;
								break;
							}
						}
						
						//is it a token?
						regex = Pattern.compile(".*>Token</span></li>.*");
						m = regex.matcher(inputLine);
						if(m.matches())
						{
							card_is_valid = false;
							break;
						}
						
						//rarity of the card
						regex = Pattern.compile(".*<li>Rarity:.*\">(.*)</a></li>.*");
						m = regex.matcher(inputLine);
						if(m.matches())
						{
							rarity = m.group(1);
							System.out.println("Rarity: " + rarity);
							continue;
						}
						
						//hero of the card
						regex = Pattern.compile(".*<li>Class:.*</span> (.*)</a></li>");
						m = regex.matcher(inputLine);
						if(m.matches())
						{
							switch(m.group(1))
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
							
							System.out.println("Hero: " + m.group(1));
							continue;
						}
						
						//picture url
						regex = Pattern.compile(".*data-imageurl=\"(.*)\".*");
						m = regex.matcher(inputLine);
						if(m.matches() && image_not_found)
						{
							pictureURL = m.group(1);
							System.out.println("Picture URL: " + pictureURL);
							image_not_found = false;
							continue;
						}
						
						//cost of the card
						//attack of the card
						//hp of the card
					}
					
					//create card
					if(card_is_valid)
					{
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
				                   "VALUES ("+i+", '"+name+"', "+hero+", '"+rarity+"', '"+type+"', '0', '0', '0','"+pictureURL+"' )";
						DBconn.executeUpdate(sql);
					}
					
					System.out.println("Valid card = " + card_is_valid);
					in.close();
				}
				catch(FileNotFoundException e)
				{
					nuber_of_not_founds++;
					i++;
					continue;
				}
				catch(IOException e)
				{
					number_of_IO_exceptions++;
					if(number_of_IO_exceptions == 4)
						throw e;
					continue;
				}
				
				nuber_of_not_founds=0;
				i++;
			}
			
		    System.out.println("Time: " + (( System.currentTimeMillis() - startTime )/(1000)));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		

	}

}
