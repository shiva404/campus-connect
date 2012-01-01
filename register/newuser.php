<?php 
include_once ($_SERVER['DOCUMENT_ROOT']."/utils/newaccountutils.inc");
$fullname=$_POST['fullname'];
$password=$_POST['password'];
$email=$_POST['email'];

add_new_user_to_db($fullname, $password, $email);

?>