<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/register/newaccount.php" method="post" name="newaccount"> 
<table>
	<tr>
		<td>First Name:</td>
		<td><input type="text" name="fname" /></td>
	</tr>
	<tr>
		<td>Last Name:</td>
		<td><input type="text" name="lname" /></td>
	</tr>
	<tr><td>College:</td>
	<td><select name="college_id">
	<option value="none"></option>
	<?php 
	include_once ($_SERVER['DOCUMENT_ROOT']."/utils/commonfunctions.inc");
	get_college_list();
	?>
	</select></td>
	</tr>
	<tr>
		<td>Desired Login Name:</td>
		<td><input type="text" name="uname" /></td>
	</tr>
	<tr>
		<td>Choose a password:</td>
		<td><input type="password" name="password" /></td>
	</tr>
    <tr>
		<td>Re-enter password:</td>
		<td><input type="password" name="rpassword" /></td>
	</tr>
   	 <tr>
		<td>Email-Id:</td>
		<td><input type="text" name="email" /></td>
	</tr>
	 <tr>
		<td>Phone Number:</td>
		<td><input type="text" name="phno" /></td>
	</tr>
	 <tr>
		<td>USN:</td>
		<td><input type="text" name="usn" /></td>
	</tr>
	<tr>
	<td>&nbsp;</td>
	<td><input type="submit" value="submit" /></td>
	</tr>
</table>
</form>
</body>
</html>