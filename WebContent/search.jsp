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
	
	<c:choose>
		<c:when test="${empty searchComputers}">
			<div class="new-products" style="margin: 7rem">
				<h3><fmt:message key="NotFound"/></h3>
			</div>
		</c:when>
		<c:otherwise>
			<!-- new-products -->
				<div class="new-products" >
					<div class="container" style="margin-top: -60px">
						<div class="agileinfo_new_products_grids">
							<c:forEach var="computer" items="${searchComputers}">
								<div class="col-md-3 agileinfo_new_products_grid" style="margin-bottom: 1.5rem">
									<div class="agile_ecommerce_tab_left agileinfo_new_products_grid1">
										<div class="hs-wrapper hs-wrapper1">
											<c:forEach var="image" items="${computer.images}">
												<img src="${image}" alt=" " class="img-responsive" />					
											</c:forEach> 
											<div class="w3_hs_bottom w3_hs_bottom_sub">
												<ul>
													<li>
														<a href="#" data-toggle="modal" data-target="#${computer.idComputer}"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
													</li>
												</ul>
											</div>
										</div>
										<c:url var="url" value="/productDetails?idComputer=${computer.idComputer}"></c:url>
										<h5><a href="${url}">${computer.nameComputer }</a></h5>
										<div class="simpleCart_shelfItem">
											<p><span>$${computer.oldPrice }</span> <i class="item_price">$${computer.newPrice }</i></p>
											<c:url var="addProduct" value="/AddProduct"></c:url>
											<form action="${addProduct}" method="post">
												<input type="hidden" name="quantity" value="1"> 
												<input type="hidden" name="idComputer" value="${computer.idComputer }">   
												<button type="button" onclick="addProductWithId('${computer.idComputer}')" class="w3ls-cart"><fmt:message key="AddToCart"/></button>
											</form>
										</div>
										<c:if test="${computer.status == 'new' }">							
											<div class="mobiles_grid_pos" style="margin-right: 10px">
												<h6>New</h6>
											</div>
										</c:if>
									</div>
								</div>
							</c:forEach>
							<div class="clearfix"> </div>
						</div>
					</div>
				</div>
				<!-- //new-products -->	
				
			<!-- start detail new computer -->
			<c:forEach var="computer" items="${searchComputers}">
					<div class="modal video-modal fade" id="${computer.idComputer}" tabindex="-1" role="dialog" aria-labelledby="myModal">
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
												<c:url var="addProduct" value="/AddProduct"></c:url>
												<form action="${addProduct}" method="post">
													<input type="hidden" name="quantity" value="1"> 
													<input type="hidden" name="idComputer" value="${computer.idComputer }"> 
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
			
		</c:otherwise>
	</c:choose>
	
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
		
	
	
	<!-- send mail and footer -->
	<jsp:include page="footer/footer.jsp"></jsp:include>
	<!-- send mail and footer --> 	