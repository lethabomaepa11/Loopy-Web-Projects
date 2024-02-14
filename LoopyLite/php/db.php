<?php

session_start();
$connect = new mysqli("localhost","root","","LoopyLite");

if($connect->connect_error)
{
  die("Failed to connect: ".$connect->connect_error);
};
require_once("activity.php");

?>