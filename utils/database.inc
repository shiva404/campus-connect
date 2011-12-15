<?php
function get_connection(){
	
}
function get_defalult_connection(){
	$con = mysql_connect("localhost","shiva","password123","fdb1");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }
return $con;
}
?>