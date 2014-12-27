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

mysqli_close($conn);

?>




