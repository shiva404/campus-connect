<?php
include_once ($_SERVER['DOCUMENT_ROOT']."/utils/newaccountutils.inc");
//echo "inside new";
$fname=$_POST['fname'];
$lname=$_POST['lname'];
$uname=$_POST['uname'];
$password=$_POST['password'];
$email=$_POST['email'];
$phno=$_POST['phno'];
$usn=$_POST['usn'];
$college_id=$_POST['college_id'];
add_user_to_db($fname, $lname, $uname, $password, $email, $phno, $usn, $college_id);


/*ater creating user try to login that user.. and write the common fn to set cookies */
?>