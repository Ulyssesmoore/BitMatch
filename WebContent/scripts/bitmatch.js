 window.onload = function() {
	 var a = document.getElementById("policylink");
	 a.onclick = function() {
		 document.getElementById('policy').style.display="block";
	 }
	 
	 var b = document.getElementById("readpolicy");
	 b.onclick = function() {
		 document.getElementById('policy').style.display="none";
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
			 document.getElementById('policy').style.display="block";
		 }
	 }
	 catch(err){};
	 
	
	 
 }