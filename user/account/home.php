<?php
include_once ($_SERVER['DOCUMENT_ROOT']."/config/config.php");
$config = Config::singleton();
include_once ($_SERVER['DOCUMENT_ROOT'].$config->getCommonUtils());
if(isset($_COOKIE['id'])){
$user_id=$_COOKIE['id'];
}
else{
	$user_id=$_GET['user_id'];
}
$user_data=get_user_data($user_id);
?>
<table>
  <tr >
    <td width="60%"><?php echo "Welcome,".$user_data['first_name']. $user_data['last_name']."!!";?></td>
    <td><a href="<?php echo $config->getNewTopicPage()?>">Create new topic</a></td>
  </tr>
</table>

<table>
<tr>
<td width="20%">
<table>
<tr><th><h2>My Threads</h2></th></tr>
<?php
get_my_topics($user_id);
?>
</table>
</td>
<td width="60%">
<table><tr><td><?php echo "&nbsp;"?> </td></tr></table>
</td>
<td width="20%">
<table><tr><td><?php get_my_friends($user_id) ?> </td></tr></table>
</td>
</tr>
</table>