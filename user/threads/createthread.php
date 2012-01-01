<?php
include_once ($_SERVER['DOCUMENT_ROOT']."/config/config.php");
$config = Config::singleton();
include_once ($_SERVER['DOCUMENT_ROOT'].$config->getTopicUtils());
include_once ($_SERVER['DOCUMENT_ROOT'].$config->getDataBaseUtils());
if(isset($_POST['submitted'])){
	$topic_id=$_POST['topic_id'];
	$user_id=$_COOKIE['id'];
	$question=$_POST['question'];
	$today = date("Y-m-d H:i:s");
	$query="insert into questions (question, topic_id, user_id, created_at, updated_at)
values ('$question', $topic_id, $user_id, '$today', '$today')";
	$con=get_defalult_connection();
	mysql_select_db("fdb1",$con);
	$result=mysql_query($query,$con);
	header('Location: '.$config->getTopicDetailPage().'?topic_id='.$topic_id);
}
/* you need to validate whether the user who is accessing this is valid or not...
 other wise data missuse will happen
*/else{
$topic_id=$_GET['topic_id'];
$topic_detail=get_topic_details($topic_id);

?>
<form action="<?php echo  $_SERVER['PHP_SELF'];?>" method="post">
	<input type="hidden" value="<? echo $topic_id;?>" name="topic_id" /> <input
		type="hidden" value="true" name="submitted" />
	<table>
		<tr>
			<td><h3>
				
			<?php echo $topic_detail['name']?></h3></td>
		</tr>
		<tr>
			<td><i>created by: </i><b><?php echo $topic_detail['owner'] /* needs to be fixed */?>
			</b></td>
		</tr>
		<tr>
			<td><?php echo $topic_detail['description']?></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>Enter your question here</td>
		</tr>
		<tr>
			<td><textarea rows="3" cols="20" name="question"></textarea></td>
		</tr>
		<tr>
			<th>Threads created under this</th>
		</tr>
<?php /* display all the threads which wil comes under */ ?>
<tr><td><input type="submit" value="submit"/></td></tr>
</table>
</form>

<?php 
}
?>
