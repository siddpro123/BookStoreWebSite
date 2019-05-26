<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div align="center">
	<div>
	<a href ="${pageContext.request.contextPath}/admin/">
		<img src="images/BookstoreLogo.png"/></a>
	</div>
	<div>
		Welcome, <c:out value="${sessionScope.useremail}"/> | <a href="logout">Logout</a>
	</div>
	<div>
		<a href="list_users">Users</a>|
		<a href="list_category">Categories</a>|
		<a href="list_books">Books</a>|
		<a href="list_customer">Customers</a>|
		<a href="list_review">Reviews</a>|
		<a href="list_order">Orders</a>
	</div>
</div>