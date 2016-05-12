$( document ).ready(function() {
	$(function() {
		$( "#datepicker" ).datepicker({ 
			dateFormat: 'dd-mm-yy',
			changeMonth: true,
			changeYear: true,
			yearRange: "-100:+0"
		}).val();
	});
	
	$( "#datepicker" ).bind('keyup','keydown', function(e){

		  //To accomdate for backspacing, we detect which key was pressed - if backspace, do nothing:
		    if(e.which !== 8) { 
		        var numChars = $( "#datepicker" ).val().length;
		        if(numChars === 2 || numChars === 5){
		            var thisVal = $( "#datepicker" ).val();
		            thisVal += '-';
		            $( "#datepicker" ).val(thisVal);
		        }
		  }
		});
	
	$("#username").keydown(function (e) {
	     if (e.keyCode == 32) { 
	       return false; // return false to prevent space from being added
	     }
	});
	
	$("#usernamelogin").keydown(function (e) {
	     if (e.keyCode == 32) { 
	       return false; // return false to prevent space from being added
	     }
	});
	
	$("#minimumage").keydown(function (e) {
        // Allow: backspace, delete, tab, escape and enter
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110]) !== -1 ||
             // Allow: Ctrl+A, Command+A
            (e.keyCode == 65 && ( e.ctrlKey === true || e.metaKey === true ) ) || 
             // Allow: home, end, left, right, down, up
            (e.keyCode >= 35 && e.keyCode <= 40)) {
                 // let it happen, don't do anything
                 return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });
	$("#maximumage").keydown(function (e) {
        // Allow: backspace, delete, tab, escape and enter
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110]) !== -1 ||
             // Allow: Ctrl+A, Command+A
            (e.keyCode == 65 && ( e.ctrlKey === true || e.metaKey === true ) ) || 
             // Allow: home, end, left, right, down, up
            (e.keyCode >= 35 && e.keyCode <= 40)) {
                 // let it happen, don't do anything
                 return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });
	$("#username").keydown(function (e) {
	     if (e.keyCode == 32) { 
	       return false;
	     }
	});
	
	$('#policylink').click( function() {
	      return false;
	})
	
	$('#readpolicy').click( function() {
	      return false;
	})
	
	$('#inlinepolicylink').click( function() {
	      return false;
	})
	
	$(function(){
        $('#aboutme').html($('#aboutme').html().replace(/\n/g, '<br />'));
    })
});