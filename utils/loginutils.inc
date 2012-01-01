<?php
include_once ($_SERVER['DOCUMENT_ROOT']."/utils/database.inc");

function login($uname, $password){
	$con=get_defalult_connection();
	$isemail = strpos($uname, "@");
	if ($isemail == false) {
		$query="select * from users where user_name='$uname' and password='$password'";
	}
	else{
		$query="select * from users where email_id='$uname' and password='$password'";
	}
	 mysql_select_db("fdb1",$con);
	$result=mysql_query($query,$con);
	if(!$result){
		echo "no result found";
		$row['auth']=false;
		return $row;
	}
	else{
		while($row=mysql_fetch_assoc($result)){
			$row['auth']=true;
			return $row;
		}
	}
}
?>