<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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