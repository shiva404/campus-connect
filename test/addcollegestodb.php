<?php
$handle = fopen("resource.txt", "r");

$findThis = "Anrea";
$handle = @fopen("1.txt", "r"); // Open file form read.

if ($handle) {
	$college=true;
while (!feof($handle)) // Loop til end of file.
{
$buffer = fgets($handle, 4096); // Read a line.
if ($buffer!="\n") // Check for string.
{
//echo "<br/>Present string =".$buffer."<br />";
	
	if($college){
		echo "<br /><br />".$buffer."<br/>";
		$address=true;
		$phone=false;
		$fax=false;
		$college=FALSE;
		continue;
	}
	
	
	$zip_pattern = "Phone:.*";
	ereg($zip_pattern,$buffer,$regs);
	if($regs[0]){
//	echo "********* matched";
	echo "<br />".$regs[0];
	$fax=true;
	$phone=FALSE;
	$college=false;
	$address=false;
	$regs=NULL;
	continue;
	}
	
	$zip_pattern = "Fax:.*";
	ereg($zip_pattern,$buffer,$regs);
	if($regs[0]){
	echo "<br />".$regs[0];
	$phone=FALSE;
	$college=true;
	$address=false;
	$fax=FALSE;
	$regs=NULL;
	continue;
	}
		echo $buffer;
	
}
}
fclose($handle); // Close the file.
}

?>