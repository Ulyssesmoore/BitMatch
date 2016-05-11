 window.onload = function() {
	 var a = document.getElementById("policylink");
	 a.onclick = function() {
		 document.getElementById('policy').style.display="block";
	 }
	 var c = document.getElementById("inlinepolicylink");
	 c.onclick = function() {
		 document.getElementById('policy').style.display="block";
	 }
	 var b = document.getElementById("readpolicy");
	 b.onclick = function() {
		 document.getElementById('policy').style.display="none";
	 }
 }