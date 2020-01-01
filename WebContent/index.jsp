<%@page import="java.util.List"%>
<%@page import="model.Computer"%>
<%@page import="model.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="computerDao" class="dao.ComputerDao" scope="session"></jsp:useBean>	
	
	<!-- header -->
	<jsp:include page="header/header.jsp"></jsp:include>
	<!-- /header -->

	<!-- header login -->
	<jsp:include page="header/headerLogin.jsp"></jsp:include>
	<!-- header login -->
	
	<!-- 	header and navigation -->
	<jsp:include page="header/headerNavigation.jsp"></jsp:include>
	<!-- 	header and navigation -->
	
	<!-- banner -->
	<div class="banner">
		<div class="container">
			<h3><fmt:message key="ComputerStore"/>, <span><fmt:message key="SpecialOffers"/></span></h3>
		</div>
	</div>
	<!-- //banner --> 
	<c:if test="${!empty showLogin}">
		<script>
		$('#myModal88').modal('show');
		</script>
	</c:if>
	
	<!-- banner-bottom -->
	<div class="banner-bottom">								
		<div class="container">
			<div class="col-md-5 wthree_banner_bottom_left">
				<div class="video-img">
					<a class="play-icon popup-with-zoom-anim" href="#small-dialog">
						<span class="glyphicon glyphicon-expand" aria-hidden="true"></span>
					</a>
				</div> 
					<!-- pop-up-box -->     
					<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
					<!--//pop-up-box -->
					<div id="small-dialog" class="mfp-hide">
						<iframe src="https://www.youtube.com/embed/ZQa6GUVnbNM"></iframe>
					</div>
					<script>
						$(document).ready(function() {
						$('.popup-with-zoom-anim').magnificPopup({
							type: 'inline',
							fixedContentPos: false,
							fixedBgPos: true,
							overflowY: 'auto',
							closeBtnInside: true,
							preloader: false,
							midClick: true,
							removalDelay: 300,
							mainClass: 'my-mfp-zoom-in'
						});
																						
						});
					</script>
			</div>
			
			<% List<Computer> computersLenovo  = computerDao.getComputersWithType("lenovo"); %>
			<c:set var="listComputersLenovo" value="<%= computersLenovo %>"></c:set>
			<div class="col-md-7 wthree_banner_bottom_right">
				<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
					<ul id="myTab" class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#lenovo" id="home-tab" role="tab" data-toggle="tab" aria-controls="home"><fmt:message key="Lenovo"/></a></li>
						<li role="presentation"><a href="#hp" role="tab" id="audio-tab" data-toggle="tab" aria-controls="audio"><fmt:message key="Hp"/></a></li>
						<li role="presentation"><a href="#dell" role="tab" id="video-tab" data-toggle="tab" aria-controls="video"><fmt:message key="Dell"/></a></li>
						<li role="presentation"><a href="#acer" role="tab" id="tv-tab" data-toggle="tab" aria-controls="tv"><fmt:message key="Acer"/></a></li>
						<li role="presentation"><a href="#asus" role="tab" id="kitchen-tab" data-toggle="tab" aria-controls="kitchen"><fmt:message key="Asus"/></a></li>
					</ul>
					
					<div id="myTabContent" class="tab-content">
					
						<!-- start list Lenovo's computers  -->
						<div role="tabpanel" class="tab-pane fade active in" id="lenovo" aria-labelledby="home-tab">
							<div class="agile_ecommerce_tabs">
								<c:forEach var="computerLenovo" items="${listComputersLenovo}" begin="0" end="2"	>
									<div class="col-md-4 agile_ecommerce_tab_left">
										<div class="hs-wrapper">
											<c:forEach var="imageLenovo" items="${computerLenovo.images}">											
												<img src="${imageLenovo}" alt=" " class="img-responsive" />
											</c:forEach>
											<div class="w3_hs_bottom">
												<ul>
													<li>
														<a href="#" data-toggle="modal" data-target="#${computerLenovo.idComputer}"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
													</li>
												</ul>
											</div>
										</div>
										<c:url var="url" value="/productDetails?idComputer=${computerLenovo.idComputer}"></c:url>
										<h5><a href="${url}">${computerLenovo.nameComputer}</a></h5>
										<div class="simpleCart_shelfItem">
											<p><span>$${computerLenovo.oldPrice}</span> <i class="item_price">$${computerLenovo.newPrice}</i></p>
											<c:url var="addProduct" value="/AddProduct"></c:url>
											<form action="${addProduct }" method="post">
												<input type="hidden" name="quantity" value="1" /> 
												<input type="hidden" name="idComputer" value="${computerLenovo.idComputer}" /> 
												<button type="button" onclick="addProductWithId('${computerLenovo.idComputer}')" class="w3ls-cart"><fmt:message key="AddToCart" /></button>
											</form>  
										</div>
									</div>					
								</c:forEach>
								<div class="clearfix"> </div>
							</div>
						</div>
						<!--End list Lenovo's computers -->
						
						<!-- start list hp's computers -->
						<% List<Computer> computersHP  = computerDao.getComputersWithType("hp"); %>
						<c:set var="listComputersHP" value="<%= computersHP %>"></c:set>
						<div role="tabpanel" class="tab-pane fade" id="hp" aria-labelledby="audio-tab">
							<div class="agile_ecommerce_tabs">
								<c:forEach var="computerHP" items="${listComputersHP}" begin="0" end="2">
									<div class="col-md-4 agile_ecommerce_tab_left">
										<div class="hs-wrapper">
											<c:forEach var="imageHP" items="${computerHP.images}">											
												<img src="${imageHP}" alt=" " class="img-responsive" />
											</c:forEach>										
											<div class="w3_hs_bottom">
												<ul>
													<li>
														<a href="#" data-toggle="modal" data-target="#${computerHP.idComputer}"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
													</li>
												</ul>
											</div>
										</div>
										<c:url var="url" value="/productDetails?idComputer=${computerHP.idComputer}"></c:url>
										<h5><a href="${url}">${computerHP.nameComputer }</a></h5>
										<div class="simpleCart_shelfItem">
											<p><span>$${computerHP.oldPrice }</span> <i class="item_price">$${computerHP.newPrice }</i></p>
											<form action="${addProduct }" method="post">
												<input type="hidden" name="quantity" value="1" /> 
												<input type="hidden" name="idComputer" value="${computerHP.idComputer }" />  
												<button type="button" onclick="addProductWithId('${computerHP.idComputer}')" class="w3ls-cart"><fmt:message key="AddToCart"/></button>
											</form>
										</div>
									</div>
								</c:forEach>
								<div class="clearfix"> </div>
							</div>
						</div>
						<!-- End list hp's computers -->
						
						<!-- start list dell's computers -->
						<% List<Computer> computersDell = computerDao.getComputersWithType("dell"); %>
						<c:set var="listComputersDell" value="<%= computersDell %>"></c:set>
						<div role="tabpanel" class="tab-pane fade" id="dell" aria-labelledby="audio-tab">
							<div class="agile_ecommerce_tabs">
								<c:forEach var="computerDell" items="${listComputersDell}" begin="0" end="2">
									<div class="col-md-4 agile_ecommerce_tab_left">
										<div class="hs-wrapper">
											<c:forEach var="imageDell" items="${computerDell.images}">											
												<img src="${imageDell}" alt=" " class="img-responsive" />
											</c:forEach>										
											<div class="w3_hs_bottom">
												<ul>
													<li>
														<a href="#" data-toggle="modal" data-target="#${computerDell.idComputer}"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
													</li>
												</ul>
											</div>
										</div>
										<c:url var="url" value="/productDetails?idComputer=${computerDell.idComputer}"></c:url>
										<h5><a href="${url }">${computerDell.nameComputer }</a></h5>
										<div class="simpleCart_shelfItem">
											<p><span>$${computerDell.oldPrice }</span> <i class="item_price">$${computerDell.newPrice }</i></p>
											<form action="${addProduct }" method="post">
												<input type="hidden" name="quantity" value="1" /> 
												<input type="hidden" name="idComputer" value="${computerDell.idComputer }" />  
												<button type="button" onclick="addProductWithId('${computerDell.idComputer}')" class="w3ls-cart"><fmt:message key="AddToCart"/></button>
											</form>
										</div>
									</div>
								</c:forEach>
								<div class="clearfix"> </div>
							</div>
						</div>
						<!-- End list dell's computers -->
						
						<!-- start list acer's computers -->
						<% List<Computer> computersAcer = computerDao.getComputersWithType("acer"); %>
						<c:set var="listComputersAcer" value="<%= computersAcer %>"></c:set>
						<div role="tabpanel" class="tab-pane fade" id="acer" aria-labelledby="audio-tab">
							<div class="agile_ecommerce_tabs">
								<c:forEach var="computerAcer" items="${listComputersAcer}" begin="0" end="2">
									<div class="col-md-4 agile_ecommerce_tab_left">
										<div class="hs-wrapper">
											<c:forEach var="imageAcer" items="${computerAcer.images}">											
												<img src="${imageAcer}" alt=" " class="img-responsive" />
											</c:forEach>										
											<div class="w3_hs_bottom">
												<ul>
													<li>
														<a href="#" data-toggle="modal" data-target="#${computerAcer.idComputer}"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
													</li>
												</ul>
											</div>
										</div>
										<c:url var="url" value="/productDetails?idComputer=${computerAcer.idComputer}"></c:url>
										<h5><a href="${url}">${computerAcer.nameComputer }</a></h5>
										<div class="simpleCart_shelfItem">
											<p><span>$${computerAcer.oldPrice }</span> <i class="item_price">$${computerAcer.newPrice }</i></p>
											<form action="${addProduct }" method="post">
												<input type="hidden" name="quantity" value="1" /> 
												<input type="hidden" name="idComputer" value="${computerAcer.idComputer }" />  
												<button type="button" onclick="addProductWithId('${computerAcer.idComputer}')" class="w3ls-cart"><fmt:message key="AddToCart"/></button>
											</form>
										</div>
									</div>
								</c:forEach>
								<div class="clearfix"> </div>
							</div>
						</div>
						<!-- End list acer's computers -->
						
						<!-- start list asus's computers -->
						<% List<Computer> computersAsus = computerDao.getComputersWithType("asus"); %>
						<c:set var="listComputersAsus" value="<%= computersAsus %>"></c:set>
						<div role="tabpanel" class="tab-pane fade" id="asus" aria-labelledby="audio-tab">
							<div class="agile_ecommerce_tabs">
								<c:forEach var="computerAsus" items="${listComputersAsus}" begin="0" end="2">
									<div class="col-md-4 agile_ecommerce_tab_left">
										<div class="hs-wrapper">
											<c:forEach var="imageAsus" items="${computerAsus.images}">											
												<img src="${imageAsus}" alt=" " class="img-responsive" />
											</c:forEach>										
											<div class="w3_hs_bottom">
												<ul>
													<li>
														<a href="#" data-toggle="modal" data-target="#${computerAsus.idComputer}"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
													</li>
												</ul>
											</div>
										</div>
										<c:url var="url" value="/productDetails?idComputer=${computerAcer.idComputer}"></c:url>
										<h5><a href="${url}">${computerAsus.nameComputer }</a></h5>
										<div class="simpleCart_shelfItem">
											<p><span>$${computerAsus.oldPrice }</span> <i class="item_price">$${computerAsus.newPrice }</i></p>
											<form action="${addProduct }" method="post">
												<input type="hidden" name="quantity" value="1" /> 
												<input type="hidden" name="idComputer" value="${computerAsus.idComputer }" />  
												<button type="button" onclick="addProductWithId('${computerAsus.idComputer}')" class="w3ls-cart"><fmt:message key="AddToCart"/></button>
											</form>
										</div>
									</div>
								</c:forEach>
								<div class="clearfix"> </div>
							</div>
						</div>
						<!-- End list asus's computers -->												
					
					</div>
				</div> 
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<!-- //banner-bottom --> 
	
	<!-- modal-video -->
	
