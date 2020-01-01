function search(){
	
	  var nameComputer = document.formSearch.Search.value;
	  if(nameComputer === ""){  
		  document.getElementById("resultSeach").innerHTML = "";
	  }
	  else{
		  $.ajax({
			  url : "SearchAjax?nameComputer=" + nameComputer,
			  type : "post",
			  dataType:"text",
			  data : {
				  
			  },
			  success : function (result){
				  document.getElementById("resultSeach").innerHTML = result;
			  }
		  });
	  }
 }