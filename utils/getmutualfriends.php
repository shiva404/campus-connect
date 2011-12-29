<?php
function get_mutualfriends($user_id){
$con=get_defalult_connection();
$get_friends_query=get_my_friends($user_id);
$mutual_friends=null;
foreach ($get_friends_query as $key=>$value) {
	$get_sub_friends=get_my_friends($user_id);
	foreach ($get_sub_friends as $key=> $value) {
		if(isset($mutual_friends[$value]));
	}
}
}
?>