<!-- start detail lenovo's computer -->
	<c:forEach var="computerLenovo" items="${listComputersLenovo}" begin="0" end="2">
		<div class="modal video-modal fade" id="${computerLenovo.idComputer}" tabindex="-1" role="dialog" aria-labelledby="myModal">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
					</div>
					<section>
						<div class="modal-body">
							<div class="col-md-5 modal_body_left">
								<img src="${computerLenovo.representImage}" alt=" " class="img-responsive" />
							</div>
							<div class="col-md-7 modal_body_right">
								<h4>${computerLenovo.nameComputer }</h4>
								<p>${computerLenovo.description }</p>
								<div class="rating">
								<c:forEach begin="1" end="${computerLenovo.rate}">
									<div class="rating-left">
										<img src="images/star-.png" alt=" " class="img-responsive" />
									</div>
								</c:forEach>
									<div class="clearfix"> </div>
								</div>
								<div class="modal_body_right_cart simpleCart_shelfItem">
									<p><span>$${computerLenovo.oldPrice}</span> <i class="item_price">$${computerLenovo.newPrice }</i></p>
									<form action="${addProduct }" method="post">
										<input type="hidden" name="quantity" value="1"> 
										<input type="hidden" name="idComputer" value="${computerLenovo.idComputer}">   
										<button type="button" onclick="addProductWithId('${computerLenovo.idComputer}')" class="w3ls-cart"><fmt:message key="AddToCart"/></button>
									</form>
								</div>
							</div>
							<div class="clearfix"> </div>
						</div>
					</section>
				</div>
			</div>
		</div>	
	</c:forEach>
