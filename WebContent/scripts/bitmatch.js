 window.onload = function() {
	 var a = document.getElementById("policylink");
	 a.onclick = function() {
		 document.getElementById('policy').style.visibility="visible";
		 document.getElementById('policy').style.opacity="1";
		 document.getElementById('policy').style.transitionDelay="0s";
	 }
	 
	 var b = document.getElementById("readpolicy");
	 b.onclick = function() {
		 document.getElementById('policy').style.visibility="hidden";
		 document.getElementById('policy').style.opacity="0";
	 }
	 
	 try{
		 document.getElementById("uploadBtn").onchange = function () {
			 document.getElementById("uploadFile").value = this.value;
		 };
	 }
	 catch(err){}
	 
	 
	 try{
		 var c = document.getElementById("inlinepolicylink");
		 c.onclick = function() {
			 document.getElementById('policy').style.visibility="visible";
			 document.getElementById('policy').style.opacity="1";
			 document.getElementById('policy').style.transitionDelay="0s";
		 }
	 }
	 catch(err){};
	 
	
	 
 }