<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<ul>
<c:forEach var="computer" items="${searchComputers}">
	<c:url var="url" value="/productDetails?idComputer=${computer.idComputer}"></c:url>
	<li style="color: white;padding: 0.5rem " onmouseover="this.style.background='white';" onmouseout="this.style.background='#212121';"><a href="${url}">${computer.nameComputer }</a></li>
</c:forEach>
</ul>
