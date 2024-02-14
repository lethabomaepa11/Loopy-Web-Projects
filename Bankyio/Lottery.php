<?php
  require_once("php/retrieveUser.php");
  require_once("php/config.php");
  $sql = "SELECT * FROM lottery WHERE user_id = '$id'";
  if(mysqli_num_rows(mysqli_query($connect,$sql))>0)
  {
    $data = mysqli_fetch_assoc(mysqli_query($connect,$sql));
  }
  else
  {
    //create a lottery account for this user and refresh page
    $sql = "INSERT INTO lottery(user_id) VALUES('$id')";
    if(mysqli_query($connect,$sql))
    {
      header("location: Lottery.php");
    }
  }
echo'


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="assets/css/fontawesome.css" rel="stylesheet">
    <link href="assets/css/brands.css" rel="stylesheet">
    <link href="assets/css/solid.css" rel="stylesheet">
  <link rel="stylesheet" href="css/index.css">

  <title>Public Bank - Lottery </title>
  <style>
  </style>
</head>
<header style="color: #000; background-color: white; height: 50px; border-bottom: 2px #ddd solid;">
  <i onclick="location.href = \'BankHomepage.php\';" class="fa fa-arrow-left float-left" style="margin-right: 15px; font-size: 16pt; margin-top: 18px;"></i>
    <h4 style="margin-top: 20px;">Lottery Account</h4>
