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

$directory_self = str_replace(basename($_SERVER['PHP_SELF']), '', $_SERVER['PHP_SELF']);
$uploadsDirectory = $_SERVER['DOCUMENT_ROOT'] . $directory_self . 'uploaded_files/';
$uploadSuccess = 'http://' . $_SERVER['HTTP_HOST'] . $directory_self . 'upload.success.php';
$fieldname = 'image';

$errors = array(1 => 'php.ini max file size exceeded',
2 => 'html form max file size exceeded',
3 => 'file upload was only partial',
4 => 'no file was attached');

isset($_POST['submit'])
or error('the upload form is neaded', $uploadForm);

$now = time();
while(file_exists($uploadFilename = $uploadsDirectory.$now.'-'.$_FILES[$fieldname]['name']))
{
	$now++;
}

@move_uploaded_file($_FILES[$fieldname]['tmp_name'], $uploadFilename)
or error('receiving directory insuffiecient permission', $uploadForm);

header('Location: ' . $uploadSuccess);

function error($error, $location, $seconds = 5)
{
	header("Refresh: $seconds; URL=\"$location\"");
	echo '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"'."\n".
    '"http://www.w3.org/TR/html4/strict.dtd">'."\n\n".
    '<html lang="en">'."\n".
    '    <head>'."\n".
    '        <meta http-equiv="content-type" content="text/html; charset=iso-8859-1">'."\n\n".
    '        <link rel="stylesheet" type="text/css" href="stylesheet.css">'."\n\n".
    '    <title>Upload error</title>'."\n\n".
    '    </head>'."\n\n".
    '    <body>'."\n\n".
    '    <div id="Upload">'."\n\n".
    '        <h1>Upload failure</h1>'."\n\n".
    '        <p>An error has occured: '."\n\n".
    '        <span class="red">' . $error . '...</span>'."\n\n".
    '         The upload form is reloading</p>'."\n\n".
    '     </div>'."\n\n".
    '</html>';
	exit;
}

?>