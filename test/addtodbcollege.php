<?php
include_once ($_SERVER['DOCUMENT_ROOT']."/utils/database.inc");
$con=get_defalult_connection();
mysql_select_db("fdb1",$con);

$handle = @fopen("filteredtext.txt", "r"); // Open file form read.
if ($handle) {
$count=1;
while (!feof($handle)) // Loop til end of file.
{
$buffer = fgets($handle, 4096); // Read a line.
if ($buffer) // Check for string.
{

	switch ($count) {
		case 1:
		$college=$buffer;	
		$count++;
		break;
		
		case 2:
		$address=$buffer;	
		$count++;
		break;
		
		case 3:
	$phone=str_replace("Phone: ","",$buffer);
	//	$phone=$buffer;	
		$count++;
		break;
		
		case 4:
		$fax=str_replace("Fax: ","",$buffer);
	//	$fax=$buffer;	
		$count++;
		break;
		
		default:
			$query="insert into colleges (college_name, college_address, phone, fax) values ('$college', '$address', '$phone', '$fax')";
			mysql_query($query,$con);
			$count=1;
			break;
	}
}

}
}
mysql_close($con);
?>