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
      // pullDownParentsのstyle属性にdisplay:block;が指定されている場合（つまり表示されている時）実行される
      pullDownParents.removeAttribute("style")
    } else {
      // pullDownParentsのstyle属性にdisplay:block;が指定されていない場合（つまり非表示の時）実行される
      pullDownParents.setAttribute("style", "display:block;")
    }
  });



  };
window.addEventListener('load',  pullDown);