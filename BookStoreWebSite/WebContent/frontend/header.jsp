<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div align="center">
	<div>
		<a href ="${pageContext.request.contextPath}/">
		<img src="images/BookstoreLogo.png"/></a>
	</div>
	<div>
	<form action="search" method="get">
		<input type="text" name="keyword" size="50" />
		<input type="sbmit" value="search"/>
		</form>
		&nbsp;
		&nbsp;
		&nbsp;
		&nbsp;
		<c:if test="${loogedCustomer==null}">
		<a href="Login">Sign In</a>|
		<a href="register">Register</a> |
		</c:if>
		
		<c:if test="${loogedCustomer != null}">
		<a href="view_profile">welcome, ${loggedCustomer.fullname}</a>|
		<a href="view_orders">My Orders</a> |
		<a href="Logout">Logout</a> |
		</c:if>
		
		<a href="view cart">Cart</a>
	</form>
	</div>
	<div> 
	<c:forEach var="category" items= "${listCategory}" varStatus ="status">
	<a href="view_category?id=${category.categoryId}">
	<font size="+1"><b><c:out value="${category.name}"></c:out></b>|</font>
	</a>
	<c:if test="${not status.last}"></c:if>
	&nbsp; |&nbsp;
	</c:forEach> </div>
</div>