<body>
  <input id="timeSpent" type="text" hidden>
  <!-- the input above will be sent to database when the user exits this page -->
  <!--the bet modal -->
  <!--<div style="margin-top: 33px;"></div>-->
  <div style="display: none;" class="allBets" id="allBets">
    <i onclick="location.reload()" id="noBet" class="fa fa-xmark float-right"></i>
   <br>
    <div class="betBalance">
      <center>
        <p id="randomText" style="margin: 0px;">Loading...</p>
        <br>
        <h5>Balance</h5>
        <h2 id="bal" class="balance">'.$data["balance"].'</h2>
      </center>
    </div>
    <div class="bet-container" style="height: auto; margin: 0;">
      <i id="dice" class="fa fa-dice fa-spin float-right move"></i>
      <i id="dice" class="fa fa-sack-dollar fa-spin float-right move" style="margin-right: 0;"></i>
      <h2 id="heading">Math up</h2>
      
      <div id="loading">
      </div>
      <!-- for math up -->
      <div style="display: none"id="math-upS" class="bet-start bets">
        <p style="font-size: 13pt;">Between 1 and 15</p>
        <p style="font-size: 13pt;"id="clue">Guess two possible numbers that</p>
        <input class="num" id="num1" required type="number">
        +
        <input class="num" id="num2" required type="number">
        =
        <b><span id="spanClue">5</span></b>
        <br>
        <br>
        <button style="width: 50px; margin: 0px; background: linear-gradient(to left,#6028e5,steelblue);" onclick="autoPick(\'math-up\');">Auto Pick</button>
      </div>
       <div style="display:none;" id="math-upR" class="bet-result">
        <p id="mathResult"></p>
        <button id="math-upContinue" style="margin-left: 15%">Continue</button>
      </div>
      <!--- math up ends here
      below is for Lotto--->
      <div style="display:none;" class="lottoS bets" id="lottoS">
        <p>Choose 6 numbers between 1 and 50</p>
        <input class="lotto num" id="lotto1" type="number">
        <input class="lotto num" id="lotto2" type="number">
        <input class="lotto num" id="lotto3" type="number">
        <input class="lotto num" id="lotto4" type="number">
        <input class="lotto num" id="lotto5" type="number">
        <input class="lotto num" id="lotto6" type="number">
        <br><br>
        <button style="width: 50px; margin: 0px; background: linear-gradient(to left,#6028e5,steelblue);" onclick="autoPick(\'lotto\');">Auto Pick</button>
      
        
      </div>
      <div style="display:none;" class="lottoR bets" id="lottoR">
        
        <div id="myBet" style="padding: 5px;"></div>
        <br>
        <h4>Winning numbers are:</h4>
        <br><br><br>
        <p id="lottor1"></p>
        <p id="lottor2"></p>
        <p id="lottor3"></p>
        <p id="lottor4"></p>
        <p id="lottor5"></p>
        <p id="lottor6"></p>
        <br>
        <br>
        <br><br>
        <div id="lottoReturn">
          
        </div>
        <button id="lottoContinue" style="margin-left: 15%; display: none;">Continue</button>
      </div>
      <!-- below is for score board --->
      <div style="display:none;" class="scoreS bets">
        <p>Predict the final score, the match will take 2 minutes to play and end</p>
        Team 1:<input class="num" type="number">
        Team 2:<input class="num" type="number">
      </div>
      <div style="display:none;" class="scoreR">
        
      </div>
      
      <!--below is code that will be available for all S - start div\'s -->
      <br><br><br>
      <div style="margin-top: -40px;"class="amounts" id="amounts">
        
       <!-- 
        <p style="color: #f28080;"id="minBet">Min bet: R 10.00</p>-->
       
        <p style="font-size: 9pt;">Auto Pick deducts R0.75 from your balance</p>
        <font color="#6028e5">Bet Amount: R</font><input style="display: none;" required id="mathBet" value="0" type="number">
        <input style="display:none;" required id="lottoBet" type="number" value="0">
          
        
        <br>
          <!-- 
        Still under development --->
         <div class="add">
          <h5>Add to Bet</h5>
        <button onclick="addToBet(10);"class="add">+10</button>
        <button onclick="addToBet(100);" class="add">+100</button>
        <button onclick="addToBet(1000);" class="add">+1000</button>
        <button onclick="allIn();">All in</button>
        <button style="background-color: red;" onclick="clearBet();">Clear</button>
        </div>
        <p style="color: steelblue; font-size: 13pt;" id="odds"></p>
        <p id="estimatedReturn"></p><!-- use estimatedReturn element to display errors and change color to error red-->
        <br>
        <button style="display: none;"id="mathSubmit">Submit bet</button>
        <button style="display: none;" id="lottoSubmit">Submit lotto bet</button>
      </div>
      <!--comment above ends here -->
     
    </div>
  </div>
    <div style="margin-top: 33px;"></div>
  <div class="container-containers">
    <div class="balances">
      <center><h5>Lottery Balance</h5>
      <h2 class="balance">'.$data["balance"].'</h2></center>
      <p>Lethabo Maepa</p>
    </div>
    <!--these are tabs for lottery types--->
    <div onclick="clickedNow(\'math-up\');"class="tabs lottery-info">
      <i class="fa fa-1 float-right"  style="font-size: 11pt; margin-right: 8px; margin-top: 20px;"></i>
      <i class="fa fa-add float-right"  style="font-size: 11pt; margin-right: 2px; margin-top: 20px;"></i>
      <i class="fa fa-1 float-right"  style="font-size: 11pt; margin-right: 2px; margin-top: 20px;"></i>
      <h3>Crazy Math up</h3>
      <p>Guess any two numbers on a certain condition and win big</p>
    </div>
    <div onclick="clickedNow(\'lotto\');" class="tabs right lottery-info">
      <i class="fa fa-circle float-right"  style="font-size: 15pt; margin-right: 2px; margin-top: 15px;"></i>
      <h3>Lotto</h3>
      <p>Bet any 6 numbers and match up for huge Jackpots</p>
    </div>
    <div onclick="Transact(\'transfer\');" class="tabs lottery-info">
      <i class="fa fa-upload float-right"  style="font-size: 15pt; margin-right: 2px; margin-top: 15px;"></i>
      <h3>Transfer</h3>
      <p>Transfer your winnings to your main account</p>
    </div>
    <div onclick="Transact(\'recharge\');"class="tabs right lottery-info">
      <i class="fa fa-download float-right"  style="font-size: 15pt; margin-right: 2px; margin-top: 15px;"></i>
      <h3>Recharge</h3>
      <p>Recharge your betting account here.</p>
    </div>
  </div>
  
  
  <div class="transactLottery" id="transact">
    <i class="fa fa-xmark float-right" style="color: red;" onclick="location.reload();"></i>
    <center>
    <div>
    <h4>Lottery Balance: </h4>
    <h4>Main Balance: </h4>
    <p class="balance" id="lotteryBal">'.$data["balance"].'</p>
    ';
    $main = "SELECT * FROM users WHERE user_id = '$id'";
    $mainData = mysqli_fetch_assoc(mysqli_query($connect,$main));
    echo'
    <p class="balance" id="mainBal">'.$mainData["balance"].'</p>
    </div>
    <form style="display: none;" id="recharge" action="php/lottery.transaction.php?transact=recharge" method="POST">
      <h3>Lottery Recharge</h3>
      
      <label class="absolute">Amount:</label><input name="inputRecharge" id="inputRecharge" type="number" placeholder="Recharge amount">
      <p>Fees: <span id="feesRecharge" style="color: red;">R 0,00</span></p>
      <p id="infoRecharge">R ??? will be deducted from main account, R ??? will be added into Lottery account</p>
      <button>Recharge from Main</button>
    </form>
    <form style="display: none;"id="transfer" action="php/lottery.transaction.php?transact=transfer" method="POST">
      <h3>Lottery Transfer</h3>
      
      <label class="absolute">Amount:</label><input name="inputTransfer" id="inputTransfer" type="number" placeholder="Transfer amount">
      <p>Fees: <span id="feesTransfer" style="color: red;">R 0,00</span></p>
      <p id="infoTransfer">R ??? will be deducted from lottery account, R ??? will be added into main account</p>
      <button>Transfer to Main</button>
    </form>
    <button style="background-color: transparent;color: #6028e5; border: #6028e5 2px solid;" id="btnHistory">Show History</button>
    <div id="history">
    <hr>
    <i id="historyMinimize" class="fa fa-circle-xmark float-right" style="color: #6028e5;"><p>Hide</p></i>
    <h2>History</h2>
    <div>
    <h3>Transaction & Date</h3><h3>Amount</h3>
    </div>
    <div class="hist" style="height: 300px; width: 90%; border-radius: 25px; background-color: #1c0357; color: white;">
      
      <h4>Recharge: 25 Dec</h4><p>R 500,00</p>
      <h4>Transfer: 22 Dec</h4><p>R 4 560,00</p>
      <h4>Recharge: 22 Dec</h4><p>R 50,00</p>
      <h4>Transfer: 20 Dec</h4><p>R 560,00</p>
      <h4>Recharge: 20 Dec</h4><p>R 30,00</p>
      <h4>Recharge: 19 Dec</h4><p>R 60,00</p>
      <h4>Recharge: 15 Dec</h4><p>R 50,00</p>
      <h4>Transfer: 10 Dec</h4><p>R 560,00</p>
    </div>
    </div>
    </center>
    
  </div>
  <script>
  const balances = document.getElementsByClassName("balance");
   for(var x = 0; x < balances.length; x++)
   {
     balances[x].innerHTML = Rand.format(parseFloat(balances[x].innerHTML))
   }
   </script>
   <script src="js/Lottery.js"></script>
  
</body>

</html>';

?>