<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Evergreen Books - Online Book Store</title>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div align="center">
		<div align="center" style="width: 80%; margin: 0 auto;">
		<h2>New books</h2>
			<c:forEach items="${listNewBooks}" var="book">
				<div style="display: inline-block;" margin:20px>
					<a href="view_book?id=${book.bookId}"> <img
						src="data:image/jpg;base64,${book.base64Image}" width="128"
						height="164" />
					</td></a>

					<div>
						<a href="view_book?id=${book.bookId}"> <b>${book.title}</b>
						</a>
					</div>
					<div>
						<jsp:directive.include file="book_rating.jsp"/></jsp:include>
					</div>
					<div>
						<i>by ${book.author}</i>
					</div>
					<div>
						<b>$ ${book.price}</b>
					</div>
				</div>
				<h2>Best Selling Books</h2>
				<h2>Most-favored Books</h2>
		</div>
		</c:forEach>
		<div align="center" style="clear:both">
		<h2>Best selling books:</h2>
		</div>
		<div align="center" style="clear:both">
		<h2>Most favoured books:</h2>
		</div>		
		</div>
		<jsp:include page="footer.jsp" />
</body>
</html>