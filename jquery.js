$( document ).ready(function() {
	$("#showForm").click(function(){
		$("#countryForm").toggle();
	})
	
	$("#showList").click(function(){
		$("#countryList").toggle();
	})
	
	$("#all").click(function(){
		$("#countries tbody tr").remove();
		$.get("restservices/countries", function(result){
			$.each(result, function(i,data){
				$("#countries").append("<tr><td>"+data.code+"</td><td>"+data.name+"</td><td>"+data.continent+"</td><td>"+data.region+"</td><td>"+data.surface+"</td><td>"+data.population+"</td><td>"+data.government+"</td></tr>");
			})
		})
	})
	
	$("#surfaces").click(function(){
		$("#countries tbody tr").remove();
		$.get("restservices/countries/largestsurfaces", function(result){
			$.each(result, function(i,data){
				$("#countries").append("<tr><td>"+data.code+"</td><td>"+data.name+"</td><td>"+data.continent+"</td><td>"+data.region+"</td><td>"+data.surface+"</td><td>"+data.population+"</td><td>"+data.government+"</td></tr>");
			})
		})
	})
	$("#populations").click(function(){
		$("#countries tbody tr").remove();
		$.get("restservices/countries/largestpopulation", function(result){
			$.each(result, function(i,data){
				$("#countries").append("<tr><td>"+data.code+"</td><td>"+data.name+"</td><td>"+data.continent+"</td><td>"+data.region+"</td><td>"+data.surface+"</td><td>"+data.population+"</td><td>"+data.government+"</td></tr>");
			})
		})
	})
	
	$("#createcountry").click(function(){
		$.post("/countries/createnew",$("#countryForm").serialize(), function(result){
			$.each(result, function(i,data){
				$("#countries").append("<tr><td>"+data.code+"</td><td>"+data.name+"</td><td>"+data.continent+"</td><td>"+data.region+"</td><td>"+data.surface+"</td><td>"+data.population+"</td><td>"+data.government+"</td></tr>");
			})
		})
	})
});