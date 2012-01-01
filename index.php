<?php 
if(isset($_COOKIE['id'])){
				header('Location: /user/account/home.php');
			}
			else{
				header('Location: /login/login.php');
			}

?>
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
