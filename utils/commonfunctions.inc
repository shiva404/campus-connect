<?php
include_once ($_SERVER['DOCUMENT_ROOT']."/config/config.php");
$config=Config::singleton();
include_once ($_SERVER['DOCUMENT_ROOT'].$config->getDataBaseUtils());
function get_college_list(){
	$con=get_defalult_connection();
	$query="select college_name,id from colleges";
	mysql_select_db("fdb1",$con);
	$result=mysql_query($query,$con);
	while($info = mysql_fetch_array( $result ))
	{
		echo "<option value=".$info['id'].">".$info['college_name']."</option>";
	}
	mysql_close($con);
}
function get_user_data($uid){
	$con=get_defalult_connection();
	$query="select * from users where id='$uid'";
	mysql_select_db("fdb1",$con);
	$result=mysql_query($query,$con);
	while($row=mysql_fetch_assoc($result)){
			$row['auth']=true;
			return $row;
	}
	mysql_close($con);
}
function get_topics($college_id){
	$con=get_defalult_connection();
	$query="select name,id from topics";
	mysql_select_db("fdb1",$con);
	$result=mysql_query($query,$con);
	while($info = mysql_fetch_array( $result ))
	{
		echo "<option value=".$info['id'].">".$info['name']."</option>";
	}
	mysql_close($con);
}
function get_parent_topics($college_id){
	$con=get_defalult_connection();
	$query="select name,id from topics where parent_id=0";
	mysql_select_db("fdb1",$con);
	$result=mysql_query($query,$con);
	while($info = mysql_fetch_array( $result ))
	{
		echo "<option value=".$info['id'].">".$info['name']."</option>";
	}
	mysql_close($con);
}
function get_my_threads($uid){
	$con=get_defalult_connection();
	$query="select name,id from topics where ";
	mysql_select_db("fdb1",$con);
	$result=mysql_query($query,$con);
	while($info = mysql_fetch_array( $result ))
	{
		echo "<option value=".$info['id'].">".$info['name']."</option>";
	}
	mysql_close($con);
}
function get_my_topics($uid){
	$config = Config::singleton();
	$con=get_defalult_connection();
	$query="select name,id from topics where owner=$uid and privacy=0";
	//echo $query;
	mysql_select_db("fdb1",$con);
	$result=mysql_query($query,$con);
	echo "<tr><th>Public Topics</th></tr>";
	if(!$result){
		echo "<tr><td><a href='".$config->getNewTopicPage()."'>+create new topic</a><td><tr>";
	}
	while($info = mysql_fetch_array( $result ))
	{
		echo "<tr><td><a href='".$config->getTopicDetailPage()."?topic_id=".$info['id']."'>".$info['name']."</a></td></tr>";
	}
	$query="select name,id from topics where owner=$uid and privacy=1";
	//echo $query;
	mysql_select_db("fdb1",$con);
	$result=mysql_query($query,$con);
	echo "<tr><th>Private Topics</th></tr>";
	while($info = mysql_fetch_array( $result ))
	{
		echo "<tr><td><a href='".$config->getTopicDetailPage()."?topic_id=".$info['id']."'>".$info['name']."</a></td></tr>";
	}
	mysql_close($con);
}
function get_my_friends($user_id){
	$con=get_defalult_connection();
	$query="select * from users where id in(
select user_id1 from friendrelation where user_id2=$user_id
union 
select user_id2 from friendrelation where user_id1=$user_id
)";
	
	//echo $query;
	mysql_select_db("fdb1",$con);
	$result=mysql_query($query,$con);
	echo "<tr><th>My friends</th></tr>";
	while($info = mysql_fetch_array( $result ))
	{
		echo "<tr><td><a href='/user/friends/friendsprofile.php?user_id=".$info['id']."'>".$info['first_name']." &nbsp;".$info['last_name'] ."</a></td></tr>";
	}
	mysql_close($con);
}
?>