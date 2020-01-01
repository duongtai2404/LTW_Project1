<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<input autofocus value="${wrongUser.userName }"  name="Name" type="text" required="">
<input value="${wrongUser.emailAddress }" name="Email" type="email" required="">
<input value="${wrongUser.address }" name="Address" type="text" >	
<input value="${wrongUser.phone }" name="Phone" type="number" >
<input placeholder="<fmt:message key="Password" />" name="Password" type="password" required="">	
<input placeholder="<fmt:message key="ConfirmPassword" />" name="ConfirmPassword" type="password" required="">
<h5 style="color:red; margin-top:20px"><fmt:message key="${errorSignUp}"/></h5>	
<div class="sign-up">
	<input type="button" onclick="SignUp()" value="<fmt:message key="CreateAccount" />" />
</div>