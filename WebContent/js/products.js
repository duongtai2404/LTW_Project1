
 function findNew(type){
	 $.ajax({
         url : "FindNewAjax?type="+type,
         type : "post",
         dataType:"text",
         data : {
              
         },
         success : function (result){
        	 document.getElementById("result").innerHTML = result;
         }
     });
 }
 

 function findTopSellWithType(type){
	 $.ajax({
         url : "FindTopSellWithTypeAjax?type="+type,
         type : "post",
         dataType:"text",
         data : {
              
         },
         success : function (result){
        	 document.getElementById("result").innerHTML = result;
         }
     });
 }
 

 function findTopSell(){
	 $.ajax({
         url : "FindTopSellAjax",
         type : "post",
         dataType:"text",
         data : {
              
         },
         success : function (result){
        	 document.getElementById("result").innerHTML = result;
         }
     });
 }
 
 function findPriceBetween(before,after){
	 $.ajax({
         url : "FindPriceBetweenAjax?before=" + before +"&after=" +after,
         type : "post",
         dataType:"text",
         data : {
              
         },
         success : function (result){
        	 document.getElementById("result").innerHTML = result;
         }
     });
 }