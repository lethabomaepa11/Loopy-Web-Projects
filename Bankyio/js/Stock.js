
//get the elements to be used

//stock class and object
 /*let Rand = Intl.NumberFormat('en-ZA', {
    style: 'currency',
    currency: 'ZAR',
});*/
//add stock to Array

//stock1 => RIM, stock2 => RIM micro, stock3 => Banky, stock4 => Bully

//forex or stock trading
let currentPrice = 1650;

let turn = 0, totPrice = 0;
let buseSellers = 0,buseBuyers = 0, busePrice = 25000;


setInterval(function()
{
  let randomNumber = 0;
  let buyPrice = 1000;
  let profit = 0;
  let turnTime = Math.floor(Math.random()*15)+1;
  
  //RIM
    randomNumber = (Math.random()*100)+(-50);
    currentPrice += randomNumber;
    
    if(parseFloat(document.getElementById("stockPrice-1").value) < currentPrice)
    {
      document.getElementById("stockCP-1").style.color = "green";
    }
    else
    {
      document.getElementById("stockCP-1").style.color = "red";
    }
    document.getElementById("stockPrice-1").value = currentPrice;
    document.getElementById("stockCP-1").innerHTML = "Price: "+ Rand.format(currentPrice.toFixed(2));
    if(currentPrice>parseFloat(document.getElementById("stockHigh-1").innerHTML))
    {
      document.getElementById("stockHigh-1").innerHTML = currentPrice.toFixed(2);
    }
    
    if(currentPrice<parseFloat(document.getElementById("stockLow-1").innerHTML))
    {
      document.getElementById("stockLow-1").innerHTML = currentPrice.toFixed(2);
    }
    
    //Banky 
    let numWorkers = (Math.random()%200)+10;
    let pricePerUnit = (Math.random()%130)+70;
    let unitPerWorker = (Math.random()%20)+2;
    //let sales = (Math.random()%1000)+(-50);
    totPrice += +(numWorkers*unitPerWorker)*pricePerUnit*(unitPerWorker);//total price 
    
    //totPrice += sales;
    totPrice -= (totPrice*10/100);//tax
    let bankyPrice = document.getElementById("stockCP-2");
    let bankyHigh = document.getElementById("stockHigh-2");
    let bankyLow = document.getElementById("stockLow-2");
    let bankyPricer = document.getElementById("stockPrice-2");
    
    document.getElementById("stockName-2").innerHTML = "Banky Banker";
    
    if(numWorkers>95 && unitPerWorker>12)
    {
      totPrice += (Math.random()%1000)+400;
    }
    else if(numWorkers<10 || pricePerUnit < 70)
    {
      totPrice += (Math.random()%0)+(-55000);
    }
    
    bankyPrice.innerHTML = "Price: "+Rand.format(totPrice.toFixed(2));
    if(totPrice<parseFloat(bankyPricer.value))
    {
      bankyPrice.style.color = "red";
    }
    else
    {
      bankyPrice.style.color = "green";
    }
    bankyPricer.value = totPrice;
    
    if(totPrice>parseFloat(bankyHigh.innerHTML))
    {
      bankyHigh.innerHTML = totPrice.toFixed(2);
    }
    if(totPrice<parseFloat(bankyLow.innerHTML))
    {
      bankyLow.innerHTML = totPrice.toFixed(2);
    }
    
    
    //BuSe stock
    buseBuyers = (Math.random()%15);
    buseSellers = (Math.random()%15);
    let buseRatio = +(buseBuyers/buseSellers);//must be positive
    //console.log("Buyers "+buseBuyers);
    //console.log("Sellers: "+buseSellers);
    //console.log(buseRatio);
    if(buseBuyers>buseSellers)
    {
      //bullish
      busePrice += (busePrice*buseRatio)*0.003;
      //console.log(">"+busePrice);
      //e.g (160*(10/5)/15);
    }
    else if(buseBuyers==buseSellers)
    {
      busePrice += 0;
    }
    else
    {
      busePrice -= (busePrice*buseRatio/20)*0.5;
      //console.log("<"+busePrice);
    }
    
    //displaying it on the page
    let busePriceEl = document.getElementById("stockCP-3");
    let buseHigh = document.getElementById("stockHigh-3");
    let buseLow = document.getElementById("stockLow-3");
    let buseInput = document.getElementById("stockPrice-3");
    document.getElementById("stockName-3").innerHTML = "BuSe IV";
    
    busePriceEl.innerHTML = "Price: "+Rand.format(busePrice.toFixed(2));
    
    if(busePrice<parseFloat(buseInput.value))
    {
      busePriceEl.style.color = "red";
    }
    else
    {
      busePriceEl.style.color = "green";
    }
    
    buseInput.value = busePrice;
    
    
    if(busePrice>parseFloat(buseHigh.innerHTML))
    {
      buseHigh.innerHTML = busePrice.toFixed(2);
    }
    if(busePrice<parseFloat(buseLow.innerHTML))
    {
      buseLow.innerHTML = busePrice.toFixed(2);
    }
    
    
    
    
    
    
    
    
    
    
  if(turn == turnTime)
  {
    //console.log(turn+" is it "+turnTime);
    currentPrice += 200;
    turnTime = Math.floor(Math.random()*15)+1;
    turn = 0;
  }
  profit = (500/1000)*(currentPrice-buyPrice);
  //console.log("Current Price: "+currentPrice);
  
  if(currentPrice>buyPrice)
  {
    //console.log("Profit is: "+profit);
  }
  else
  {
    //console.log("Loss is: "+(profit));
  }
  turn++;
},1000);

let price = 0; stockName = null, amount = 0;
//document.getElementById('buyQuantity').addEventListener("change",calcAmount(parseFloat(buyQuantity.value),price)); emits an error i do no understand

function stockBuy(stock)
{
  //display the modal
  document.getElementById("stockBuy-container").style.display = "block";
  
  const nameElement = document.getElementById("stockName");
  const priceElement = document.getElementById("stockPrice");
  
  
  switch(stock)
  {
    case "rim":
      price = currentPrice;
      nameElement.innerHTML = "RIM stock";
      break;
    case "banky":
      nameElement.innerHTML = "Banky Banker";
      price = totPrice;
      break;
    case "buse":
      nameElement.innerHTML = "BuSe IV";
      price = busePrice;
      break;
  }
  stockName = nameElement.innerHTML;
  console.log(stockName);
  priceElement.innerHTML = "Price: "+Rand.format(price.toFixed(2));
  
  let buyQuantity = document.getElementById("buyQuantity"); 
//console.log("here");
//console.log(buyQuantity.value);

//buyQuantity.addEventListener("change",calcAmount(parseFloat(buyQuantity.value),price));
setInterval(calcAmount(parseFloat(buyQuantity.value),price),500);

}


function calcAmount(quantity,price)
{
  amount = quantity*price;
  document.getElementById("amount").innerHTML = "Amount: "+Rand.format(amount.toFixed(2));
  document.getElementById("buyAmount").value = amount;
}

/*when the buy button is clicked 
add the trade object in an array of objects
*/
class MyStock
{
  name;
  buyPrice;//price the user bought at
  buyAmount;//the amount the user used, which will increase or decrease
}
let arrMyStock = [];

function buyConfirmed()
{
  let newStock = new MyStock;
  newStock.name = stockName;
  newStock.buyPrice = price;
  newStock.buyAmount = amount;
  arrMyStock.push(newStock);
  console.log("stock "+newStock.buyAmount);
}
//store to local storage or database