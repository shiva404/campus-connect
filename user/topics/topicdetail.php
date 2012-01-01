<?php
include_once ($_SERVER['DOCUMENT_ROOT']."/user/topics/topicutils.inc");
/* you need to validate whether the user who is accessing this is valid or not...
 other wise data missuse will happen
*/
$topic_id=$_GET['topic_id'];
$topic_detail=get_topic_details($topic_id);
?>
<table>
  <tr>
    <td width=60%>&nbsp;</td>
    <td><a href="/user/threads/createthread.php?topic_id=<?php echo $topic_detail[id]."&topic_name=".$topic_detail[name]; ?>">Create new thread</a></td>
  </tr>
</table>

<table>
<tr><td><h2><?php echo $topic_detail['name']?></h2></td></tr>
<tr><td><i>created by: </i><b><?php echo $topic_detail['owner'] /* needs to be fixed */?></b></td></tr>
<tr><td><?php echo $topic_detail['description']?></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><th>Threads created under this </th></tr>
<tr><td>
<table>
<tr><td>
<?php 
$topic_id=$_GET['topic_id'];
get_all_threads($topic_id);
?>
</td></tr>
</table>
</td></tr>
</table>