<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- header -->
	<div class="header" id="home1">
		<div class="container">
			<div class="w3l_login">
				<c:choose>
					<c:when test="${empty user}">
						<a href="#" data-toggle="modal" data-target="#myModal88"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
					</c:when>
					<c:otherwise>
						<span><h5><fmt:message key="Hello" />${user.userName }</h5></span>
						<c:url var="url" value="/LogOut"></c:url>
						<a href="${url}" style="margin-left:25px"><fmt:message key="LogOut"/></a>
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
					<form action="#" method="post">
						<input type="text" name="Search" placeholder="<fmt:message key="Search" />">
						<input type="submit" value="<fmt:message key="Send" />">
					</form>
				</div>
			</div>
			<div class="cart cart box_1"> 
				<form action="#" method="post" class="last"> 
					<input type="hidden" name="cmd" value="_cart" />
					<input type="hidden" name="display" value="1" />
					<button class="w3view-cart" type="submit" name="submit" value=""><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></button>
				</form>   
			</div>  
		</div>
	</div>
	<!-- //header -->
	
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
<!-- 						<li class="w3pages"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Pages <span class="caret"></span></a> -->
<!-- 							<ul class="dropdown-menu"> -->
<!-- 								<li><a href="icons.jsp">Web Icons</a></li> -->
<!-- 								<li><a href="codes.jsp">Short Codes</a></li>      -->
<!-- 							</ul> -->
<!-- 						</li>   -->
						<li><a href="mail.jsp"><fmt:message key="MailUs" /></a></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<!-- //navigation -->
