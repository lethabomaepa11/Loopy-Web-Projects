<?php
 
 require("php/config.php");
 include("php/retrieveUser.php")
?>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="assets/css/fontawesome.css" rel="stylesheet">
    <link href="assets/css/brands.css" rel="stylesheet">
    <link href="assets/css/solid.css" rel="stylesheet">
  <link rel="stylesheet" href="css/index.css">

  <title>Public Bank - Banker </title>
  <script>
  //setTimeout(setCurrency("mainBalance"),10);
  </script>
  </head>
  <header id="notice" style="color: navy; background-color: inherit; border:none;height: 30px;">
    <p style="margin-top: 0px;color:#000;font-size: 10px;">
      <center>
        Personal Account: <?php echo $row['fullname'];?>
      </center>
    </p>
  </header>
  <body style="background-color: #fff;">
    <div style="margin-top: 33px;"></div>
    <div class="more" id="more">
      <div onclick="appear(false,'more');" class="new-close"></div>
      <center><h3>More</h3></center>
      <hr>
      <i onclick="appear(false,'more');"class="fa fa-circle-xmark float-right" style="color: red; margin-top: -45px;"></i>
      <ul>
        <li onclick="location.href = '../LoopyLite/chats.php'">Chat</p></li>
        <li class="comingSoon">Preferences *coming soon*</li>
        <li>Report a problem</li>
        <li>About</li>
        <li style="color: red;"i>Deactivate Account</li>
      </ul>
      <p style="margin-top: 30px; font-size: 9pt; text-align: center;">Bankyio by Lethabo Maepa 2023</p>
    </div>
    <div class="container-containers">
      <div onclick="window.location = 'MainAccountTrack.html';"class="balances">
     <center><h5>Available balance:</h5><h2 id="mainBalance" class="balance"><?php echo htmlspecialchars($row['balance']);?></h2></center>
      <p>Account number: 894638293</p>
      <p style="float: right; text-decoration: underline; color: white; margin-top: -30px;">Track history</p>
      </div>
      
      <div onclick="window.location = 'Beneficiaries.html';" class="tabs">
        <i class="fa fa-users float-right"  style="font-size: 15pt; margin-right: 2px; margin-top: 15px;"></i>
        <h3>Beneficiaries</h3>
      <p>Add/Remove Beneficiaries</p>
      <p>Transfer money</p></div>
      
      <div onclick="window.location = 'StockInvest.html';"class="tabs">
        <i class="fa fa-chart-line float-right"  style="font-size: 15pt; margin-right: 2px; margin-top: 15px;"></i>
        <h3>Stock Trading</h3>
      <p>Your stock: 2</p>
      <p>Balance: R 334,57</p></div>
      <div class="tabs tab-full">
        <i class="fa fa-chart-simple float-right"  style="font-size: 15pt; margin-right: 2px; margin-top: 15px;"></i>
        <h3>Save & Invest</h3>
      <p>Savings</p>
      <p>Investments</p></div>
      <div class="tabs right">
        <i class="fa fa-cash-register float-right"  style="font-size: 15pt; margin-right: 2px; margin-top: 15px;"></i>
        <h3>Recharge</h3>
      <p>Recharge your stock Account</p>
      <p>Buy Mobile</p>
      </div>
      
            <div onclick="window.location = 'Lottery.php'"class="tabs">
             <i class="fa fa-bowling-ball float-right"  style="font-size: 15pt; margin-right: 2px; margin-top: 15px;"></i>
              <h3>Lottery</h3>
            <p>Play Lotto</p>
            <p>Betting</p>
            </div></a>
      <div class="tabs tab-full"><h3>Loan</h3>
      <p>Apply for loan</p>
      <p>Check your balance</p>
      </div>
    </div>
    <script src="js/index.js"></script>
    <div style="margin-bottom: 80px;"></div>
  </body>
  <footer style="color: #6028e5; border-radius: 4px; box-shadow: 0 10px 10px rgba(0,0,0,0.5);">
    <div>
    <i class="fa fa-sign-out active" onclick="location = 'php/logout.php'"><p>Logout</p></i>
    <i class="fa fa-bell"><p>Alerts</p></i>
    <i class="fa fa-circle-plus iCenter"></i> 
    <a href="BankerProfile.php"><i class="fa fa-user-tie"><p>Profile</p></i></a>
    <i class="fa fa-bars" onclick="appear(true,'more');"><p>More</p></i>
    </div>
  </footer>
  </html>