<!-- End lenovo's computer details -->

<!-- start detail hp's computer -->
	<c:forEach var="computerHP" items="${listComputersHP}" begin="0" end="2">
		<div class="modal video-modal fade" id="${computerHP.idComputer}" tabindex="-1" role="dialog" aria-labelledby="myModal">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
					</div>
					<section>
						<div class="modal-body">
							<div class="col-md-5 modal_body_left">
								<img src="${computerHP.representImage}" alt=" " class="img-responsive" />
							</div>
							<div class="col-md-7 modal_body_right">
								<h4>${computerHP.nameComputer }</h4>
								<p>${computerHP.description }</p>
								<div class="rating">
								<c:forEach begin="1" end="${computerHP.rate}">
									<div class="rating-left">
										<img src="images/star-.png" alt=" " class="img-responsive" />
									</div>
								</c:forEach>
									<div class="clearfix"> </div>
								</div>
								<div class="modal_body_right_cart simpleCart_shelfItem">
									<p><span>$${computerHP.oldPrice}</span> <i class="item_price">$${computerHP.newPrice }</i></p>
									<form action="${addProduct }" method="post">
										<input type="hidden" name="quantity" value="1"> 
										<input type="hidden" name="idComputer" value="${computerHP.idComputer}">  
										<button type="button" onclick="addProductWithId('${computerHP.idComputer}')" class="w3ls-cart"><fmt:message key="AddToCart"/></button>
									</form>
								</div>
							</div>
							<div class="clearfix"> </div>
						</div>
					</section>
				</div>
			</div>
		</div>	
	</c:forEach>
