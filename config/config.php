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
public function getTestDoc(){
	return self::$config['test.doc'];
}

}
?>