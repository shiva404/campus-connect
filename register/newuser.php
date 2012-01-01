<?php 
include_once ($_SERVER['DOCUMENT_ROOT']."/config/config.php");
$config = Config::singleton();
include_once ($_SERVER['DOCUMENT_ROOT'].$config->getNewuserUtils());
$fullname=$_POST['fullname'];
$password=$_POST['password'];
$email=$_POST['email'];

add_new_user_to_db($fullname, $password, $email);

?>