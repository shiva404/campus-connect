<?php
include_once ($_SERVER['DOCUMENT_ROOT']."/utils/loginutils.inc");

$uname = $_POST['uname'];
$password=$_POST['password'];
echo "xyz";
$user=login($uname, $password);
echo "got some results";
if($user['auth']==false){
	echo "user is not valid";
	display_loginform_errormsg("user name/password entered is not valid");
}
else{
	foreach ($user as $key => $value) {
		setcookie($key, $value, time()+(3600*24*7),"/");
	}
	//setcookie("user_id", $user['id'], time()+(3600*24*7),"/");
	if(isset($_COOKIE['user_id'])){
	header('Location: /user/account/home.php');
	}
	else{
		header('Location: /user/account/home.php?user_id='.$user['id']);
	}
}
mysql_close($con);
?>