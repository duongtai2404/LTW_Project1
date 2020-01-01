<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Start change language -->
	<div class="text-center" style="margin-left: 3%;margin-bottom: -15px;margin-top: 0.5rem">
		<div class="dropdown">
		  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		    <fmt:message key="ChangeLanguage" />
		  </button>
		  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="margin-left: 43%">
				<c:url var="urlLanguageVi" value="/ChangeLanguage?language=vi"></c:url> 
				<div class="text-center" ><a style="" class="dropdown-item" href="${urlLanguageVi}"><fmt:message key="VietNamese"/></a></div>
				<c:url var="urlLanguageEn" value="/ChangeLanguage?language=en_US"></c:url>
				<div class="text-center" ><a style="" class="dropdown-item" href="${urlLanguageEn}"><fmt:message key="English"/></a></li></div>
		  </div>
		</div>
	</div>

<!-- End change language -->


<!-- header -->
	<div class="header" id="home1">
		<div class="container">
			<div class="w3l_login" style="max-width: 50px">		
				<c:choose>
					<c:when test="${!empty user}">
						<div class="dropdown">
							<img style="margin-left: 61%;margin-bottom: 10%;margin-top: -40%;height: 75px;width: auto" alt="" src="${user.avatar}">
						  <button class="btn btn-info dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    <fmt:message key="Hello" />${user.userName }
						  </button>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<c:url var="urlLogOut" value="/LogOut"></c:url> 
								<div class="text-center" style="margin-bottom: 0.3rem"><a style="font-size:14px;display: contents;border:none;" class="dropdown-item" href="${urlLogOut}"><fmt:message key="LogOut"/></a></div>
								<div class="text-center" style="margin-bottom: 0.3rem;"> 
									<button type="button" style="width: 130px" class="btn btn-primary" data-toggle="modal" data-target="#changeAvatar"><fmt:message key="ChangeAvatar"/></button>
								</div>
								<div class="text-center" >
									<button type="button" style="width: 130px" class="btn btn-primary" data-toggle="modal" data-target="#repairAccount"><fmt:message key="RepairAccount"/></button>
								</div>
								
						  </div>
						</div>		
					</c:when>
					<c:otherwise>
						<a href="#" data-toggle="modal" data-target="#myModal88"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
					</c:otherwise>
				</c:choose>
			</div>
		
			<!-- Modal Repair Account-->
			<c:if test="${!empty user}">
			<div class="modal fade  bd-example-modal-sm" id="repairAccount" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-sm" role="document">
			    <div class="modal-content" style="width: 61%;margin-left:20%;margin-top: -2%;">
			      <div class="modal-header" style="margin-top: 1rem;margin-left: -1.5rem;">
			        <h5 class="modal-title" id="exampleModalLabel"><fmt:message key="RepairAccount"/></h5>
			      </div>
			      <div class="modal-body">
					<c:url var="urlRepairAccount" value="/RepairAccount"></c:url>			
					<form action="${urlRepairAccount}" method="post" enctype=”multipart/form-data”>
					  <div class="form-row">
					    <div class="form-group col-md-6" style="padding-left: 0px">
					      <label style="font-weight: 400;margin-bottom: 0.3rem;" for="inputName"><fmt:message key="UserName"/></label>
					      <input type="text" class="form-control" id="name" name="name" value="${user.userName }"  required="required">
					    </div>
					    <div class="form-group col-md-6" style="padding-right: 0px">
					      <label style="font-weight: 400;margin-bottom: 0.3rem;" for="inputAddress"><fmt:message key="Address"/></label>
					      <input type="text" class="form-control" id="address" name="address" value="${user.address }">
					    </div>
					  </div>
					  <div class="form-group">
					    <label style="font-weight: 400;margin-bottom: 0.3rem" for="inputEmail"><fmt:message key="EmailAddress"/></label>
					    <input type="email" class="form-control" id="emailAddress" name="emailAddress" value="${user.emailAddress }" required="required">
					  </div>
					  <div class="form-group">
					    <label style="font-weight: 400;margin-bottom: 0.3rem" for="inputPhone"><fmt:message key="Phone"/></label>
					    <input type="number" class="form-control" id="phone" name="phone" value="${user.phone}"  >
					  </div>
					  <div class="form-group">
					    <label style="font-weight: 400;margin-bottom: 0.3rem" for="inputPassword"><fmt:message key="Password"/></label>
					    <input type="password" class="form-control" id="password" name="password" value="${user.password }" required="required">
					  </div>
					  <div class="form-group">
					    <label style="font-weight: 400;margin-bottom: 0.3rem" for="inputConfirmPassword"><fmt:message key="ConfirmPassword"/></label>
					    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" value="${user.password }" required="required">
					  </div>  

					  <div style="text-align: right;">
					  	<button type="button" class="btn btn-secondary" data-dismiss="modal"><fmt:message key="Close"/></button>
						  <button type="submit" class="btn btn-primary"><fmt:message key="Save"/></button>
					  </div>
					</form>			
			      </div>
			    </div>
			  </div>
			</div>
			</c:if>
		<!-- end modal repair account-->
		
			<!-- Modal Repair Account-->
			<c:if test="${!empty user}">
			<div class="modal fade  bd-example-modal-sm" id="changeAvatar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-sm" role="document">
			    <div class="modal-content" style="width: 61%;margin-left:20%;margin-top: -2%;">
			      <div class="modal-header" style="margin-top: 1rem;margin-left: -1.5rem;">
			        <h5 class="modal-title" id="exampleModalLabel"><fmt:message key="ChangeAvatar"/></h5>
			      </div>
			      <div class="modal-body">
			      		<div style="text-align: center;margin-bottom: 1rem">
							<img alt="" src="${user.avatar}" style="height: 150px">
			      		</div>
			      		<c:url var="urlChangeAvatar" value="/ChangeAvatar?userName=${user.userName}"></c:url>
						<form method="post" action="${urlChangeAvatar}" enctype="multipart/form-data">
						    <input style="border: 1px solid #ccc;border-radius: 4px;padding: 0.3rem;width: 100%;" type="file" name="file" />
						    <div style="text-align: right;margin-top: .4rem">
						    	<button type="button" class="btn btn-secondary" data-dismiss="modal"><fmt:message key="Close"/></button>
						    	<input type="submit" class="btn btn-primary" value="Upload" />						    
						    </div> 
					  	</form>
			      </div>
			    </div>
			  </div>
			</div>
			</c:if>
		<!-- end modal repair account-->
	
		<c:if test="${!empty changeSuccess}">	
		<!-- Modal -->
		<div class="modal fade" id="changeSuccess" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel"><fmt:message key="Notification" /></h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body text-center">
					<h3><fmt:message key="ChangeSuccess"/></h3>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- end modal -->
		<script type="text/javascript">
			$('#changeSuccess').modal('show');
		</script>
		</c:if>				
		
			<div class="w3l_logo">
				<c:url var="urlIndex" value="/index.jsp"></c:url>
				<h1><a href="${urlIndex}"><fmt:message key="Store" /> Web2T<span><fmt:message key="Slogan" /></span></a></h1>
			</div>
			<div class="search">
				<input class="search_box" type="checkbox" id="search_box">
				<label class="icon-search" for="search_box"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></label>
				
				<div class="search_form"  style="overflow: auto">
					<c:url var="searchComputers" value="/SearchComputers"></c:url>
					<form action="${searchComputers }" method="post" name="formSearch">
						<input style="width: 342px" type="text" onkeyup="search()" name="Search" placeholder="<fmt:message key="SearchProduct" />" autocomplete="off">
						<input type="submit" value="<fmt:message key="Search" />">
					</form>
					<div id="resultSeach">
					</div>
				</div>	
			</div>

			<div class="box_1"> 
				<button type="button" class="w3view-cart" data-toggle="modal" data-target="#miniCartModal" ><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></button>				
			</div>
			
			<!--mini cart -->
			<div class="modal fade bd-example-modal-sm" id="miniCartModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header" style="margin-top: 1rem;margin-left: -1.5rem">
			      <h6 class="modal-title" id="exampleModalLabel"><fmt:message key="ShoppingCart"/></h6>
			      </div>
			      <div class="modal-body" style="padding-bottom: 1rem" id="miniCart" >
			      	<c:choose>
			      		<c:when test="${shoppingCart.size == 0}">
			      			<h3 class="text-center" style="margin: 2rem;font-weight: 600;min-height:100px;padding: 1rem"><fmt:message key="NoProduct"/></h3>
			      		</c:when>
			      		<c:otherwise>
			      			<table class="table" style="margin-bottom: 0px">
							  <tbody>
							  <c:forEach var="item" items="${shoppingCart.items}">
							    <tr>
							      <th scope="row" style="width: 30%;text-align: center;font-size: 18px">${item.computer.nameComputer}</th>
							      <td style="width: 20%;text-align: center;font-size: 18px;font-weight: 600;">${item.quantity }</td>
							      <td style="width: 5%">
							      	<c:url var="decreaseQuantityProduct" value="/DecreaseQuantityProduct"></c:url>
							      	<form action="${decreaseQuantityProduct}" method="post">
										<input type="hidden" name="showMiniCart" value="show">	
										<input type="hidden" name="idComputer" value="${item.computer.idComputer}">						      	
								      	<button type="button" onclick="decreaseQuantityProduct('${item.computer.idComputer}')" class="btn btn-secondary">-</button>
							      	</form>
							      </td>
							      <td style="width: 5%">
							      	<c:url var="addProduct" value="/AddProduct"></c:url>
							      	<form action="${addProduct}" method="post">
							      		<input type="hidden" name="showMiniCart" value="show">
							      		<input type="hidden" name="idComputer" value="${item.computer.idComputer}">
								      	<button type="button" onclick="increaseQuantityProduct('${item.computer.idComputer}')" class="btn btn-info">+</button>
							      	</form>
							      </td>
							      <td style="width: 30%;text-align: center;font-size: 18px;font-weight: 600;">$${item.price }</td>
							      <td class=" text-center">
							      	<c:url var="removeProduct" value="/RemoveProduct"></c:url>
							      	<form action="${removeProduct}" method="post">
										<input type="hidden" name="showMiniCart" value="show">
										<input type="hidden" name="idComputer" value="${item.computer.idComputer}">							      	
								      	<button type="button" onclick="removeProduct('${item.computer.idComputer}')" class="btn btn-secondary">x</button>
							      	</form>
							      </td>
							    </tr>
							    <hr>
							   </c:forEach>
							  </tbody>
							</table>
							 <div class="text-right" style="margin-top: 1rem">
								<h3 style="font-weight: 600"><fmt:message key="Subtotal"/>: $${shoppingCart.subtotal}</h3>
							</div>
			      		</c:otherwise>
			      	</c:choose>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary"  data-dismiss="modal"><fmt:message key="Close"/></button>
			        <c:if test="${shoppingCart.size > 0 }">
			        <c:url var="urlShoppingCart" value="/shoppingCart"></c:url>
			        <form action="${urlShoppingCart}" method="post" style="display: inline-block;">
				        <button type="submit" class="btn btn-primary"><fmt:message key="Pay"/></button>
			        </form>
			        </c:if>
			      </div>
			    </div>
			  </div>
			</div>	
			<!--end mini cart -->
		</div>
	</div>
	<!-- //header -->
	
	<% if(request.getParameter("showMiniCart")!=null){ %>
		<script>
			$('#miniCart').modal('show');
		</script>
	<%} %>
	
	<!-- navigation -->
	<div class="navigation">
		<div class="container">
			<nav class="navbar navbar-default">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header nav_2">
					<button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div> 
				<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
					<ul class="nav navbar-nav">
						<c:url var="urlIndex" value="/IndexServlet"></c:url>
						<li><a href="${urlIndex}" class="act"><fmt:message key="Home" /></a></li>	
						<!-- Mega Menu -->
						<c:url var="urlProducts" value="/Products"/>
						<li><a href="${urlProducts }"><fmt:message key="Products" /></a></li>
						<c:url var="urlShoppingCart" value="/shoppingCart"></c:url>
						<li><a href="${urlShoppingCart }"><fmt:message key="ShoppingCart" /></a></li> 
						<li><a href="mail.jsp"><fmt:message key="MailUs" /></a></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<!-- //navigation -->
