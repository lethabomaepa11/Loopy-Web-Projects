<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="assets/css/fontawesome.css" rel="stylesheet">
    <link href="assets/css/brands.css" rel="stylesheet">
    <link href="assets/css/solid.css" rel="stylesheet">
  <link rel="stylesheet" href="css/index.css">
  <script src="js/index.js"></script>
  <title>Public Bank - Homepage</title>
  <style>
    footer
    {
      animation: appearFromBottom ease-in-out 0.6s;
    }
  </style>
</head>
<body>
	<div class="header">
	  <img alt="Bankyio logo" src="assets/images/logo.png">
	  <i onclick="displayMenu(true,'menu')"class="fa fa-bars" id="bars"></i>
	  
	</div>
	<div class="menu" id="menu">
	  <i onclick="displayMenu(false,'menu');" class="fa fa-xmark float-left" id="xmark" style="display: none;"></i>
	  <ul>
	    <h2>Bankyio Bank</h2>
	    <br>
	    <li>Our services <i class="fa fa-bank"></i> </li>
	    <li>Vacancies <i class="fa fa-user-tie"></i> </li>
	    <li>Help and FAQ <i class="fa fa-question"></i> </li>
	    <li>Contact us <i class="fa fa-phone"></i></li>
	    
	  </ul>
	  <p>Bankyio web app practice by Lethabo Maepa 2023</p>
	
	</div>
	
	
	</div>
	<div class="first">
	  <img src="assets/images/calculator.jpg">
	  <br>
	  <h2>Get your smartphones ready... </h2>
	  <p>Today, 28 Nov... the app is growing and new features have been added.</p>
	  <p>Win some cash and become a millionaire overnight with our lottery games</p>
	  <p>Get yourself a brand new whip whippy doo and a crib</p>
	  <h4>Or</h4>
	  <p>You can grow your funds with stocks trading on our web app free of charge</p>
	  <a href="Login.html">Click here to login</a> OR <a href="createAccount.html">Create an account in seconds</a>
	  <p>Trust me, its worth it</p>
	  <h4>Join now!!</h4>
	</div>
	<div class="first second">
	  <img src="assets/images/coins.jpg">
	  <br>
	  <h2>Are you low on cash?
	  <br>Looking for capital for your startup?
	  <br>Looking to futher your studies?</h2>
	  <p>Don't worry, Bankyio Bank has got your back</p>
	  <p>Apply for a loan <b>Now!!</b> and pay back over 12 months or more 
	  <br>With an interest as little as 0.13%, we can guarantee you that it will benefit you</p>
	  <a href="#"><h3>APPLY NOW</h3></a>
	  <a href="#">Click here to learn more...</a>
	<br><br><br>
	</div>
	<div class="first second">
	  <img src=" assets/images/city.jpg">
	  <br>
	  <h2>Bankyio Bank for the People</h2>
	  <h4>We have: 
	  <br>1 234 employees
	  <br>100 560 satisfied customers
	  <br>18 branches across South Africa<br> and we're looking to expand overseas</h4>
	  <h3>Open an Account in seconds and start enjoying the benefits</h3>
	  <h4><a href="#">Click here</a> <br>Or click the <font color="navy">"Create Account"</font> button below to get started</h4>
	  <br><br><br>
	</div>
	<br><br><br><br>
	<footer>
	  <button onclick="window.location= 'Login.html';"class="btnLogin">Login</button>
	  <button onclick="window.location = 'createAccount.html';">Create an account</button>
	</footer>
	<script>
	  function displayMenu(display,type)
	  {
	    const element = document.getElementById(type).style;
	    const xmark = document.getElementById("xmark").style;
	    const bars = document.getElementById("bars").style;
	    
	    if(display == true && type=="menu")
	    {
	      element.animation = "menuAppear 0.5s ease-in-out";
	      element.display = "inline-block";
	      bars.display = "none"
	      xmark.display = "inline-block";
	      
	    }
	    else if(!display && type=="menu")
	    {
	      element.animation = "menuClose 0.5s ease-in-out";
	      setTimeout(function()
	      {
	      bars.display = "inline-block";
	      xmark.display = "none";
	      element.display = "none";
	      },500);
	    }
	    else
	    {
	      element.animation = "menuClose 0.5s ease-in-out";
	      element.display = "none";
	    }
	  }
	</script>
</body>
</html>