<?php

$conn= mysqli_connect("localhost", "root", "", "magicbookdb");
if(!$conn)
{
die('Could not connect: ' . mysql_error());
}

mysqli_select_db($conn, "magicbookdb");

$query = "";

if(isset($_GET["login"]))
{
	$query = sprintf("SELECT count(username) as 'login' from player where username='%s' and password='%s';", $_GET['username'], $_GET['password']);
	$res1=mysqli_query($conn, $query);

	while($row= mysqli_fetch_assoc($res1)){
		$output[]=$row;
	}

	print(json_encode($output));
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

mysqli_close($conn);

?>