<!-- End hp's computer details -->

<!-- start detail dell's computer -->
	<c:forEach var="computerDell" items="${listComputersDell}" begin="0" end="2">
		<div class="modal video-modal fade" id="${computerDell.idComputer}" tabindex="-1" role="dialog" aria-labelledby="myModal">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
					</div>
					<section>
						<div class="modal-body">
							<div class="col-md-5 modal_body_left">
								<img src="${computerDell.representImage}" alt=" " class="img-responsive" />
							</div>
							<div class="col-md-7 modal_body_right">
								<h4>${computerDell.nameComputer }</h4>
								<p>${computerDell.description }</p>
								<div class="rating">
								<c:forEach begin="1" end="${computerDell.rate}">
									<div class="rating-left">
										<img src="images/star-.png" alt=" " class="img-responsive" />
									</div>
								</c:forEach>
									<div class="clearfix"> </div>
								</div>
								<div class="modal_body_right_cart simpleCart_shelfItem">
									<p><span>$${computerDell.oldPrice}</span> <i class="item_price">$${computerDell.newPrice }</i></p>
									<form action="${addProduct }" method="post">
										<input type="hidden" name="quantity" value="1"> 
										<input type="hidden" name="idComputer" value="${computerDell.idComputer}">  
										<button type="button" onclick="addProductWithId('${computerDell.idComputer}')" class="w3ls-cart"><fmt:message key="AddToCart"/></button>
									</form>
								</div>
							</div>
							<div class="clearfix"> </div>
						</div>
					</section>
				</div>
			</div>
		</div>	
	</c:forEach>
