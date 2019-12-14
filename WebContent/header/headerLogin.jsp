<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- header modal -->
	<div class="modal fade" id="myModal88" tabindex="-1" role="dialog" aria-labelledby="myModal88" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel"><fmt:message key="LoginNow" /></h4>
				</div>
				<div class="modal-body modal-body-sub">
					<div class="row">
						<div class="col-md-8 modal_body_left modal_body_left1" style="border-right: 1px dotted #C2C2C2;padding-right:3em;">
							<div class="sap_tabs">	
								<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
									<ul>
										<li class="resp-tab-item" aria-controls="tab_item-0"><span><fmt:message key="SignIn"></fmt:message></span></li>		
										<li class="resp-tab-item " aria-controls="tab_item-1"><span><fmt:message key="SignUp"></fmt:message></span></li>
									</ul>
									
									<!-- Start signin	-->		
									<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
										<div class="facts">
											<div class="register">
												<form action="SignIn" method="post" >			
													<input name="Name" autofocus placeholder="<fmt:message key="UserName" />" type="text" required="" >						
													<input name="Password" placeholder="<fmt:message key="Password" />" type="password" required="">										
													<c:if test="${!empty errorSignin}">
														<h5 style="color:red; margin-top:20px"><fmt:message key="${errorSignin }" /></h5>
													</c:if>
													<div class="sign-up">
														<input type="submit" value="<fmt:message key="SignIn" />" />
													</div>
												</form>
											</div>
											
										</div> 
									</div>
									<!-- End signin	-->
									
									<!--start signup-->
									<div class="tab-2 resp-tab-content" aria-labelledby="tab_item-1">
										<div class="facts">
											<div class="register">
												<form action="SignUp" method="post">
													<c:choose>
														<c:when test="${!empty errorSignup }">
															<input autofocus placeholder="${wrongUser.userName }"  name="Name" type="text" required="">
															<input placeholder="${wrongUser.emailAddress }" name="Email" type="email" required="">
															<input placeholder="${wrongUser.address }" name="Address" type="text" >	
															<input placeholder="${wrongUser.phone }" name="Phone" type="number" >	
														</c:when>
														<c:otherwise>
															<input autofocus placeholder=<fmt:message key="UserName" />  name="Name" type="text" required="">
															<input placeholder="<fmt:message key="EmailAddress" />" name="Email" type="email" required="">
															<input placeholder="<fmt:message key="Address" />" name="Address" type="text" >	
															<input placeholder="<fmt:message key="Phone" />" name="Phone" type="number" >
														</c:otherwise>
													</c:choose>		
													<input placeholder="<fmt:message key="Password" />" name="Password" type="password" required="">	
													<input placeholder="<fmt:message key="ConfirmPassword" />" name="ConfirmPassword" type="password" required="">
													<c:if test="${!empty errorSignup}">
														<h5 style="color:red; margin-top:20px"><fmt:message key="${errorSignup }" /></h5>												
													</c:if>
													<div class="sign-up">
														<input type="submit" value="<fmt:message key="CreateAccount" />" />
													</div>
												</form>
											</div>
										</div>
									</div>
									<!--end signup--> 			        					            	      
								</div>	
							</div>
							<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
							<script type="text/javascript">
								$(document).ready(function () {
									$('#horizontalTab').easyResponsiveTabs({
										type: 'default', //Types: default, vertical, accordion           
										width: 'auto', //auto or any width like 600px
										fit: true   // 100% fit in a container
									});
								});
							</script>
							<div id="OR" class="hidden-xs">OR</div>
						</div>
						<div class="col-md-4 modal_body_right modal_body_right1">
							<div class="row text-center sign-with">
								<div class="col-md-12">
									<h3 class="other-nw" ><fmt:message key="SignInWith" /> </h3>
								</div>
								<div class="col-md-12">
									<ul class="social">
										<li class="social_facebook"><a href="#" class="entypo-facebook"></a></li>
										<li class="social_dribbble"><a href="#" class="entypo-dribbble"></a></li>
										<li class="social_twitter"><a href="#" class="entypo-twitter"></a></li>
										<li class="social_behance"><a href="#" class="entypo-behance"></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- header modal -->

