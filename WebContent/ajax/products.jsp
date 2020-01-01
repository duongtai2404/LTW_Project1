<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<div class="clearfix"> </div>
	<div class="w3ls_mobiles_grid_right_grid2">
		<div class="w3ls_mobiles_grid_right_grid2_left">
			<h3><fmt:message key="ShowResult"/>: (${size})</h3>
		</div>
		<div class="clearfix"> </div>
	</div>
	
<c:choose>
	<c:when test="${size ==0 }">
		<h3 style="text-align: center;font-weight: 600"><fmt:message key="NoProduct"/></h3>
	</c:when>
	<c:otherwise>
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
		for(int i=0;i<loop;i++){ %>
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
									<button type="submit" class="w3ls-cart"><fmt:message key="AddToCart"/></button>
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
	</c:otherwise>
</c:choose>
	