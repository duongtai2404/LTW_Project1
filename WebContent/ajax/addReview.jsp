<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h4>(${sizeReviews}) <fmt:message key="Reviews"/></h4>
<c:forEach var="review" items="${reviews}">
<div class="additional_info_sub_grids">
	<div class="col-xs-2 additional_info_sub_grid_left">
		<img src="${review.avatarUser}" alt=" " class="img-responsive" />
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
						
	
