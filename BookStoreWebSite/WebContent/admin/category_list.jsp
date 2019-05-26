<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Categories - Evergreen Bookstore Administration</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<h2>Category Mangment</h2>
		<a href="category_form.jsp">Create New Category</a>
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
				<th>Full Name</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="cat" items="${listCategory}" varStatus="status">
				<tr>
					<td>${status.index + 1}</td>
					<td>${cat.categoryId}</td>
					<td>${cat.name}</td>
					<td><a href="edit_category?id=${cat.categoryId}">Edit</a>&nbsp; <a href="javascript:confirmDelete(${cat.categoryId})">Delete</a>&nbsp;</td>
				</tr>
			</c:forEach>
		</table>

	</div>

	<jsp:include page="footer.jsp" />
	<script type="text/javascript">
	function confirmDelete (categoryId) {
		if (confirm("Are you sure you want to delete the category with id "+categoryId+"?")){
			window location = "delete_category?id="+categoryId;
		}
		
	}
	
	
	</script>
	
</body>

</html>