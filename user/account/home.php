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
<html>
<head>

<link media="screen" type="text/css" href="/styles/style.css"
	rel="stylesheet" />

</head>
<body>
	<div class="home-page">
		<div class="leftside">
		<div class="profile-image">
		<img alt="Profile" src="/user/account/uploaded_files/shiva.jpg" width="100px" height="100px">
		</div>
			<div class="hovermenu">
				<ul>
					<li><a href="<?php $config->getUserHomePage();?>">News feed</a></li>
				</ul>
				<ul>
					<li><a href="<?php $config->getUserHomePage();?>">College</a>
					</li>
				</ul>
				<ul>
					<li><a href="<?php $config->getUserHomePage();?>">Upcoming Events</a></li>
				</ul>
				<ul>
					<li><a href="<?php $config->getUserHomePage();?>">Topics List</a></li>
				</ul>
				<ul>
					<li><a href="<?php $config->getUserHomePage();?>">xyz</a></li>
				</ul>
			</div>
			<div class="friends">
			<table>
				<tr>
					<td><?php get_my_friends($user_id) ?>
					</td>
				</tr>
			</table>
		</div>
		</div>
		
		<!--  
		<table>
			<tr>
				<td width="60%"><?php echo "Welcome,".$user_data['first_name']. $user_data['last_name']."!!";?>
				</td>
				<td><a href="<?php echo $config->getNewTopicPage()?>">Create new
						topic</a></td>
			</tr>
		</table>
		
		<table>
			<tr>
				<td width="20%">
					<table>
						<tr>
							<th><h2>My Threads</h2></th>
						</tr>
						<?php
						get_my_topics($user_id);
						?>
					</table>
				</td>		
				
			</tr>
		</table>
	-->
		
	</div>
</body>
</html>
