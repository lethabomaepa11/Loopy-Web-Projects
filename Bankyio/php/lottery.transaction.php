<?php

require_once("config.php");
require_once("session.php");

if(isset($_GET['transact']) && strlen($_GET['transact'])>0)
{
  //get balances for both lottery and main accounts
  $sql = "SELECT * FROM users WHERE user_id = '$id'";
  $main = mysqli_fetch_assoc(mysqli_query($connect,$sql));
  
  $sqll = "SELECT * FROM lottery WHERE user_id = '$id'";
  $lottery = mysqli_fetch_assoc(mysqli_query($connect,$sqll));
  
  $transact = $_GET['transact'];
  $sqls = [];
  $success = 0;
  if($transact == "recharge")
  {
    $amount = htmlspecialchars($_POST['inputRecharge']);
    $main_bal = $main['balance']-($amount+($amount*(1.528/100)));
    $lottery_bal = $lottery['balance']+$amount;
    $sqls[] = "UPDATE users SET balance = '$main_bal' WHERE user_id = '$id'";
    $sqls[] = "UPDATE lottery SET balance = '$lottery_bal' WHERE user_id = '$id'";
    for($x = 0; $x < 2; $x++)
    {
      if(mysqli_query($connect,$sqls[$x]))
      {
        $success++;
      }
    }
    if($success==2)
    {
      header("location: ../Lottery.php");
    }
  }
  else if($transact == "transfer")
  {
    $amount = htmlspecialchars($_POST['inputTransfer']);
    $lottery_bal = $lottery['balance']-($amount+($amount*(4.92/100)));
    $main_bal = $main['balance']+$amount;
    $sqls[] = "UPDATE users SET balance = '$main_bal' WHERE user_id = '$id'";
    $sqls[] = "UPDATE lottery SET balance = '$lottery_bal' WHERE user_id = '$id'";
    for($x = 0; $x < 2; $x++)
    {
      if(mysqli_query($connect,$sqls[$x]))
      {
        $success++;
      }
    }
    if($success==2)
    {
      header("location: ../Lottery.php");
    }
  }
}
else
{
  //header("location: ../Lottery.php");
}