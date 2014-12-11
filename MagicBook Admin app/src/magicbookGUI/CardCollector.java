package magicbookGUI;

public class CardCollector {

	private static DBConnect DBconn;
	public static int card_id;
	
	public static void main(String[] args) {
		DBconn = new DBConnect();
		start();
	}
	
	public CardCollector(DBConnect connection){
		DBconn = connection;
		card_id = 1;
	}
	
	public static void start() {
		
		DBconn.executeUpdate("delete from card");
		card_id = 1;
		
			long startTime = System.currentTimeMillis();
			
			//new
				CardCollectionThread cct1 = new CardCollectionThread(DBconn, "Free_card_list","Free");
				CardCollectionThread cct2 = new CardCollectionThread(DBconn, "Common_card_list","Common");
				CardCollectionThread cct3 = new CardCollectionThread(DBconn, "Rare_card_list","Rare");
				CardCollectionThread cct4 = new CardCollectionThread(DBconn, "Epic_card_list","Epic");
				CardCollectionThread cct5 = new CardCollectionThread(DBconn, "Legendary_card_list","Legendary");
				cct1.start();
				cct2.start();
				cct3.start();
				cct4.start();
				cct5.start();
				
				try {
					cct1.join();
					cct2.join();
					cct3.join();
					cct4.join();
					cct5.join();
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			
		    System.out.println("Time: " + (( System.currentTimeMillis() - startTime )/(1000)));
	}

}
