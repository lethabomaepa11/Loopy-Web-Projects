const arrPlaceHolders = ["Loopy Lite","Cellphones","Drip lip","Aparrel","Shops","Fashion"];//use php to fill with search tags, same as the one in search div under suggestions/ Discover searches
    
    
    
    
    setInterval(
      function()
      {
        const search = document.getElementById("sInput1");
        let num = Math.floor(Math.random()*5);
        let word = arrPlaceHolders[num];
        
        search.setAttribute("placeholder",word);
      },3000)
      
      
    function search(display = false)
    {
      if(display)
      {
      document.getElementById("search").style.display = "block";
      document.getElementById("sInput").focus();
      }
      else
      document.getElementById("search").style.display = "none";
    }
    
    
      document.addEventListener('input', function (e) {
  if (e.target.value != null && e.target && e.target.id === 'textbox') {
    const textarea = e.target;
    textarea.style.height = 'auto'; // Reset height to auto to adjust to content
    const newHeight = textarea.scrollHeight + 'px';
    textarea.style.bottom = `-${newHeight}`; // Move the textarea upwards
    textarea.style.height = newHeight; // Set height to content height
    //textarea.style.width = '65%';
  }
      });

