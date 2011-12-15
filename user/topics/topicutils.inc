<?php 
include_once ($_SERVER['DOCUMENT_ROOT']."/utils/database.inc");
function get_topic_details($topic_id){
	$con=get_defalult_connection();
	$query="select * from topics where id=$topic_id";
	mysql_select_db("fdb1",$con);
	$result=mysql_query($query,$con);
	mysql_close($con);
	while($row=mysql_fetch_assoc($result)){
			$row['auth']=true;
			return $row;
		}
}
function get_all_threads($topic_id){
$con=get_defalult_connection();
	$query="select * from questions where topic_id=".$topic_id;
	mysql_select_db("fdb1",$con);
	$result=mysql_query($query,$con);
	mysql_close($con);
	while($info = mysql_fetch_array( $result ))
	{
	echo "<br/><h3>".$info['question']."</h3><br/><i>Created by".$info['user_id']."created at".$info['created_at'];
		#	echo "$info['id'].">".$info['college_name']."</option>";
	}
	mysql_close($con);
}
?>