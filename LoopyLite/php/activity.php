<?php 
$activities = ["commented","followed","unfollowed","logged in","logged out","created an account","added a product","updated bio","updated profile","visited"];
$private = ["only me","public"];

function db_add($connect,$user_id,$activity,$link,$privacy,$to_user)
{
  $act = "INSERT INTO activity(user_id,activity,link,privacy,to_user) VALUES('$user_id','$activity','$link','$privacy','$to_user')";
  if(mysqli_query($connect,$act))
  {
    $success = true;
  }
}

?>