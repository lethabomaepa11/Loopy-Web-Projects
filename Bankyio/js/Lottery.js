//random text
//measure the time spent in lottery, will be useful later
let timeSpent = 0;
setInterval(function()
{
  let randomColor = Math.floor(Math.random() * 999999)+100000;
  let direction;
  if(randomColor<250000)
  {
    direction = "to right";
  }
  else if(randomColor<500000 && randomColor>250000)
  {
    direction = "to top";
  }
  else if(randomColor<750000 && randomColor>500000)
  {
    direction = "to bottom";
  }
  else
  {
    direction = "to left";
  }
  randomColor = "#"+randomColor;
  document.getElementById("dice").style.color = randomColor;
  document.getElementById("allBets").style.background = "linear-gradient("+direction+", #6028e5,"+randomColor+")";
  timeSpent += 2;//adds two seconds after each interval.will be useful later.
  document.getElementById("timeSpent").value = timeSpent;
  //console.log("time spent: "+timeSpent+" seconds");

},2000);

setInterval(function()
{
  //shows a random text every 30 seconds
  let arrText = ["Feeling lucky today neh?","\"In gambling, the many must lose in order that the few may win.\" - George Bernard Shaw","I Bet you will win today","Goodluck mate","Gambling can get addictive, know when to quit","A die hard loser or winner?","How much did you make already?","Money is calling you","Shine bright like money","I smell Money here","\"Luck is what happens when preparation meets opportunity.\" - Seneca","Cashing out soon","Loadshedding or not, I'm making money","\"The only sure thing about luck is that it will change.\" - Wilson Mizner","\"Quit while you're ahead. All the best gamblers do.\" - Baltasar Gracián","\"The gambling known as business looks with austere disfavor upon the business known as gambling.\" - Ambrose Bierce","\"The best throw of the dice is to throw them away.\" - English Proverb","\"Gambling: The sure way of getting nothing for something.\" - Wilson Mizner","\"Life is more fun if you play games.\" - Roald Dahl","\"The only gamble that life really allows us is love. Once a person's heart gets cynical, it's game over.\" - Haruki Murakami","\"The world is a casino, and most people are playing with scared money.\" - Terrence McKenna"];
  
  const randomTextElement = document.getElementById("randomText");
  let randomTextIndex = Math.floor(Math.random()*arrText.length);
  randomTextElement.innerHTML = arrText[randomTextIndex];
},10000);



 /*
 For lotto, receive 6 numbers from user
 then do a for loop that will create 6 unique numbers the numbers must not repeat or be duplicated
 insert the numbers in an Array
 then make another for loop which checks every number from user and compares it with the rest of the numbers in the array 
 use a counter variable which increments if the the numbers match, use it to determine how many numbers the user got right 
 then the prize is calculated by using odds and multiplying by the square of the number of correct numbers */
 
 
 
 function clearBet()
 {
   document.getElementById("mathBet").value = "";
   document.getElementById("lottoBet").value = "";
 }
 function allIn()
 {
   //still in development
   document.getElementById("mathBet").value = userBalance;
   document.getElementById("lottoBet").value = userBalance;
 }
 
 
 /*this function has bugs, will only available for lotto bet*/
 function addToBet(amount)
 {
   const lottoB = document.getElementById("lottoBet");
   const mathB = document.getElementById("mathBet");
   if((lottoB.value).length < 1 || (mathB.value).length < 1)
   {
     lottoB.value = amount;
     mathB.value = amount;
   }
   else
   {
     lottoB.value = parseFloat(lottoB.value)+amount;
    mathB.value = parseFloat(mathB.value)+amount;
   }
   
 }
 
/* 
 let Rand = Intl.NumberFormat('en-ZA', {
    style: 'currency',
    currency: 'ZAR',
});*/

