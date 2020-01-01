<%@page import="java.util.List"%>
<%@page import="java.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
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
	<div class="banner banner1">
		<div class="container">
			<h2>Great Offers on <span>Mobiles</span> Flat <i>35% Discount</i></h2> 
		</div>
	</div> 
	<!-- breadcrumbs -->
	<div class="breadcrumb_dress">
		<div class="container">
			<ul>
				<li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a> <i><fmt:message key="Home"/></i></li>
				<li><fmt:message key="Products"/></li>
			</ul>
		</div>
	</div>
	<!-- //breadcrumbs --> 
	<!-- mobiles -->
	<div class="mobiles">
		<div class="container">
			<div class="w3ls_mobiles_grids">
				<div class="col-md-4 w3ls_mobiles_grid_left">
					<div class="w3ls_mobiles_grid_left_grid">
						<h3><fmt:message key="Categories"/></h3>
						<div class="w3ls_mobiles_grid_left_grid_sub">
							<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
							  <div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
								  <h4 class="panel-title asd">
									<a class="pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									  <span class="glyphicon glyphicon-plus" aria-hidden="true"></span><i class="glyphicon glyphicon-minus" aria-hidden="true"></i><fmt:message key="NewProducts"/>
									</a>
								  </h4>
								</div>
								<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
								  <div class="panel-body panel_text">
									<ul>
										<li><a style="cursor: pointer;" onclick="findNew('lenovo')"><fmt:message key="Lenovo"/></a></li>
										<li><a style="cursor: pointer;" onclick="findNew('Hp')"><fmt:message key="Hp"/></a></li>
										<li><a style="cursor: pointer;" onclick="findNew('Dell')"><fmt:message key="Dell"/></a></li>
										<li><a style="cursor: pointer;" onclick="findNew('Acer')"><fmt:message key="Acer"/></a></li>
										<li><a style="cursor: pointer;" onclick="findNew('Asus')"><fmt:message key="Asus"/></a></li>
									</ul>
								  </div>
								</div>
							  </div>
							  <div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingTwo">
								  <h4 class="panel-title asd">
									<a class="pa_italic collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
									  <span class="glyphicon glyphicon-plus" aria-hidden="true"></span><i class="glyphicon glyphicon-minus" aria-hidden="true"></i><fmt:message key="MostSell"/>
									</a>
								  </h4>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
								   <div class="panel-body panel_text">
									<ul>
										<li><a style="cursor: pointer;" onclick="findTopSellWithType('lenovo')"/><fmt:message key="Lenovo"/></a></li>
										<li><a style="cursor: pointer;" onclick="findTopSellWithType('hp')"><fmt:message key="Hp"/></a></li>
										<li><a style="cursor: pointer;" onclick="findTopSellWithType('dell')"><fmt:message key="Dell"/></a></li>
										<li><a style="cursor: pointer;" onclick="findTopSellWithType('acer')"><fmt:message key="Acer"/></a></li>
										<li><a style="cursor: pointer;" onclick="findTopSellWithType('asus')"><fmt:message key="Asus"/></a></li>
										<li><a style="cursor: pointer;" onclick="findTopSell()"><fmt:message key="All"/></a></li>
									</ul>
								  </div>
								</div>
							  </div>
							</div>
						</div>
					</div>
					
					<div class="w3ls_mobiles_grid_left_grid">
						<h3><fmt:message key="Price"/></h3>
						<div class="w3ls_mobiles_grid_left_grid_sub">
							<div class="ecommerce_color ecommerce_size">
								<ul>
									<li><a style="cursor: pointer;" onclick="findPriceBetween(0,50)"><fmt:message key="Below"/> $ 50</a></li>
									<li><a style="cursor: pointer;" onclick="findPriceBetween(50,300)">$ 50-300</a></li>
									<li><a style="cursor: pointer;" onclick="findPriceBetween(300,600)">$ 300-600</a></li>
									<li><a style="cursor: pointer;" onclick="findPriceBetween(600,800)">$ 600-800</a></li>
									<li><a style="cursor: pointer;" onclick="findPriceBetween(800,5000)">$ <fmt:message key="Above"/> 800</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-8 w3ls_mobiles_grid_right" id="result">
					<div class="clearfix"> </div>
					<div class="w3ls_mobiles_grid_right_grid2">
						<div class="w3ls_mobiles_grid_right_grid2_left">
							<h3><fmt:message key="ShowResult"/>: (${size})</h3>
						</div>

						<div class="clearfix"> </div>
					</div>
					
					<% int size = (Integer)request.getAttribute("size");
						if(size>12){
							size =12;
						}
						int loop = size/3;
						if(size%3!=0){
							loop = loop +1;
						}
						int start=0;
						int end=2;
						for(int i=0;i< loop;i++){ %>
					<c:set var="start" value="<%= start %>"></c:set>
					<c:set var="end" value="<%= end %>"></c:set>
					<div class="w3ls_mobiles_grid_right_grid3" style="margin-bottom: 2rem">
						<c:forEach var="computer" items="${groupComputers}" begin="${start}" end="${end}">
							<div class="col-md-4 agileinfo_new_products_grid agileinfo_new_products_grid_mobiles">
								<div class="agile_ecommerce_tab_left mobiles_grid">
									<div class="hs-wrapper hs-wrapper2">
										<c:forEach var="image" items="${computer.images }">
											<img src="${image}" alt=" " class="img-responsive" />
										
										</c:forEach>
										<div class="w3_hs_bottom w3_hs_bottom_sub1">
											<ul>
												<li>
													<a href="#" data-toggle="modal" data-target="#${computer.idComputer}"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
												</li>
											</ul>
										</div>
									</div>
									<c:url var="url" value="/productDetails?idComputer=${computer.idComputer}"></c:url>
									<h5><a href="${url}">${computer.nameComputer}</a></h5> 
									<div class="simpleCart_shelfItem">
										<p><span>$${computer.oldPrice}</span> <i class="item_price">$${computer.newPrice}</i></p>
										<c:url var="addProduct" value="/AddProduct"></c:url>
										<form action="${addProduct }" method="post">
											<input type="hidden" name="quantity" value="1" /> 
											<input type="hidden" name="idComputer" value="${computer.idComputer}" /> 
											<button type="button" onclick="addProductWithId('${computer.idComputer}')" class="w3ls-cart"><fmt:message key="AddToCart" /></button>
										</form> 
									</div>
									<c:if test="${computer.status == 'new' }">
										<div class="mobiles_grid_pos">
											<h6>New</h6>
										</div>
									</c:if>
								</div>
							</div>
						</c:forEach>
						<div class="clearfix"> </div>
					</div>
					<%	
						start = start +3;
						end = end + 3;
						if(end > size){
							end = size;
						}
						}					
					%>
					
				<!-- Start model -->
				<c:forEach var="computer" items="${groupComputers}">
					<div class="modal video-modal fade" id="${computer.idComputer}" tabindex="-1" role="dialog" aria-labelledby="myModal9">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
								</div>
								<section>
									<div class="modal-body">
										<div class="col-md-5 modal_body_left">
											<img src="${computer.representImage }" alt=" " class="img-responsive" />
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
												<p><span>$${computer.oldPrice}</span> <i class="item_price">$${computer.newPrice}</i></p>
												<c:url var="addProduct" value="/AddProduct"></c:url>
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
					<!--end modal -->
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div> 
	
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
	
	<!-- Related Products -->
	<div class="w3l_related_products">
		<div class="container">
			<h3>Related Products</h3>
			<ul id="flexiselDemo2">			
				<li>
					<div class="w3l_related_products_grid">
						<div class="agile_ecommerce_tab_left mobiles_grid">
							<div class="hs-wrapper hs-wrapper3">
								<img src="images/34.jpg" alt=" " class="img-responsive" />
								<img src="images/35.jpg" alt=" " class="img-responsive" />
								<img src="images/27.jpg" alt=" " class="img-responsive" />
								<img src="images/28.jpg" alt=" " class="img-responsive" />
								<img src="images/37.jpg" alt=" " class="img-responsive" /> 
								<div class="w3_hs_bottom">
									<div class="flex_ecommerce">
										<a href="#" data-toggle="modal" data-target="#myModal6"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
									</div>
								</div>
							</div>
							<h5><a href="single.jsp">Kid's Toy</a></h5>
							<div class="simpleCart_shelfItem"> 
								<p class="flexisel_ecommerce_cart"><span>$150</span> <i class="item_price">$100</i></p>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart">
									<input type="hidden" name="add" value="1"> 
									<input type="hidden" name="w3ls_item" value="Kid's Toy"> 
									<input type="hidden" name="amount" value="100.00">   
									<button type="submit" class="w3ls-cart">Add to cart</button>
								</form> 
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="w3l_related_products_grid">
						<div class="agile_ecommerce_tab_left mobiles_grid">
							<div class="hs-wrapper hs-wrapper3">
								<img src="images/36.jpg" alt=" " class="img-responsive" />
								<img src="images/32.jpg" alt=" " class="img-responsive" />
								<img src="images/33.jpg" alt=" " class="img-responsive" />
								<img src="images/32.jpg" alt=" " class="img-responsive" />
								<img src="images/36.jpg" alt=" " class="img-responsive" /> 
								<div class="w3_hs_bottom">
									<div class="flex_ecommerce">
										<a href="#" data-toggle="modal" data-target="#myModal5"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
									</div>
								</div>
							</div>
							<h5><a href="single.jsp">Vacuum Cleaner</a></h5>
							<div class="simpleCart_shelfItem">
								<p class="flexisel_ecommerce_cart"><span>$960</span> <i class="item_price">$920</i></p>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart" />
									<input type="hidden" name="add" value="1" /> 
									<input type="hidden" name="w3ls_item" value="Vacuum Cleaner" /> 
									<input type="hidden" name="amount" value="920.00"/>   
									<button type="submit" class="w3ls-cart">Add to cart</button>
								</form>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="w3l_related_products_grid">
						<div class="agile_ecommerce_tab_left mobiles_grid">
							<div class="hs-wrapper hs-wrapper3">
								<img src="images/38.jpg" alt=" " class="img-responsive" />
								<img src="images/37.jpg" alt=" " class="img-responsive" />
								<img src="images/27.jpg" alt=" " class="img-responsive" />
								<img src="images/28.jpg" alt=" " class="img-responsive" />
								<img src="images/37.jpg" alt=" " class="img-responsive" /> 
								<div class="w3_hs_bottom">
									<div class="flex_ecommerce">
										<a href="#" data-toggle="modal" data-target="#myModal3"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
									</div>
								</div>
							</div>
							<h5><a href="single.jsp">Microwave Oven</a></h5>
							<div class="simpleCart_shelfItem">
								<p class="flexisel_ecommerce_cart"><span>$650</span> <i class="item_price">$645</i></p>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart" />
									<input type="hidden" name="add" value="1" /> 
									<input type="hidden" name="w3ls_item" value="Microwave Oven" /> 
									<input type="hidden" name="amount" value="645.00"/>   
									<button type="submit" class="w3ls-cart">Add to cart</button>
								</form>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="w3l_related_products_grid">
						<div class="agile_ecommerce_tab_left mobiles_grid">
							<div class="hs-wrapper hs-wrapper3">
								<img src="images/p3.jpg" alt=" " class="img-responsive" />
								<img src="images/p5.jpg" alt=" " class="img-responsive" />
								<img src="images/p4.jpg" alt=" " class="img-responsive" />
								<img src="images/p2.jpg" alt=" " class="img-responsive" />
								<img src="images/p1.jpg" alt=" " class="img-responsive" /> 
								<div class="w3_hs_bottom">
									<div class="flex_ecommerce">
										<a href="#" data-toggle="modal" data-target="#myModal4"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
									</div>
								</div>
							</div>
							<h5><a href="single.jsp">Music MP3 Player</a></h5>
							<div class="simpleCart_shelfItem">
								<p><span>$60</span> <i class="item_price">$58</i></p>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart" />
									<input type="hidden" name="add" value="1" /> 
									<input type="hidden" name="w3ls_item" value="Ultra MP3 Player" /> 
									<input type="hidden" name="amount" value="58.00"/>   
									<button type="submit" class="w3ls-cart">Add to cart</button>
								</form>
							</div> 
							<div class="mobiles_grid_pos">
								<h6>New</h6>
							</div>
						</div> 
					</div>
				</li>
			</ul>
			
				
		</div>
	</div>
	<!-- //Related Products -->
	
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
						changePoint:568,
						visibleItems: 1
					}, 
					landscape: { 
						changePoint:667,
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
	
	
	<!-- send mail and footer -->
	<jsp:include page="footer/footer.jsp"></jsp:include>
	<!-- send mail and footer -->  
