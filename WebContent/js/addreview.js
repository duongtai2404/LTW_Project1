function addReview(){
	  var idComputer = document.formAddReview.idComputer.value;
	  var review = document.formAddReview.review.value;
	  var url = document.formAddReview.url.value;
	  
	 $.ajax({
         url : url + "?idComputer=" + idComputer + "&review=" + review,
         type : "post",
         dataType:"text",
         data : {
              
         },
         success : function (result){
        	 if(result == "nouser"){
        		 $('#myModal88').modal('show');
        		 return;
        	 }
        	document.getElementById("bodyAddReview").innerHTML = result;
         }
     });
 }