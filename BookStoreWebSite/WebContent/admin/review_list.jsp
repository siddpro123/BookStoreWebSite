<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Review - Evergreen Bookstore Administration</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<h2>Review Mangment</h2>
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
				<th>Book</th>
				<th>Rating</th>
				<th>Headline</th>
				<th>Customer</th>
				<th>Review On</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="review" items="${listReviews}" varStatus="status">
				<tr>
					<td>${status.index + 1}</td>
					<td>${review.reviewId}</td>
					<td>${review.book.title}</td>
					<td>${review.rating}</td>
					<td>${review.headline}</td>
					<td>${review.customer.fullname}</td>
					<td>${review.reviewTime}</td>
					<td><a href="edit_review?id=${review.reviewId}">Edit</a>&nbsp; <a href="javascript:confirmDelete(${review.reviewId})">Delete</a>&nbsp;</td>
				</tr>
			</c:forEach>
		</table>

	</div>

	<jsp:include page="footer.jsp" />
	<script type="text/javascript">
	function confirmDelete (categoryId) {
		if (confirm("Are you sure you want to delete the review with id "+reviewId+"?")){
			window location = "delete_review?id="+reviewId;
		}
		
	}
	
	
	</script>
	
</body>

</html>