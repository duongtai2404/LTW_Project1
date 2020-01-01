
	<!-- footer -->
	<div class="footer">
		<div class="footer-copy">
			<div class="footer-copy1">
				<div class="footer-copy-pos">
					<a href="#home1" class="scroll"><img src="images/arrow.png" alt=" " class="img-responsive" /></a>
				</div>
			</div>
			<div class="container">
				<p>&copy; 2019 Store Web2T. All rights reserved | Design by <a href="https://www.facebook.com/tai.duong.313">Web2T</a></p>
			</div>
		</div>
	</div>
	<!-- //footer -->
	
	<!-- cart-js -->
	<script src="js/minicart.js"></script>
	<script>
        w3ls.render();

        w3ls.cart.on('w3sb_checkout', function (evt) {
        	var items, len, i;

        	if (this.subtotal() > 0) {
        		items = this.items();

        		for (i = 0, len = items.length; i < len; i++) { 
        		}
        	}
        });
    </script>  
	<!-- //cart-js --> 	
	
<!-- 	<script type="text/javascript" src="js/signin.js"></script> -->
	<script type="text/javascript" src="js/addproduct.js"></script>
	<script type="text/javascript" src="js/addreview.js"></script> 
	<script type="text/javascript" src="js/search.js"></script> 
	<script type="text/javascript" src="js/products.js"></script> 
	<script>
	 function checkSignIn(){
		  var Name = document.formSignIn.Name.value;
		  var Password = document.formSignIn.Password.value;
		  var url = document.formSignIn.url.value;
		  
		 $.ajax({
	         url : url + "?Name=" + Name + "&Password=" + Password,
	         type : "post",
	         dataType:"text",
	         data : {
	              
	         },
	         success : function (result){
	        	 if(result == "user"){
	        		 if(location.href.endsWith("LTW_Project1/") || location.href.endsWith("LogOut")){
	        			 location.href = "/LTW_Project1/Home";
	        		 }
	        		 else{
	        			 location.reload();
	        		 }	
	        		 return;
	        	 }
	        	 if(result == "admin"){
	        		 window.location.href = "/WEB-INF/admin/index.jsp";
	        		 return;
	        	 }       		 
	        		$('#errorSignIn').html(result); 
	         }
	     });
	 }
	
	</script>
	
	
</body>
</html>