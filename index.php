<?php 
include_once ($_SERVER['DOCUMENT_ROOT']."/config/config.php");
$config = Config::singleton();
if(isset($_COOKIE['id'])){
				header('Location: '.$config->getUserHomePage());
			}
			else{
				header('Location: '.$config->getLoginPage());
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
