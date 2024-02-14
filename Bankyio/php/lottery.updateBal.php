<?php

require_once("config.php");
require_once("session.php");

if(isset($_GET['new']))
{
  $new = $_GET['new'];
  $sql = "UPDATE lottery SET balance = '$new' WHERE user_id = '$id'";
  if(mysqli_query($connect,$sql))
  {
    header("location: ../Lottery.php");
  }
}