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
	
	<div class="new-products" style="margin: 1rem;padding: 2.5rem;">
		<h3 style="padding-bottom: 0rem"><fmt:message key="Receipt"/></h3>
	</div>

	
	<div class="container" style="margin: 1rem;width: 98%;">
		<div class="header-of-userscenario" style="background-color: #9c8b8b1c;font-size: 15px;padding: 15px;">
			<h4 style="color: red;margin: 1rem"><fmt:message key="ReceiptAddress"/></h4>
			<div class="row">
				<div class="col-lg-3 col-md-3 text-center" style="margin-left: -4%">
					<h4 style="font-weight: 600">${user.userName }</h4>
				</div>
				<div class="col-lg-9 col-md-9">
					<form action="#" method="get">
						<div class="col-lg-3 col-md-3" >
							<input type="number" value="${user.phone}" name="phone" style="width:100%">
						</div>
						<div class="col-lg-7 col-md-7" >
							<input type="text" value="${user.address}" name="address" style="width:100%">
						</div>
						<div class="col-lg-2 col-md-2 text-center">
							<button type="submit" class="btn btn-secondary"><fmt:message key="Change"/></button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<div class="body-of-userscenario mt-3" style="background-color: #9c8b8b1c">
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
					      <td style="width: 30%;text-align: center;font-size: 18px;font-weight: 600;">$${item.price }</td>
					      <td class=" text-center">
					      	<c:url var="removeProduct" value="/RemoveProduct"></c:url>
					      	<form action="${removeProduct}" method="post">
								<input type="hidden" name="showMiniCart" value="show">
								<input type="hidden" name="idComputer" value="${item.computer.idComputer}">							      	
						      	<button type="submit" class="btn btn-secondary">x</button>
					      	</form>
					      </td>
					    </tr>
					    <hr>
					   </c:forEach>
					  </tbody>
					</table>
	      		</c:otherwise>
	      	</c:choose>		
		</div>	
		
		<div class="text-right" style="margin-top: 1rem">
			<h3 style="font-weight: 600"><fmt:message key="Subtotal"/>:			$${shoppingCart.subtotal}</h3>
		</div>
		<div class="text-right" style="margin-top: 1rem">
			<button type="button" class="btn btn-info" style="font-size: 16px"><fmt:message key="Pay"/></button>
		</div>
	</div>	
	
		
	<!-- send mail and footer -->
	<jsp:include page="footer/footer.jsp"></jsp:include>
	<!-- send mail and footer --> 