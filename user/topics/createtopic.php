<?php 
include_once ($_SERVER['DOCUMENT_ROOT']."/utils/database.inc");
if(isset($_POST['submitted'])){
#	$threadname=$_POST['threadname'];
	$topicname=$_POST['topicname'];
	$privacy=$_POST['plevel'];
	if(isset($_POST['active'])){
		$active=$_POST['active'];
	}
	else $active=0;
	if($privacy==1){
		if(isset($_COOKIE['college_id']) && isset($_COOKIE['id'])){
		$college_id=$_COOKIE['college_id'];
		$user_id=$_COOKIE['id'];
	}
	else{
		echo "Cookies were not set";
	}
	$parent_id=$_POST['parenttopic'];
	}else if($privacy==0){
		$college_id=9999;
		$parent_id=9999;
		$user_id=$_COOKIE['id'];
	}
	$description=$_POST['desc'];
	
	$con=get_defalult_connection();
	$today = date("Y-m-d H:i:s");
	$query="insert into topics (name, description, created_at, updated_at, college_id,parent_id,privacy,is_active,owner)
	values('$topicname', '$description', '$today', '$today', $college_id, $parent_id, $privacy,$active,$user_id)";
	mysql_select_db("fdb1",$con);
	echo $query;
	$result=mysql_query($query,$con);

	mysql_close($con);
	
	header('Location: /user/account/home.php');
}
?>
<form action=<?php echo  $_SERVER['PHP_SELF'];?> method="post">
<input type="hidden" value="true" name="submitted"/>
<table>
<tr><td>Topic Name:</td>
<td><input type="text" name="topicname" /></td>
</tr>
<tr><td>Privacy Level</td>
<td>
<input type="radio" name="plevel" value="0" />Public<br/>
<input type="radio" name="plevel" value="1" />Private
</td>
</tr>
<tr>
<td><label id="topic">Parent Topic:</label></td>
<td><select name="parenttopic"><option value=""> &nbsp;</option>
<?php 
include_once ($_SERVER['DOCUMENT_ROOT']."/utils/commonfunctions.inc");
if(isset($_COOKIE['college_id'])){
		$college_id=$_COOKIE['college_id'];
	}
get_parent_topics($college_id)?>
</select></td>
</tr>
<tr>
<td>Description:</td>
<td><input type="text" name="desc"></td>
</tr>
<tr><td>&nbsp;</td>
<td><input type="checkbox" name="active" value="1">make topic active</td></tr>
<tr>
<td>&nbsp;</td>
<td><input type="submit" value="submit" /></td>
</tr>
</table>
</form>