
function showOptions(show = false)
{
  const optionsBox = document.getElementById("options");
  if(show)
  {
    optionsBox.style.display = "block";
    
  }
  else
  {
    optionsBox.style.display =  "none";
  }
}