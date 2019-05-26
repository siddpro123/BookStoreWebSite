<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Books - Evergreen Bookstore Administration</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<h2>Book Mangment</h2>
		<a href="new_book.jsp">Create New Book</a>
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
				<th>Image</th>
				<th>Title</th>
				<th>Author</th>
				<th>Category</th>
				<th>Price</th>
				<th>Last Updated</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="book" items="${listBooks}" varStatus="status">
				<tr>
					<td>${status.index}</td>
					<td>${book.userId}</td>
					<td> <img src="data:image/jpg;base64,${book.base64Image}" width ="84" height="10"/></td>
					<td>${book.title}</td>
					<td>${book.author}</td>
					<td>${book.category.name}</td>
					<td>$ ${book.price}</td>
					<td><fmt:formatDate pattern ="MM/dd/yyyy" value= '${Book.publishDate}'/></td>
					<td><a href="edit_book?id=${book.bookId}">Edit Book</a>&nbsp; <a href="javascript:void(0);" class ="deletelink" id ="${book.bookId}">Delete</a>&nbsp;</td>
				</tr>
			</c:forEach>
		</table>

	</div>

	<jsp:include page="footer.jsp" />
	<script type="text/javascript">
	$(document).ready(function(){
		$(".deleteLink").each(function(){
			$(this).on("click",function(){
				bookId=$(this).attr("id");
				if (confirm("Are you sure you want to delete the book with id "+bookId}+"?")){
					window location = "delete_book?id="+bookId;
				}
			});
		});
	});
	</script>
	
</body>

</html>