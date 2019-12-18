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
					<c:when test="${empty user}">
						<a href="#" data-toggle="modal" data-target="#myModal88"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
					</c:when>
					<c:otherwise>
						<div class="dropdown">
						  <button class="btn btn-info dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    <fmt:message key="Hello" />${user.userName }
						  </button>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<c:url var="urlLogOut" value="/LogOut"></c:url> 
								<div class="text-center mb-2" ><a style="font-size:14px;display: contents;border:none;" class="dropdown-item" href="${urlLogOut}"><fmt:message key="LogOut"/></a></div>
								<c:url var="urlRepairAccount" value="/RepairAccount"></c:url>
								<div class="text-center" ><a style="font-size:14px;display: contents;border:none;" class="dropdown-item" href="${urlRepairAccount} }"><fmt:message key="RepairAccount"/></a></li></div>
						  </div>
						</div>											
					</c:otherwise>
				</c:choose>
			</div>
			<div class="w3l_logo">
				<h1><a href="index.jsp"><fmt:message key="Store" /> Web2T<span><fmt:message key="Slogan" /></span></a></h1>
			</div>
			<div class="search">
				<input class="search_box" type="checkbox" id="search_box">
				<label class="icon-search" for="search_box"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></label>
				<div class="search_form">
					<c:url var="searchComputers" value="/SearchComputers"></c:url>
					<form action="${searchComputers }" method="post">
						<input style="width: 355px" type="text" name="Search" placeholder="<fmt:message key="SearchProduct" />">
						<input type="submit" value="<fmt:message key="Search" />">
					</form>
				</div>
			</div>

			<div class="box_1"> 
				<button type="button" class="w3view-cart" data-toggle="modal" data-target="#miniCart"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></button>				
			</div>
			
			<!--mini cart -->
			<div class="modal fade bd-example-modal-sm" id="miniCart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header" style="margin-top: 1rem;margin-left: -1.5rem">
			      <h6 class="modal-title" id="exampleModalLabel"><fmt:message key="ShoppingCart"/></h6>
			      </div>
			      <div class="modal-body" style="padding-bottom: 1rem">
			      	<c:choose>
			      		<c:when test="${shoppingCart.size == 0}">
			      			<h4 class="text-center"><fmt:message key="NoProduct"/></h4>
			      		</c:when>
			      		<c:otherwise>
			      			<table class="table" style="margin-bottom: 0px">
							  <tbody>
							  <c:forEach var="item" items="${shoppingCart.items}">
							    <tr>
							      <th scope="row" style="width: 30%">${item.computer.nameComputer}</th>
							      <td style="width: 20%;text-align: center;">${item.quantity }</td>
							      <td style="width: 5%">
							      	<c:url var="decreaseQuantityProduct" value="/DecreaseQuantityProduct"></c:url>
							      	<form action="${decreaseQuantityProduct}" method="post">
										<input type="hidden" name="showMiniCart" value="show">	
										<input type="hidden" name="idComputer" value="${item.computer.idComputer}">						      	
								      	<button type="submit" class="btn btn-secondary">-</button>
							      	</form>
							      </td>
							      <td style="width: 5%">
							      	<c:url var="addProduct" value="/AddProduct"></c:url>
							      	<form action="${addProduct}" method="post">
							      		<input type="hidden" name="showMiniCart" value="show">
							      		<input type="hidden" name="idComputer" value="${item.computer.idComputer}">
								      	<button type="submit" class="btn btn-info">+</button>
							      	</form>
							      </td>
							      <td style="width: 30%;text-align: center;">$${item.price }</td>
							      <td class=" text-right">
							      	<c:url var="removeProduct" value="/RemoveProduct"></c:url>
							      	<form action="${removeProduct}" method="post">
										<input type="hidden" name="showMiniCart" value="show">
										<input type="hidden" name="idComputer" value="${item.computer.idComputer}">							      	
								      	<button type="submit" class="btn btn-secondary">x</button>
							      	</form>
							      </td>
							    </tr>
							   </c:forEach>
							  </tbody>
							</table>
			      		</c:otherwise>
			      	</c:choose>
			      </div>
			      <div class="modal-footer">
			      	<c:if test="${shoppingCart.size > 0 }">
			      		<h4 style="float: left;font-weight: 600"><fmt:message key="Subtotal"/> : $${shoppingCart.subtotal}</h4>
			      	</c:if>
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
	
	<c:if test="${!empty showMiniCart}">
		<script>
			$('#miniCart').modal('show');
		</script>
	</c:if>	
	
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
						<li><a href="index.jsp" class="act"><fmt:message key="Home" /></a></li>	
						<!-- Mega Menu -->
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message key="Products" /> <b class="caret"></b></a>
							<ul class="dropdown-menu multi-column columns-3">
								<div class="row">
									<div class="col-sm-3">
										<ul class="multi-column-dropdown">
											<h6>LENOVO</h6>
											<li><a href="products.jsp">LENOVO 01</a></li>
											<li><a href="products.jsp">LENOVO 02<span>New</span></a></li> 
											<li><a href="products.jsp">LENOVO 03</a></li>
											<li><a href="products.jsp">LENOVO 04<span>New</span></a></li>
										</ul>
									</div>
									<div class="col-sm-3">
										<ul class="multi-column-dropdown">
											<h6>HP</h6>
											<li><a href="products1.jsp">HP 01</a></li>
											<li><a href="products1.jsp">HP 02</a></li>
											<li><a href="products1.jsp">HP 03<span>New</span></a></li>
											<li><a href="products1.jsp"><i>HP 04</i></a></li>
										</ul>
									</div>
									<div class="col-sm-2">
										<ul class="multi-column-dropdown">
											<h6>ACER</h6>
											<li><a href="products2.jsp">ACER 1</a></li>
											<li><a href="products2.jsp">ACER 2</a></li>
											<li><a href="products2.jsp">ACER 3</a></li>
											<li><a href="products2.jsp">ACER 4</a></li>
										</ul>
									</div>
									<div class="col-sm-4">
										<div class="w3ls_products_pos">
											<h4>30%<i>Off/-</i></h4>
											<img src="images/22.jpg" alt=" " class="img-responsive" />
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
							</ul>
						</li>
						<c:url var="urlShoppingCart" value="/shoppingCart"></c:url>
						<li><a href="${urlShoppingCart }"><fmt:message key="ShoppingCart" /></a></li> 
						<li><a href="mail.jsp"><fmt:message key="MailUs" /></a></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<!-- //navigation -->
