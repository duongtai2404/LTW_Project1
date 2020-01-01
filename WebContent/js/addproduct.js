function addProduct(){
	  var idComputer = document.formProduct.idComputer.value;
	  var quantity = document.formProduct.quantity.value;
	  
	 $.ajax({
         url : "AddProductAjax?idComputer=" + idComputer + "&quantity=" + quantity,
         type : "post",
         dataType:"text",
         data : {
              
         },
         success : function (result){
        	 document.getElementById("miniCart").innerHTML = result;
       		$('#addSuccess').modal('show');
         }
     });
 }

function addProductWithId(idComputer){
	  var quantity = 1;
	  
	 $.ajax({
       url : "AddProductAjax?idComputer=" + idComputer + "&quantity=" + quantity,
       type : "post",
       dataType:"text",
       data : {
            
       },
       success : function (result){
      		document.getElementById("miniCart").innerHTML = result;
      		$('#addSuccess').modal('show');
       }
   });
}

function increaseQuantityProducta(idComputer){
	 $.ajax({
     url : "IncreaseQuantityProductInCartAjax?idComputer=" + idComputer,
     type : "post",
     dataType:"text",
     data : {
          
     },
     success : function (result){
    		document.getElementById("miniCart").innerHTML = result;
    		if(document.getElementById("shoppingCart") != null){
    	 		document.getElementById("shoppingCart").innerHTML = result;
    	 	}
     }
 });
}

function decreaseQuantityProduct(idComputer){
	  
	 $.ajax({
    url : "DecreaseQuantityProductInCartAjax?idComputer=" + idComputer,
    type : "post",
    dataType:"text",
    data : {
         
    },
    success : function (result){
   		document.getElementById("miniCart").innerHTML = result;
   		if(document.getElementById("shoppingCart") != null){
	 		document.getElementById("shoppingCart").innerHTML = result;
	 	}
    }
});
}

function removeProduct(idComputer){
	
	$.ajax({
	   url : "RemoveProductInCartAjax?idComputer=" + idComputer,
	   type : "post",
	   dataType:"text",
	   data : {
	        
	   },
	   success : function (result){
	  		document.getElementById("miniCart").innerHTML = result;
	  		if(document.getElementById("shoppingCart") != null){
    	 		document.getElementById("shoppingCart").innerHTML = result;
    	 	}
	   }
	 });
}