<!-- End dell's computer details -->

<!-- start detail acer's computer -->
	<c:forEach var="computerAcer" items="${listComputersAcer}" begin="0" end="2">
		<div class="modal video-modal fade" id="${computerAcer.idComputer}" tabindex="-1" role="dialog" aria-labelledby="myModal">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
					</div>
					<section>
						<div class="modal-body">
							<div class="col-md-5 modal_body_left">
								<img src="${computerAcer.representImage}" alt=" " class="img-responsive" />
							</div>
							<div class="col-md-7 modal_body_right">
								<h4>${computerAcer.nameComputer }</h4>
								<p>${computerAcer.description }</p>
								<div class="rating">
								<c:forEach begin="1" end="${computerAcer.rate}">
									<div class="rating-left">
										<img src="images/star-.png" alt=" " class="img-responsive" />
									</div>
								</c:forEach>
									<div class="clearfix"> </div>
								</div>
								<div class="modal_body_right_cart simpleCart_shelfItem">
									<p><span>$${computerAcer.oldPrice}</span> <i class="item_price">$${computerAcer.newPrice }</i></p>
									<form action="${addProduct }" method="post">
										<input type="hidden" name="quantity" value="1"> 
										<input type="hidden" name="idComputer" value="${computerAcer.idComputer}">   
										<button type="button" onclick="addProductWithId('${computerAcer.idComputer}')" class="w3ls-cart"><fmt:message key="AddToCart"/></button>
									</form>
								</div>
							</div>
							<div class="clearfix"> </div>
						</div>
					</section>
				</div>
			</div>
		</div>	
	</c:forEach>
<!-- End acer's computer details -->

<!-- start detail asus's computer -->
	<c:forEach var="computerAsus" items="${listComputersAsus}" begin="0" end="2">
		<div class="modal video-modal fade" id="${computerAsus.idComputer}" tabindex="-1" role="dialog" aria-labelledby="myModal">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
					</div>
					<section>
						<div class="modal-body">
							<div class="col-md-5 modal_body_left">
								<img src="${computerAsus.representImage}" alt=" " class="img-responsive" />
							</div>
							<div class="col-md-7 modal_body_right">
								<h4>${computerAsus.nameComputer }</h4>
								<p>${computerAsus.description }</p>
								<div class="rating">
								<c:forEach begin="1" end="${computerAsus.rate}">
									<div class="rating-left">
										<img src="images/star-.png" alt=" " class="img-responsive" />
									</div>
								</c:forEach>
									<div class="clearfix"> </div>
								</div>
								<div class="modal_body_right_cart simpleCart_shelfItem">
									<p><span>$${computerAsus.oldPrice}</span> <i class="item_price">$${computerAsus.newPrice }</i></p>
									<form action="${addProduct }" method="post">
										<input type="hidden" name="quantity" value="1"> 
										<input type="hidden" name="idComputer" value="${computerAsus.idComputer}">  
										<button type="button" onclick="addProductWithId('${computerAsus.idComputer}')" class="w3ls-cart"><fmt:message key="AddToCart"/></button>
									</form>
								</div>
							</div>
							<div class="clearfix"> </div>
						</div>
					</section>
				</div>
			</div>
		</div>	
	</c:forEach>
<!-- End asus's computer details -->