let num1, num2;
let correct1, correct2,sum, bet,odds,estimatedReturn, betAmount;
let userBalance; //this will be fetched from database when intergrated
//example console.log('Money: ' + Rand.format(price));
function runOnload()
{
  console.log("pass");
    let bal;
   //balance.value = bal;
   //cut the R to make it an int
  
  document.getElementById("bal").style.display = "block";
  //bal = Rand.format(balance.value);
  bal = parseFloat(document.getElementById("bal").innerHTML);
  userBalance = parseFloat(document.getElementById("bal").innerHTML);
  //use ajax
  
   //balance = int(balance);
   
   //console.log(userBalance);
}
runOnload();
function mathUpGuess()
{
        correct1 = Math.floor(Math.random() * 15)+1;
        correct2 = Math.floor(Math.random() * 15)+1;
        sum = correct1+correct2;
        
        document.getElementById("clue").innerHTML = "Guess two possible numbers that add up to <b>"+sum+"</b>";
        
        document.getElementById("spanClue").innerHTML = sum;
        odds = (Math.random()*3)+1;//a float odd
        if(sum < 5 || sum > 26)
        {
          odds = 1.12345;
          //console.log("inside "+odds);
          //low odds
        }
        document.getElementById("mathBet").addEventListener("change",function()
        { 
          betAmount = parseFloat(document.getElementById("mathBet").value);
        
            document.getElementById("estimatedReturn").style.color = "#0ab40a";
            document.getElementById("mathSubmit").style.display 
            estimatedReturn = parseFloat((betAmount * odds)).toFixed(2);
        document.getElementById("estimatedReturn").innerHTML = "Estimated Return: "+Rand.format(estimatedReturn);
        document.getElementById("odds").innerHTML = "odds × bet amount = Return<br> "+odds.toFixed(2) + " × R "+betAmount+" = R "+estimatedReturn;
          
        
        });
}

mathUpGuess();//call the function once to create randomized numbers

function displayResult(type)
{
  document.getElementById(type).style.display = "none";
  document.getElementById("math-upR").style.display = "block";
  document.getElementById("amounts").style.display = "none";
}


function mathUpS(type)
{
document.getElementById("lottoR").style.display = "none";
document.getElementById("lottoS").style.display = "none";
  //receive the two numbers from the user
  const num1 = document.getElementById("num1").value;
  
  const num2 = document.getElementById("num2").value;
  //b listen for the submit button click
      
    //we do not care about the order in this bet
     betAmount = parseFloat(document.getElementById("mathBet").value)
    console.log(num1.length);
    if((num1 == correct1 || num1 == correct2) && (num2 == correct1 || num2 == correct2) && betAmount > 1)
    {
     
     estimatedReturn = parseFloat((betAmount * odds)).toFixed(2);
   // console.log("Before: " + userBalance);
    //console.log(estimatedReturn);
    userBalance = Number(userBalance);
    //userBalance = userBalance + parseFloat(estimatedReturn);

    userBalance += parseFloat(estimatedReturn);


      //console.log("After: "+userBalance);
      displayResult(type);
      document.getElementById("mathResult").style.color = "green";
    document.getElementById("mathResult").innerHTML = "You win<br><b>Return: +R "+estimatedReturn +"</b><br><br>";
    }
    else if(num1.length < 1 || num2.length <1 || betAmount < 1)
    {
      document.getElementById("estimatedReturn").style.color ="red";
      document.getElementById("estimatedReturn").innerHTML = "Please check your fields before submitting bet";
    }
    else
    {
     // console.log("bet: ",mathBet.value);
      userBalance -= parseFloat(mathBet.value);
      displayResult(type);
      document.getElementById("mathResult").style.color = "red";
      document.getElementById("mathResult").innerHTML = "Loss: Numbers don't match<br><b>Return: R 0 </b><br><br>";
    }
    
    document.getElementById("mathResult").innerHTML += "Your guess: "+num1+" and "+num2+"<br> Correct guess: "+correct1+" and "+correct2;
    setTimeout(function()
    {
      location.href = "php/lottery.updateBal.php?new="+userBalance;
    },1000);
}
 function clickedNow(type)
 {
   
   //
   
    //open the modal
    if(type != null)
    {
      document.getElementById("allBets").style.display = "block";
      document.getElementById("heading").style.color = "#6028e5"
      document.getElementById("heading").innerHTML = type;
      type += "S";//start
      document.getElementById(type).style.display = "block";
    }
    //console.log(type);
    //which game was pressed according to the id
    if(type === "lottoS")
    {
      document.getElementById("math-upR").style.display = "none";
      document.getElementById("lottoS").style.display = "block";
      document.getElementById("mathSubmit").style.display  = "none";
      document.getElementById("lottoSubmit").style.display  = "block";
      document.getElementById("mathBet").style.display = "none";
      document.getElementById("lottoBet").style.display = "inline";
    }
    else if(type === "math-upS")
    {
      document.getElementById("mathSubmit").style.display  = "block";
      document.getElementById("lottoSubmit").style.display  = "none";
      document.getElementById("mathBet").style.display = "inline";
      document.getElementById("lottoBet").style.display = "none";
    }
    const submit = document.getElementById("mathSubmit");
    
    //add event listener and function;
    submit.addEventListener('click', function()
    {
          bet = document.getElementById("mathBet");
          
          
          if(type === "math-upS")
          {
              //generate 2 random numbers between 1 abd 20 and add them
              //mathUpGuess();
              betAmount = parseFloat(document.getElementById("mathBet").value);
            if(betAmount>userBalance)
            {
              document.getElementById("estimatedReturn").style.color = "#f28080";
              document.getElementById("estimatedReturn").innerHTML = "Bet Amount cannot be greater than your current balance";
              
            }
            else
            {
              mathUpS(type);
        
              document.getElementById("balanceAfter").value = userBalance;
             //console.log(userBalance);
             
             document.getElementById("bal").innerHTML = Rand.format(userBalance);
            }  
          //console.log("inside the if of type math ",type);
          }
          /*else if(type === "lottoS")
          {
            console.log("type: LottoS ! ",type)
              lottoS();
          }*/
       //update everything
      //document.getElementById("balanceAfter").value = userBalance;
      console.log(userBalance);
      //document.getElementById("bal").innerHTML = Rand.format(userBalance);
    });
    document.getElementById("lottoSubmit").addEventListener("click", function()
    {
      lottoS();
    })
 }

 //when the continue button is clicked
 
