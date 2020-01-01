
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
        		 location.reload();
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

 function SignUp(){
	 		var name = document.formSignUp.Name.value;
	 		var emailAddress = document.formSignUp.Email.value;
	 		var address = document.formSignUp.Address.value;
	 		var phone = document.formSignUp.Phone.value;
	 		var password = document.formSignUp.Password.value;
	 		var confirmPassword = document.formSignUp.ConfirmPassword.value;
             $.ajax({
                 url : "SignUp?Name=" + name + "&EmailAddress=" + emailAddress + "&Address=" + address +"&Phone=" + phone + "&Password=" + password + "&ConfirmPassword=" + confirmPassword,
                 type : "post",
                 dataType : "text",
                 data : {

                 },
                 success : function (result){
                	 if(result == "signupsuccess"){
                		 window.location.href = "index.jsp";
                		 return;
                	 }
                	 else{
                		 $('#formSignUp').html(result); 
                	 }
                 }
             });
 }

