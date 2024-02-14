<?php

session_start();
$connect = new mysqli("0.0.0.0","root","","Bankyio");


if($connect->connect_error)
{
  die("Failed to connect: ".$connect->connect_error);
}
