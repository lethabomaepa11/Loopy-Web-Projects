<?php

echo'
  <div id="confirm">
    <div>
      <h4 id="action"></h4>
      <hr>
      <p><font color="red">This action is permanent and cannot be undone.</font><br>Confirm action?</p>
      <span>
      <button style="background-color: transparent;border: 2px solid #0b5275;color: #0b5275;" onclick="show(\'confirm\')">No</button>
      <button id="yesBtn">Yes</button>
      </span>
    </div>
  </div>
  
  <script>
  function proceed(action,idType,id,file)
  {
    show("confirm");
    const yesBtn = document.getElementById("yesBtn");
    document.getElementById("action").textContent = "Confirm to "+action;
    yesBtn.addEventListener("click",function()
    {
      //pressed yes button to confirm Delete or Clear
      location.href = file+"?"+idType+"="+id+"&act="+action;
    },{once: true});
  }
    function show(id = "form")
    {
      const formStyle = document.getElementById(id).style;
      
      if(formStyle.display == "none")
      {
        formStyle.display = "block";
        if(id=="confirm")
        {
          formStyle.display = "flex";
        }
      }
      else
      {
        formStyle.display = "none";
      }
    }
  </script>';