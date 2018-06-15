  function startTimer(time,id){
    const init = document.getElementById("time-left");
    const form = document.getElementById("edit_form_"+id);
    const totalTime = time;

    var timer = 0;
    time = time * 60;

    setInterval(function(){
      console.log(time);

      time -= 1;
      timer = Math.floor(time / 3600 % 60 ) + "h : " + Math.floor(time / 60 % 60) + "m : " + time % 60 + "s";

      if(time <= 0){
        form.submit();
      }
      init.innerHTML = "Temps restant : <b>" + timer + "</b>";
    },1000);
  }