const mathBtn = document.getElementById("math-upContinue");
mathBtn.addEventListener("click",function(type)
{
  
  document.getElementById("math-upS").style.display = "block";
  document.getElementById("math-upR").style.display = "none";
  document.getElementById("amounts").style.display = "block";
  document.getElementById("mathBet").value = "0";
  document.getElementById("estimatedReturn").innerHTML = "Estimated Return: "+Rand.format(0);
  document.getElementById("odds").innerHTML = "Place new Bet";
  document.getElementById("num1").value = "";
  document.getElementById("num2").value = "";
  //clickedNow("math-up");
  mathUpGuess();
});


//when the xmark is clicked
document.getElementById("noBet").addEventListener("click",function()
{
  // Get all elements with the class name "bets"
const betElements = document.getElementsByClassName("bets");

// Loop through the elements and set their display property to "none"
for (let i = 0; i < betElements.length; i++) {
    betElements[i].style.display = "none";
}

  document.getElementById("allBets").style.display = "none";
  
  document.getElementById("mathBet").value = "0";
  document.getElementById("estimatedReturn").innerHTML = "Estimated Return: "+Rand.format(0);
  document.getElementById("odds").innerHTML = "Place new Bet";
  mathUpGuess();
  location.reload();//refresh itself
});






//const autoPick = document.getElementById("autoPick");
/*when the auto pick button is clicked, it generates random numbers between 1 and 50 and fills the input fields 
or if the game played is math up, it takes the sum and generates numbers that could possibly sum up to that number*/
function autoPick(type)
{
  var i;
  let autoNum;
  let autoId;
 //deduct R2.50 from the Balance of the user
 if(5 <= userBalance)
 {
   userBalance = Number(userBalance-0.75).toFixed(2);
  //(document.getElementById("balanceAfter").value = Number(userBalance);
  document.getElementById("bal").innerHTML = Rand.format(userBalance);
  
  
    if(type==="lotto")
    {
      for(i = 1; i <= 6; i++)
      {
        autoNum = Math.floor(Math.random()*50)+1;
        autoId = "lotto"+i;
        document.getElementById(autoId).value = autoNum;
      }
    }
    else if(type === "math-up")
    {
      const sumClue = parseInt(document.getElementById("spanClue").innerHTML,10);
      let auto1,auto2;
      var i;
      //15 * 15 == 225 so i double the chances thrn 225*2 = 450
      console.log(sumClue);
      for(i = 0; i < (450); i++)
      {
        auto1 = Math.floor(Math.random()*15)+1;
        auto2 = Math.floor(Math.random()*15)+1;
        if((auto1+auto2) == sumClue)
        {
          document.getElementById("num1").value = auto1;
          document.getElementById("num2").value = auto2;
          break;//exit the loop
        }
      }
      
    }
 }
 else
 {
   document.getElementById("estimatedReturn").style.color = "white";
   document.getElementById("estimatedReturn").innerHTML = "We cannot allow you to use Auto Pick with a remaining balance of less than 5 Rands.";
 }
  
}


