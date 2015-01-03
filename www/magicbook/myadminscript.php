<?php

$conn= mysqli_connect("localhost", "root", "", "magicbookdb");
if(!$conn)
{
die('Could not connect: ' . mysql_error());
}

mysqli_select_db($conn, "magicbookdb");

$query = "";

if(isset($_GET["win"]))
{
	$update1 = FALSE;
	$update2 = FALSE;
	$query = sprintf("UPDATE deck SET number_of_wins=number_of_wins+1 where player=%d and id=%d", $_GET["player_id"], $_GET["deck_id"]);

	if($conn->query($query) == TRUE)
		$update1 = TRUE;
	
	$query = sprintf("UPDATE player set number_of_wins = number_of_wins+1 where id=%u", $_GET["player_id"]);

	if($conn->query($query) == TRUE)
		$update2 = TRUE;

	if($update1 && $update2)
		echo '[{"updateOK":"1"}]';	
	else
		echo '[{"updateOK":"0"}]';


}
else if(isset($_GET["loss"]))
{
	$update1 = FALSE;
	$update2 = FALSE;
	$query = sprintf("UPDATE deck SET number_of_losses=number_of_losses+1 where player=%d and id=%d", $_GET["player_id"], $_GET["deck_id"]);

	if($conn->query($query) == TRUE)
		$update1 = TRUE;
	
	$query = sprintf("UPDATE player SET number_of_losses=number_of_losses+1 WHERE id=%u", $_GET["player_id"]);

	if($conn->query($query) == TRUE)
		$update2 = TRUE;

	if($update1 && $update2)
		echo '[{"updateOK":"1"}]';	
	else
		echo '[{"updateOK":"0"}]';

}
else if(isset($_GET["insertCardInDeck"]))
{
	$query = sprintf("INSERT INTO cardindeck VALUES (%d, %d, %d)", $_GET["player_id"], $_GET["deck_id"], $_GET["card_id"]);
	if($conn->query($query) == TRUE)
	{
		if(!isset($_GET["doubleInsert"]))	
			echo '[{"cardInserted":"1"}]';
	}
	else
		echo '[{"cardInserted":"0"}]';

	if(isset($_GET["doubleInsert"]))
	{
		if($conn->query($query) == TRUE)
			echo '[{"cardInserted":"2"}]';
		else
			echo '[{"cardInserted":"0"}]';
	}
}
else if(isset($_GET["deleteCardFromDeck"]))
{
	$query = sprintf("DELETE FROM cardindeck WHERE player=%d AND deck=%d AND card=%d", $_GET["player_id"], $_GET["deck_id"], $_GET["card_id"]);
	if($conn->query($query) == TRUE)
		echo '[{"cardDeleted":"1"}]';
	else
		echo '[{"cardDeleted":"0"}]';
}
else if(isset($_GET["cardsInDeck"]))
{
	$query = sprintf("SELECT card, name FROM cardindeck LEFT JOIN card ON cardindeck.card = card.id
			 WHERE player=%d AND deck=%d", $_GET["player_id"], $_GET["deck_id"]);	
	$res1=mysqli_query($conn, $query);

	while($row= mysqli_fetch_assoc($res1)){
		$output[]=$row;
	}

	print(json_encode($output));
}
else if(isset($_GET["level"]))
{
	$query = sprintf("SELECT level FROM player WHERE id=%u", $_GET["player_id"]);
	
	$res1=mysqli_query($conn, $query);
		$row= mysqli_fetch_assoc($res1);

		if(!empty($row))
		{
			$output[]=$row;
			print(json_encode($output));
		}
		else
			echo '[{"level":"0"}]';

}
else if(isset($_GET["newDeck"]))
{
	$query = sprintf("INSERT INTO deck VALUES(%d,'%s',%d,%d,0,0)", 
		$_GET["id"], $_GET["name"], $_GET["hero"], $_GET["player_id"]);
	if($conn->query($query) == TRUE)
		echo '[{"newDeck":"1"}]';
	else
		echo '[{"newDeck":"0"}]';
}
else if(isset($_GET["deleteDeck"]))
{
	$deleted1 = FALSE;
	$deleted2 = FALSE;

	$query = sprintf("DELETE FROM cardindeck WHERE player=%u AND deck=%u", $_GET["player_id"], $_GET["deck_id"]);
	if($conn->query($query) == TRUE)
		$deleted1 = TRUE;


	$query = sprintf("DELETE FROM deck WHERE player=%u AND id=%u", $_GET["player_id"], $_GET["deck_id"]);
	if($conn->query($query) == TRUE)
		$deleted2 = TRUE;


	if($deleted1 && $deleted2)
		echo '[{"deletedDeck":"1"}]';
	else
		echo '[{"deletedDeck":"0"}]';

}
else if(isset($_GET["login"]))
{
	$query = sprintf("SELECT id as 'login' from player where username='%s' and password='%s'", $_GET['username'], $_GET['password']);

	
	$res1=mysqli_query($conn, $query);
	$row= mysqli_fetch_assoc($res1);

	if(!empty($row))
	{
		$output[]=$row;
		print(json_encode($output));
	}
	else
		echo '[{"login":"0"}]';
}
else if(isset($_GET["register"]))
{
	$query = sprintf("INSERT INTO player VALUES (NULL, '%s', '%s', 1, '%s', '0', '0')", $_GET['username'], $_GET['email'], $_GET['password']);
	
	if($conn->query($query) === TRUE)
		echo '[{"register":"1"}]';
	else
		echo '[{"register":"0"}]';
}
else if(isset($_GET["cards"]))
{
	$query = sprintf("SELECT * from card;");
	$res1=mysqli_query($conn, $query);

	while($row= mysqli_fetch_assoc($res1)){
		$output[]=$row;
	}

	print(json_encode($output));
}
else if(isset($_GET["cards_from_hero"]))
{
	$query = sprintf("select card.id, card.name, card.hero, card.rarity, card.type, card.subtype, card.cost,
			 card.attack, card.hp, card.picture
			 from card left join hero on card.hero = hero.id 
			 where hero.id is null or hero.id = '%s' ORDER BY `hero`.`id` DESC", $_GET['cards_from_hero']);
	$res1=mysqli_query($conn, $query);

	while($row= mysqli_fetch_assoc($res1)){
		$output[]=$row;
	}

	print(json_encode($output));
}
else if(isset($_GET["version"]))
{
	$query = sprintf("SELECT version as 'version' from db_version where id=1");
	$res1=mysqli_query($conn, $query);

	while($row= mysqli_fetch_assoc($res1)){
		$output[]=$row;
	}

	print(json_encode($output));
}
else if(isset($_GET["player_decks"]))
{
	$query = sprintf("SELECT deck.id, deck.name as 'Deck name', hero.name as 'Hero name', deck.number_of_wins, deck.number_of_losses 
			from deck left join hero on deck.hero = hero.id left join player on player.id = 
			deck.player where player.username ='%s'", $_GET['username']);
	$res1=mysqli_query($conn, $query);

	while($row= mysqli_fetch_assoc($res1)){
		$output[]=$row;
	}

	print(json_encode($output));
}


mysqli_close($conn);

?>




