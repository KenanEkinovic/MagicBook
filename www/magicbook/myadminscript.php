<?php

$con= mysqli_connect("localhost", "root", "", "magicbookdb");
if(!$con)
{
die('Could not connect: ' . mysql_error());
}

mysqli_select_db($con, "magicbookdb");

$query = "";

if(isset($_GET["login"]))
	$query = sprintf("SELECT count(username) as 'login' from player where username='%s' and password='%s';", $_GET['username'], $_GET['password']);

$res1=mysqli_query($con, $query);

while($row= mysqli_fetch_assoc($res1)){
$output[]=$row;
}

print(json_encode($output));
mysqli_close($con);

?>




