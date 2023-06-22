function  pullDown (){
  const pullDownButton = document.getElementById("follow")
  const pullDownParents = document.getElementById("follow-pull-down")

  pullDownButton.addEventListener('mouseover', function(){
    this.setAttribute("style", "font-weight:600;")
  })

  pullDownButton.addEventListener('mouseout', function(){
    this.removeAttribute("style")
  })

  pullDownButton.addEventListener("click", function() {
    if (pullDownParents.getAttribute("style") == "display:block;") {
      pullDownParents.removeAttribute("style")
    } else {
      pullDownParents.setAttribute("style", "display:block;")
    }
  });
  };
window.addEventListener('load',  pullDown);