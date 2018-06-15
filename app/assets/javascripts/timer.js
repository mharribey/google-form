  var totalTime;
  var clock;
  var form;

  function getValues(time,id){
    form = document.getElementById("edit_form_"+id);
    totalTime = time * 60;
  }

  function startTimer(){
    setTimeout(function(){
      clock = $('.timer').FlipClock(totalTime, {
            clockFace: 'HourCounter',
            countdown: true,
            autoStart: true,
            callbacks: {
		        	stop: function() {
		        		form.submit();
		        	}
		        }
        });
    },500);
  }