//function for lottoS
function lottoS()
{
  document.getElementById("estimatedReturn").innerHTML = "";
  console.log("here");
  if(document.getElementById("math-upS").style.display == "none" &&  document.getElementById("math-upR").style.display == "none")
  {
    document.getElementById("lottoS").style.display = "block";
    document.getElementById("amounts").style.display = "block";
    document.getElementById("allBets").style.display = "block"
    
  }
  else
  {
    document.getElementById("math-upS").style.display ="none";
    document.getElementById("math-upR").style.display = "none";
    document.getElementById("lottoS").style.display = "block";
    document.getElementById("amounts").style.display = "block";
    document.getElementById("allBets").style.display == "block"
  }
  
  
  
  
  let estimatedJackpot;
  let lottoOdds = (Math.random()*3)+1;;
  document.getElementById("lottoBet").addEventListener("change", function()
  {
    document.getElementById("estimatedReturn").style.backgroundColor = "#0a6d19";
    document.getElementById("estimatedReturn").style.fontSize = "13pt";
    document.getElementById("estimatedReturn").style.color = "white";
    document.getElementById("estimatedReturn").innerHTML = "";
    var r = 6;
    for(r = 6; r >= 2; r--)
    {
      if(r > 3)
      {
        estimatedJackpot = ((parseFloat(document.getElementById("lottoBet").value)*r*lottoOdds)*lottoOdds)*(r+lottoOdds);
      }
      else if(r == 3)
      {
        estimatedJackpot = ((parseFloat(document.getElementById("lottoBet").value)*lottoOdds)*lottoOdds-1)*(r+lottoOdds);
      }
      else
      {
        //when r is 2
        estimatedJackpot = (parseFloat(document.getElementById("lottoBet").value))*(lottoOdds+r);
      }
    //display on change

    document.getElementById("estimatedReturn").innerHTML += "Match "+r+" numbers:<b> "+Rand.format(estimatedJackpot) + "</b><br>";
    }
  });
  

  
  
  
  //my bet array that takes in all 6 numbers from user
document.getElementById("lottoSubmit").addEventListener("click", function()
{
    let arrMyBet = [];
    const lottoElements = document.getElementsByClassName("lotto");
    let run = true;
    for(var x = 0; x < lottoElements.length; x++)
    {
      if((lottoElements[x].value).length > 0 && (lottoElements[x].value).length <= 2)
      {
        arrMyBet[x] = parseInt(lottoElements[x].value, 10);
        run = true;
      }
      else
      {
        document.getElementById("estimatedReturn").innerHTML = "Check your numbers";
        run = false;
      }
    }
  
   if((document.getElementById("lottoBet").value).length >= 1 && run && parseFloat((document.getElementById("lottoBet").value)) <= userBalance && parseFloat((document.getElementById("lottoBet").value)) > 1)
   {
     //the minimum bet must be R1
    document.getElementById("lottoR").style.display = "block";
    document.getElementById("lottoS").style.display = "none";
    document.getElementById("amounts").style.display = "none";
    document.getElementById("myBet").innerHTML = "Your numbers are: <br><br><br><p class='user'>"+arrMyBet[0]+"</p><p class='user'>"+arrMyBet[1]+"</p><p class='user'>"+arrMyBet[2]+"</p><p class='user'>"+arrMyBet[3]+"</p><p class='user'>"+arrMyBet[4]+"</p><p class='user'>"+arrMyBet[5]+"</p>";
    //create new rules
    //let arrLotto = new Array();
    
    
    //randomize numbers showing them in results page
    //this will be displayed in the results page
    let elements = 0;
  let arrLotto = [];
  
  function flashNumber(elementId) {
      let counter = 0;
      let color;
      const intervalFunction = setInterval(function () {
          if (counter <= 50) {
              const lottoNum = Math.floor(Math.random() * 50) + 1;
             
              document.getElementById(elementId).innerHTML = lottoNum;
              color = "#"+ (Math.floor(Math.random() * 999999)+100);
              let aColor = "#"+ (Math.floor(Math.random() * 999999)+100);
              document.getElementById(elementId).style.background = "linear-gradient("+aColor+","+color+")";//creates a random color background
              counter++;
          } else {
              clearInterval(intervalFunction);
              const selectedNum = parseInt(document.getElementById(elementId).innerHTML, 10);
              arrLotto.push(selectedNum);
              elements++;
              if (elements < 6) {
                  setTimeout(() => flashNumber("lottor" + (elements + 1)), 500); // Delay before flashing the next number
              }
          }
      }, 50);
  }
  
  // Start the flashing for the first element
  flashNumber("lottor1");
  
//check how many numbers match

userBalance = userBalance - parseFloat(document.getElementById("lottoBet").value);
//document.getElementById("balanceAfter").value = userBalance;
document.getElementById("bal").innerHTML = Rand.format(userBalance);
//the total Return wait for the flashingnumber function to finish
document.getElementById("lottoContinue").style.display = "none";
document.getElementById("lottoReturn").innerHTML = "";
let lottoReturn = 0;
let arrMatches = [];
setTimeout(function()
{
  
  let matches = 0;
  
let p,y;
for(p = 0; p<6;p++)
{
  for(y = 0; y<6; y++)
  {
    if(arrMyBet[p] == arrLotto[y])
    {
      arrMatches[matches] = arrMyBet[p];
      matches++;//duplicate is allowed for now
      
    }
  }
}
//if it there are three matches or more
if(matches>=3)
{
  lottoReturn = ((parseFloat(document.getElementById("lottoBet").value)*matches*lottoOdds)*lottoOdds)*(matches+lottoOdds);
}
else if(matches == 2)
{
  lottoReturn = (parseFloat(document.getElementById("lottoBet").value))*(lottoOdds  + 2);
}
document.getElementById("lottoReturn").innerHTML = "<font color='green'>Total Winnings: <b>"+Rand.format(lottoReturn)+"</b></font><br>Matches(repetition allowed): "+matches+" times<br>Minimum of 2 matching numbers required for you to win<br>Matching numbers: ";

for(x = 0; x<arrMatches.length;x++)
{
  document.getElementById("lottoReturn").innerHTML += " - <b>"+arrMatches[x]+"</b>";
}
if(matches==0)
{
  document.getElementById("lottoReturn").innerHTML += "none";
}
document.getElementById("lottoReturn").style.color = "black";

userBalance = Number(lottoReturn + userBalance).toFixed(2);

/**
 * below is not recommended, its just for practical use, don't send such data through GET
 */
//send userBalance to database
setTimeout(function(){location.href = "php/lottery.updateBal.php?new="+userBalance;},1000);





//document.getElementById("balanceAfter").value = Number(userBalance);
document.getElementById("bal").innerHTML = Rand.format(userBalance);
console.log(userBalance);
document.getElementById("lottoContinue").style.display = "block";
},20000);
    
    
    //when the continue button is clicked
    document.getElementById("lottoContinue").addEventListener("click",function()
    {
      document.getElementById("lottoR").style.display = "none";
      document.getElementById("lottoS").style.display = "block";
      document.getElementById("amounts").style.display = "block";
      document.getElementById("lottoBet").value = "";
      document.getElementById("estimatedReturn").innerHTML = "";
      
      var count = 0;
      for(count = 0; count < 6; count++)
      {
        let id = "lottor"+(count+1);
        document.getElementById(id).innerHTML = "X";
      }
      
    });
   }
   else if(userBalance < parseFloat((document.getElementById("lottoBet").value)))
   {
     document.getElementById("estimatedReturn").style.color = "red";
     document.getElementById("estimatedReturn").style.backgroundColor = "#f28080";
     document.getElementById("estimatedReturn").innerHTML = "Insufficient Balance, try again";
     
   }
   else
   {
     document.getElementById("estimatedReturn").style.color = "red";
     document.getElementById("estimatedReturn").style.backgroundColor = "#f28080";
     document.getElementById("estimatedReturn").innerHTML = "Please check your bet amount and numbers and try again";
   }
},{once: true});//solves the bug i had where it ran this event function twice
}


