<?php
include_once ($_SERVER['DOCUMENT_ROOT']."/config/config.php");
$config = Config::singleton();
?>
<div id="blueBarHolder" class="slim">
	<div id="blueBar" class=" fixed_elem">
		<div id="pageHead" class="clearfix slimHeader" >
			<div id="headNav" class="clearfix">
			<div class="rfloat">
				<a href="<?php echo $config->getLoginPage()."?logout=true";?>">logout</a>
			</div>
			</div>
		</div>
	</div>
</div>
