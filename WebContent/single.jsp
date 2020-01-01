
<%@page import="model.Computer"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="computerDao" class="dao.ComputerDao" scope="session"></jsp:useBean>
<jsp:useBean id="computer" class="model.Computer" scope="request"></jsp:useBean>
	<!-- header -->
	<jsp:include page="header/header.jsp"></jsp:include>
	<!-- /header -->

	<!-- header login -->
	<jsp:include page="header/headerLogin.jsp"></jsp:include>
	<!-- header login -->
	
	<!-- header navigation -->
	<jsp:include page="header/headerNavigation.jsp"></jsp:include>
	<!-- header navigation -->
	
	<!-- banner -->
	<div class="banner banner10">
		<div class="container">
			<h2><fmt:message key="ProductDetails"/></h2>
		</div>
	</div>
	<!-- //banner -->   
	<!-- breadcrumbs -->
	<div class="breadcrumb_dress">
		<div class="container">
			<ul>
				<c:url var="urlHome" value="/index.jsp" />
				<li><a href="${urlHome}"><span class="glyphicon glyphicon-home" aria-hidden="true"></span><fmt:message key="Home"/></a> <i>/</i></li>
				<li><fmt:message key="Details"/></li>
			</ul>
		</div>
	</div>
	<!-- //breadcrumbs -->  
	
	<!-- single -->
<!-- start product details -->
	<div class="single">
		<div class="container">
			<div class="col-md-4 single-left">
				<div class="flexslider">
					<ul class="slides">
						<c:forEach var="image" items="${computer.images}" begin="0" end="2">
						<li data-thumb="${image}">
							<div class="thumb-image"> <img src="${image}" data-imagezoom="true" class="img-responsive" alt=""> </div>
						</li>
						</c:forEach>
					</ul>
				</div>
				<!-- flexslider -->
					<script defer src="js/jquery.flexslider.js"></script>
					<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
					<script>
					// Can also be used with $(document).ready()
					$(window).load(function() {
					  $('.flexslider').flexslider({
						animation: "slide",
						controlNav: "thumbnails"
					  });
					});
					</script>
				<!-- flexslider -->
				<!-- zooming-effect -->
					<script src="js/imagezoom.js"></script>
				<!-- //zooming-effect -->
			</div>
			<div class="col-md-8 single-right">
				<h3>${computer.nameComputer}</h3>
				<c:forEach begin="0" end="${computer.rate - 1}">
				<div class="rating-left">
					<img src="images/star-.png" alt=" " class="img-responsive" />
				</div>
				</c:forEach>
				<br>
				<div class="description">
					<h5><i style="text-transform: uppercase"><fmt:message key="Description"/></i></h5>
					<p>${computer.description}</p>
				</div>
				
				<div class="color-quality">
					<div class="color-quality-left">
						<h5><fmt:message key="Type"/> :</h5>
						<p  style="font-size:1.2em;color: #212121;font-weight: 600;text-transform: uppercase"><i>Laptop ${computer.type}</i></p>
					</div>
					
					<div class="color-quality-right">
						<h5><fmt:message key="Quantity"/> :</h5>
						 <div class="quantity"> 
							<div class="quantity-select">                           
								<div class="entry value-minus1">&nbsp;</div>
								<div class="entry value1" ><span id="quantity">1</span></div>
								<div class="entry value-plus1 active">&nbsp;</div>
							</div>
						</div>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="occasional" style="margin-bottom:2rem;">
					<h5><fmt:message key="Price"/> :</h5>
				</div>
				<div class="simpleCart_shelfItem">
					<p><span>$${computer.oldPrice }</span> <i class="item_price">$${computer.newPrice}</i></p>
						<form name="formProduct">
						<input type="hidden" name="quantity" value="1">
						<input type="hidden" name="idComputer" value="${computer.idComputer }">   
						<button type="button" onclick="addProduct()" class="w3ls-cart"><fmt:message key="AddToCart"/></button>
						</form> 
				</div>
				<!--quantity-->
					<script>
					$('.value-plus1').on('click', function(){
						var divUpd = $(this).parent().find('.value1'), newVal = parseInt(divUpd.text(), 10)+1 ;
						divUpd.text(newVal);
						document.formProduct.quantity.value = newVal;
					});

					$('.value-minus1').on('click', function(){
						var divUpd = $(this).parent().find('.value1'), newVal = parseInt(divUpd.text(), 10)-1;
						if(newVal>=1) divUpd.text(newVal);
						document.formProduct.quantity.value = newVal;
					});
					</script>
				<!--quantity-->
				
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- 	End products details  -->

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
	
