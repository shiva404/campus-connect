<html>
<head>
<title>Welcome to College Connect-login page</title>
<link media="screen" type="text/css" href="/styles/style.css"
	rel="stylesheet">
</head>
<body>
	<div class="front-page">
		<div class="rightside">
			<form action="/login/login.php" method="post">
				<label>Login Name: <input name="uname" type="text" size="20" /></label><label>&nbsp;&nbsp;Password<input
					name="password" type="password" size="20" /></label><input type="submit"
					value="Login" />
			</form>
		</div>
		<div class ="front-signup" >
			<form action="/register/newuser.php" method="post">
			<table>
			<tr><td>Full Name: </td><td><input type="text" name="fullname" /></td></tr>
			<tr><td>Email: </td><td><input type="text" name="email" /></td></tr>
			<tr><td>Password: </td><td><input type="password" name="password" /></td></tr>
			<tr><td>Confirm Password: </td><td><input type="password" name="repassword" /></td></tr>
			<tr><td>&nbsp;</td><td><input type="submit" value ="Register"/></td></tr>
			</table>
			</form>
		</div>
	</div>
</body>
</html>


<!--  <table>
		<tr>
		<td>Login Name</td>
		<td><input name="uname" type="text" size="20" /></td> 
		</tr>
		<tr>
		<td>Passowrd</td>
		<td><input name="password" type="password" size="20" /></td> 
		</tr>
		<tr><td align="right">&nbsp;</td><td><input type="submit"  value="Login"/></td></tr>
		</table> 
-->
