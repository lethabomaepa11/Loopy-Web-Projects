<?php 
if($_SERVER['REQUEST_METHOD']=="POST")
{
  require_once("db.php");
  require_once("session.php");
  $uid = $_GET['uid'];
  
  $follow = "SELECT * FROM follows WHERE followed = '$uid' AND follower = '$id'";
  $fquery = mysqli_query($connect,$follow);
  //check if the user is already a follower, if yes, delete entry, if no insert
  
  //get the following count from the follower and update it
  $follower_id = "SELECT * FROM client WHERE unique_id = '$id'";
  $folwer = mysqli_fetch_assoc(mysqli_query($connect,$follower_id));
  $following_count = $folwer['following'];
  
  //get follower's count from followed and update
  $followed_id = "SELECT * FROM client WHERE unique_id = '$uid'";
  $folwed = mysqli_fetch_assoc(mysqli_query($connect,$followed_id));
  $followers_count = $folwed['followers'];
  
  
  if(mysqli_num_rows($fquery)==1)
  {
    //delete
    $query = "DELETE FROM follows WHERE followed = '$uid' AND follower = '$id'";
    $followers_count -= 1;
    $following_count -= 1;
    /**
    $activity = "unfollowed";
    db_add($connect,$id,$activity,$link,$privacy);
    */
    $activity = "unfollowed";
    $link = "account.php?uid=".$id;
    $to_user = $uid;
    $privacy = "public";
    db_add($connect,$id,$activity,$link,$privacy,$to_user);
  }
  else
  {
    //insert
    $query = "INSERT INTO follows(followed,follower) VALUES('$uid','$id')";
    $followers_count += 1;
    $following_count += 1;
    
    $activity = "followed";
    $link = "account.php?uid=".$uid;
    $to_user = $uid;
    $privacy = "public";
    db_add($connect,$id,$activity,$link,$privacy,$to_user);
  }
  
  //updated follower's following count and followed's follower_count
  $follower_up = "UPDATE client SET following = '$following_count' WHERE unique_id = '$id'";
  $followed_up = "UPDATE client SET followers = '$followers_count' WHERE unique_id = '$uid'";
  
  if(mysqli_query($connect,$query) && mysqli_query($connect,$follower_up) && mysqli_query($connect,$followed_up))
  {
    if(isset($_GET['locate']))
    {
       $view = $_GET['view'];
       $uid = $_GET['vid'];
       header("location: ../view.php?view=".$view."&uid=".$uid."");
    }
    else
    {
      header("location: ../account.php?uid=".$uid);
    }
  }
}
else if(isset($_GET['uid']) || isset($uid))
{
  $follow = "SELECT * FROM follows WHERE followed = '$uid' AND follower = '$id'";
  $fquery = mysqli_query($connect,$follow);
  if(mysqli_num_rows($fquery))
  {
    $follower = true;
  }
}