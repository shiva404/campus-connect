<?php
class Config{
private static $instance;
private static $config;

private function __construct(){
	self::$config = parse_ini_file($_SERVER['DOCUMENT_ROOT']."/config/config.ini");
}
public static function singleton()
{
	if (!isset(self::$instance)) {
		$className = __CLASS__;
		self::$instance = new $className;
	}
	return self::$instance;
}
public function getBaseDocument(){
	return self::$config['topic.detailpage'];
}
 public function getLoginPage(){
 	return self::$config['user.login'];
 }
 public function getRegisterPage() {
 	return self::$config['user.regiser'];
 }
public function getNewThreadPage(){
	return self::$config['user.newthread'];
}
public function getUserHomePage(){
	return self::$config['user.home'];
}
public function getNewTopicPage(){
	return self::$config['topic.new'];
}
public function getNewUserPage(){
	return self::$config['user.register'];
}
public function getUpdatePage(){
	return self::$config['user.updatepage'];
}
public function getTopicDetailPage(){
	return self::$config['topic.detail'];
}
public function getTopicUtils(){
return self::$config['utils.topic'];
}
public function getNewuserUtils(){
return self::$config['utils.newuser'];
}
public function getDataBaseUtils(){
return self::$config['utils.database'];
}
public function getCommonUtils(){
return self::$config['utils.common'];
}
public function getLoginUtils(){
	return self::$config['utils.login'];
}



public function getTestDoc(){
	return self::$config['test.doc'];
}

}
?>