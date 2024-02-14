let Rand = Intl.NumberFormat('en-ZA', {
    style: 'currency',
    currency: 'ZAR',
});
const balances = document.getElementsByClassName("balance");
   for(var x = 0; x < balances.length; x++)
   {
     balances[x].innerHTML = Rand.format(parseFloat(balances[x].innerHTML))
   }

function setCurrency(id)
{
  document.getElementById(id).innerHTML = Rand.format(parseFloat(document.getElementById(id).innerHTML));
}


function appear(display,id)
{
  if(display)
  {
    document.getElementById(id).style.animation = "appearFromBottom ease-in-out 0.5s";
    document.getElementById(id).style.display = "block";
  }
  else
  {
    document.getElementById(id).style.animation = "goToBottom ease-in-out 0.5s";
    setTimeout(function(){
      document.getElementById(id).style.display = "none";
    },502);
  }
}

