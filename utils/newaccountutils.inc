<?php
include_once ($_SERVER['DOCUMENT_ROOT']."/utils/database.inc");
function add_user_to_db($fname, $lname, $uname, $password, $email, $phno, $usn, $college_id){
	$con=get_defalult_connection();
	mysql_select_db("fdb1",$con);
	$today = date("Y-m-d H:i:s");
	$query="Insert into users(first_name, last_name, email_id, mobile, user_name, password,created_at, updated_at, usn,college_id) ".
	"values('$fname', '$lname', '$email','$phno','$uname', '$password','".$today."','".$today. "','".$usn."',".$college_id.")";
	mysql_query($query,$con);
	mysql_close($con);
}
/* if user name or email already exists throw exception */
function check_for_usr(){
	$con=get_defalult_connection();
	mysql_select_db("fdb1",$con);
}

function add_new_user_to_db($fullname, $password, $email){
	$con=get_defalult_connection();
	mysql_select_db("fdb1",$con);
	$today = date("Y-m-d H:i:s");
	$query="Insert into users(first_name, email_id, password,created_at, updated_at) ".
		"values('$fname', '$email','$password','".$today."','".$today.")";
	mysql_query($query,$con);
	mysql_close($con);
}
?>