function Transact(transactType)
{
  document.getElementById("transact").style.display = "block";
  document.getElementById(transactType).style.display = "block";
}

document.getElementById("historyMinimize").addEventListener("click",
function()
{
  document.getElementById("history").style.animation = "menuClose 0.5s ease-in-out";
  setTimeout(function()
  {
    document.getElementById("history").style.display = "none";
    document.getElementById("btnHistory").style.display = "block";
    document.getElementById("history").style.animation = "menuAppear 0.5s ease-in-out";
  
  },500);
});

document.getElementById("btnHistory").addEventListener("click",
function()
{
  document.getElementById("history").style.display = "block";
  document.getElementById("btnHistory").style.display = "none";
});

//for transfer and recharge inputs
document.getElementById("inputTransfer").addEventListener("change",
function()
{
  const value = parseFloat(document.getElementById("inputTransfer").value);
  let fees = value*(4.92/100);
  let total = value+fees;
  document.getElementById("feesTransfer").innerHTML = Rand.format(fees);
  document.getElementById("infoTransfer").innerHTML = Rand.format(total)+" will be deducted from lottery account, "+Rand.format(value)+" will be added into main account";
});

document.getElementById("inputRecharge").addEventListener("change",
function()
{
 // console.log("recharge");
  const value = parseFloat(document.getElementById("inputRecharge").value);
  let fees = value*(1.528/100);
  let total = fees+value;
  document.getElementById("feesRecharge").innerHTML = Rand.format(fees);
  document.getElementById("infoRecharge").innerHTML = Rand.format(total)+" will be deducted from main account, "+Rand.format(value)+" will be added into lottery account";
});