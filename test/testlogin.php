<?php
$uname = $_POST['uname'];
$password=$_POST['password'];
echo "User Name:".$uname."<br />";
echo "Password:".$password."<br />";
$con = mysql_connect("localhost","shiva","password123");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }
  $DB="fdb1";
  mysql_select_db('fdb1',$con);
  echo "done with connection";
  $query="select * from user";
	$result=mysql_query($query);
	echo $result;
	echo $query;

		while($row=mysql_fetch_array($result)){
			echo $row['name'];
			
		}
	
?>	