<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Users - Evergreen Bookstore Administration</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<h2>User Mangment</h2>
		<a href="user_form.jsp">Create New User</a>
	</div>
	
	<c:if test="${Message != null}"></c:if>
	<div align="center">
	<h4>${Message}</h4>
	</div>
	<div align="center" >
		<table border="1" cellpadding="5">
			<tr>
				<th>Index</th>
				<th>ID</th>
				<th>Email</th>
				<th>Full Name</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="user" items="${listUsers}" varStatus="status">
				<tr>
					<td>${status.index}</td>
					<td>${user.userId}</td>
					<td>${user.email}</td>
					<td>${user.fullName}</td>
					<td><a href="edit_user?id=${user.userId}">Edit</a>&nbsp; <a href="javascript:confirmDelete(${user.userId})">Delete</a>&nbsp;</td>
				</tr>
			</c:forEach>
		</table>

	</div>

	<jsp:include page="footer.jsp" />
	<script type="text/javascript">
	function confirmDelete () {
		if (confirm("Are you sure you want to delete the user with id "+userId}+"?")){
			window location = "delete_user?id="+userId;
		}
		
	}
	
	
	</script>
	
</body>

</html>