<!-- Add a review -->
	<div class="additional_info">
		<div class="container">
			<div class="sap_tabs">	
				<div id="horizontalTab1" style="display: block; width: 100%; margin: 0px;">
					<ul>
						<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span><fmt:message key="ProductInformation"/></span></li>
						<li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span><fmt:message key="Reviews"/></span></li>
					</ul>		
					<div class="tab-1 resp-tab-content additional_info_grid" aria-labelledby="tab_item-0">
						<h3>${computer.nameComputer }</h3>
						<p>${computer.description} , ${computer.description }</p>
					</div>


					<div class="tab-2 resp-tab-content additional_info_grid" aria-labelledby="tab_item-1" id="bodyAddReview">
						<h4>(${sizeReviews}) <fmt:message key="Reviews"/></h4>
						<c:forEach var="review" items="${reviews}">
						<div class="additional_info_sub_grids">
							<div class="col-xs-2 additional_info_sub_grid_left">
								<img src="${review.avatarUser}"  style="height: 85px;width: auto;" alt=" " class="img-responsive" />
							</div>
							<div class="col-xs-10 additional_info_sub_grid_right">
								<div class="additional_info_sub_grid_rightl">
									<a href="single.jsp">${review.nameUser }</a>
									<h5>Oct 06, 2019.</h5>
									<p>${review.review }</p>
								</div>
								<div class="additional_info_sub_grid_rightr">
									<div class="rating">
										<c:forEach begin="0" end="${review.rate - 1 }">
											<div class="rating-left">
												<img src="images/star-.png" alt=" " class="img-responsive">
											</div>	
										</c:forEach>
										<div class="clearfix"> </div>
									</div>
								</div>
								<div class="clearfix"> </div>
							</div>
							<div class="clearfix"> </div>
						</div>
						</c:forEach>						

						<div class="review_grids">
							<h5><fmt:message key="AddReview"/></h5>
							<c:url var="url" value="/addReview"></c:url>
							<form name="formAddReview">
								<input type="hidden" name="url" value="${url}">
								<textarea name="review" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '<fmt:message key="AddReview"/>';}" required=""><fmt:message key="AddReview"/></textarea>
								<label style="margin-bottom: 2rem;">Danh gia :</label>
								<div class="rating1">
									<span class="starRating">
										<input id="rating5" type="radio" name="rating" value="5" >
										<label for="rating5">5</label>
										<input id="rating4" type="radio" name="rating" value="4">
										<label for="rating4">4</label>
										<input id="rating3" type="radio" name="rating" value="3" checked >
										<label for="rating3">3</label>
										<input id="rating2" type="radio" name="rating" value="2">
										<label for="rating2">2</label>
										<input id="rating1" type="radio" name="rating" value="1">
										<label for="rating1">1</label>
									</span>
								</div>
								<input type="hidden" value="${computer.idComputer}" name="idComputer">								
								<input type="button" value="<fmt:message key="Send"/>" onclick="addReview()">
							</form>
						</div>
						
					</div> 			        					            	      
				</div>	
			</div>
			<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
			<script type="text/javascript">
				$(document).ready(function () {
					$('#horizontalTab1').easyResponsiveTabs({
						type: 'default', //Types: default, vertical, accordion           
						width: 'auto', //auto or any width like 600px
						fit: true   // 100% fit in a container
					});
				});
			</script>
		</div>
	</div>
<!-- End add a review -->
	
	<!-- Related Products -->
	<% List<Computer> relatedComputers = computerDao.getComputersWithType(computer.getType()); %>
	<c:set var="relatedComputers" value="<%= relatedComputers %>"></c:set>
	<div class="w3l_related_products">
		<div class="container">
			<h3><fmt:message key="RelatedProducts"/></h3>
			<ul id="flexiselDemo2">	
				<c:forEach var="computer" items="${relatedComputers}" begin="0" end="3">
					<li>
						<div class="w3l_related_products_grid">
							<div class="agile_ecommerce_tab_left mobiles_grid">
								<div class="hs-wrapper hs-wrapper3">
									<c:forEach var="image" items="${computer.images }">
										<img src="${image }" alt=" " class="img-responsive" />
									</c:forEach>
									<div class="w3_hs_bottom">
										<div class="flex_ecommerce">
											<a href="#" data-toggle="modal" data-target="#${computer.idComputer}"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
										</div>
									</div>
								</div>
								<c:url var="url" value="/productDetails?idComputer=${computer.idComputer}"></c:url>
								<h5><a href="${url}">${computer.nameComputer }</a></h5>
								<div class="simpleCart_shelfItem">
									<p><span>$${computer.oldPrice }</span> <i class="item_price">$${computer.newPrice}</i></p>
									<c:url var="addProduct" value="/AddProduct"></c:url>
									<form action="${addProduct}" method="post">
										<input type="hidden" name="quantity" value="1"> 
										<input type="hidden" name="idComputer" value="${computer.idComputer }">   
										<button type="button" onclick="addProductWithId('${computer.idComputer}')" class="w3ls-cart"><fmt:message key="AddToCart"/></button>
									</form>
								</div> 
								<c:if test="${computer.status == 'new' }">							
									<div class="mobiles_grid_pos">
										<h6>New</h6>
									</div>
								</c:if>
							</div> 
						</div>
					</li>
				</c:forEach>		
			</ul>
			
				<script type="text/javascript">
					$(window).load(function() {
						$("#flexiselDemo2").flexisel({
							visibleItems:4,
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
	<!-- //Related Products -->
	
	<!-- show product details for related products -->
	<c:forEach var="computer" items="${relatedComputers}" begin="0" end="3">
	<div class="modal video-modal fade" id="${computer.idComputer }" tabindex="-1" role="dialog" aria-labelledby="myModal6">
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
								<p><span>$${computer.oldPrice }</span> <i class="item_price">$${computer.newPrice }</i></p> 
								<c:url var="addProduct" value="/AddProduct"></c:url>
								<form action="${addProduct}" method="post">
									<input type="hidden" name="quantity" value="1"> 
									<input type="hidden" name="idComputer" value="${computer.idComputer }">   
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
<!-- End show product details for related products-->
	
	
	<!-- //single -->
	
	<!-- send mail and footer -->
	<jsp:include page="footer/footer.jsp"></jsp:include>
	<!-- send mail and footer --> 