<% List<Computer> newComputers = computerDao.findNewProducts(); %>
<c:set var="newComputers" value="<%= newComputers %>"> </c:set>
<!-- start detail new computer -->
<c:forEach var="computer" items="${newComputers}" begin="0" end="3">
		<div class="modal video-modal fade" id="new-${computer.idComputer}" tabindex="-1" role="dialog" aria-labelledby="myModal">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
					</div>
					<section>
						<div class="modal-body">
							<div class="col-md-5 modal_body_left">
								<img src="${computer.representImage}" alt=" " class="img-responsive" />
							</div>
							<div class="col-md-7 modal_body_right">
								<h4>${computer.nameComputer }</h4>
								<p>${computer.description }</p>
								<div class="rating">
								<c:forEach begin="1" end="${computer.rate}">
									<div class="rating-left">
										<img src="images/star-.png" alt=" " class="img-responsive" />
									</div>
								</c:forEach>
									<div class="clearfix"> </div>
								</div>
								<div class="modal_body_right_cart simpleCart_shelfItem">
									<p><span>$${computer.oldPrice}</span> <i class="item_price">$${computer.newPrice }</i></p>
									<form action="${addProduct }" method="post">
										<input type="hidden" name="quantity" value="1"> 
										<input type="hidden" name="idComputer" value="${computer.idComputer}">  
										<button type="button" onclick="addProductWithId('${computer.idComputer}')" class="w3ls-cart"><fmt:message key="AddToCart"/></button>
									</form>
								</div>
							</div>
							<div class="clearfix"> </div>
						</div>
					</section>
				</div>
			</div>
		</div>	
	</c:forEach>
<!-- end detail new computer -->

	<!-- //modal-video -->
	
	
	<!-- banner-bottom1 -->
	<div class="banner-bottom1">
		<div class="agileinfo_banner_bottom1_grids">
			<div class="col-md-7 agileinfo_banner_bottom1_grid_left">
				<h3>Grand Opening Event With flat<span>20% <i>Discount</i></span></h3>
				<a href="products.jsp">Shop Now</a>
			</div>
			<div class="col-md-5 agileinfo_banner_bottom1_grid_right">
				<h4>hot deal</h4>
				<div class="timer_wrap">
					<div id="counter"> </div>
				</div>
				<script src="js/jquery.countdown.js"></script>
				<script src="js/script.js"></script>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<!-- //banner-bottom1 --> 
	
	<!-- special-deals -->
	<div class="special-deals">
		<div class="container">
			<h2><fmt:message key="SpecialOffers"/></h2>
			<div class="w3agile_special_deals_grids">
				<div class="col-md-7 w3agile_special_deals_grid_left">
					<div class="w3agile_special_deals_grid_left_grid">
						<img src="images/21.jpg" alt=" " class="img-responsive" />
						<div class="w3agile_special_deals_grid_left_grid_pos1">
							<h5>30%<span>Off/-</span></h5>
						</div>
						<div class="w3agile_special_deals_grid_left_grid_pos">
							<h4>We Offer <span>Best Products</span></h4>
						</div>
					</div>
					<div class="wmuSlider example1">
						<div class="wmuSliderWrapper">
							<article style="position: absolute; width: 100%; opacity: 0;"> 
								<div class="banner-wrap">
									<div class="w3agile_special_deals_grid_left_grid1">
										<img src="images/t1.png" alt=" " class="img-responsive" />
										<p>Quis autem vel eum iure reprehenderit qui in ea voluptate 
											velit esse quam nihil molestiae consequatur, vel illum qui dolorem 
											eum fugiat quo voluptas nulla pariatur</p>
										<h4>Laura</h4>
									</div>
								</div>
							</article>
							<article style="position: absolute; width: 100%; opacity: 0;"> 
								<div class="banner-wrap">
									<div class="w3agile_special_deals_grid_left_grid1">
										<img src="images/t2.png" alt=" " class="img-responsive" />
										<p>Quis autem vel eum iure reprehenderit qui in ea voluptate 
											velit esse quam nihil molestiae consequatur, vel illum qui dolorem 
											eum fugiat quo voluptas nulla pariatur</p>
										<h4>Michael</h4>
									</div>
								</div>
							</article>
							<article style="position: absolute; width: 100%; opacity: 0;"> 
								<div class="banner-wrap">
									<div class="w3agile_special_deals_grid_left_grid1">
										<img src="images/t3.png" alt=" " class="img-responsive" />
										<p>Quis autem vel eum iure reprehenderit qui in ea voluptate 
											velit esse quam nihil molestiae consequatur, vel illum qui dolorem 
											eum fugiat quo voluptas nulla pariatur</p>
										<h4>Rosy</h4>
									</div>
								</div>
							</article>
						</div>
					</div>
						<script src="js/jquery.wmuSlider.js"></script> 
						<script>
							$('.example1').wmuSlider();         
						</script> 
				</div>
				<div class="col-md-5 w3agile_special_deals_grid_right">
					<img src="images/20.jpg" alt=" " class="img-responsive" />
					<div class="w3agile_special_deals_grid_right_pos">
						<h4>Women's <span>Special</span></h4>
						<h5>save up <span>to</span> 30%</h5>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //special-deals -->
	
	<!-- new-products -->
	<div class="new-products">
		<div class="container">
			<h3><fmt:message key="NewProducts"/></h3>
			<div class="agileinfo_new_products_grids">
				<c:forEach var="computer" items="${newComputers}" begin="0" end="3">
					<div class="col-md-3 agileinfo_new_products_grid">
						<div class="agile_ecommerce_tab_left agileinfo_new_products_grid1">
							<div class="hs-wrapper hs-wrapper1">
								<c:forEach var="image" items="${computer.images}">
									<img src="${image}" alt=" " class="img-responsive" />					
								</c:forEach> 
								<div class="w3_hs_bottom w3_hs_bottom_sub">
									<ul>
										<li>
											<a href="#" data-toggle="modal" data-target="#new-${computer.idComputer}"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
										</li>
									</ul>
								</div>
							</div>
							<c:url var="url" value="/productDetails?idComputer=${computer.idComputer}"></c:url>
							<h5><a href="${url}">${computer.nameComputer }</a></h5>
							<div class="simpleCart_shelfItem">
								<p><span>$${computer.oldPrice }</span> <i class="item_price">$${computer.newPrice }</i></p>
								<form action="${addProduct }" method="post">
										<input type="hidden" name="quantity" value="1"> 
										<input type="hidden" name="idComputer" value="${computer.idComputer}">  
									<button type="button" onclick="addProductWithId('${computer.idComputer}')" class="w3ls-cart"><fmt:message key="AddToCart"/></button>
								</form>
							</div>
						</div>
					</div>
				</c:forEach>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //new-products -->
	
	<!-- Modal -->
