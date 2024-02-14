function toggleMode()
    {
      const mode = document.getElementsByClassName("light");
      const icon = document.getElementById("icon");
    
      document.body.classList.toggle("dark");
      
      icon.classList.toggle("fa-moon");
      
    }
    