<div class="modal fade" id="addSuccess" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><fmt:message key="Notification" /></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
			<h3><fmt:message key="AddSuccess"/></h3>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- end modal -->
	
	<!-- top-brands -->
	<div class="top-brands">
		<div class="container">
			<h3><fmt:message key="TopBrands"/></h3>
			<div class="sliderfig">
				<ul id="flexiselDemo1">			
					<li>
						<img src="images/tb1.jpg" alt=" " class="img-responsive" />
					</li>
					<li>
						<img src="images/tb2.jpg" alt=" " class="img-responsive" />
					</li>
					<li>
						<img src="images/tb3.jpg" alt=" " class="img-responsive" />
					</li>
					<li>
						<img src="images/tb4.jpg" alt=" " class="img-responsive" />
					</li>
					<li>
						<img src="images/tb5.jpg" alt=" " class="img-responsive" />
					</li>
				</ul>
			</div>
			<script type="text/javascript">
					$(window).load(function() {
						$("#flexiselDemo1").flexisel({
							visibleItems: 4,
							animationSpeed: 1000,
							autoPlay: true,
							autoPlaySpeed: 3000,    		
							pauseOnHover: true,
							enableResponsiveBreakpoints: true,
							responsiveBreakpoints: { 
								portrait: { 
									changePoint:480,
									visibleItems: 1
								}, 
								landscape: { 
									changePoint:640,
									visibleItems:2
								},
								tablet: { 
									changePoint:768,
									visibleItems: 3
								}
							}
						});
						
					});
			</script>
			<script type="text/javascript" src="js/jquery.flexisel.js"></script>
		</div>
	</div>
	<!-- //top-brands --> 
	
	<!-- 	send mail and footer -->
	<jsp:include page="footer/footer.jsp"></jsp:include>
	<!-- 	send mail and footer -->