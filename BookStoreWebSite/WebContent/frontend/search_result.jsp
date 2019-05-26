<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Results for ${keyword} - Online Book Store</title>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div align="center">
	<c:if test="${fn:length(result)== 0}">
	<center><h2>No results for ${keyword}</h2></center>
	</c:if>
	<c:if test="${fn:length(result)> 0}">
		<div align="center" style="width: 80%; margin: 0 auto;">
		<h2>results for {keyword}</h2>
			<c:forEach items="${result}" var="book">
			<div>
				<div style="display: inline-block;" margin:20px; width: "10%">
				<div align="left">
					<a href="view_book?id=${book.bookId}"> <img
						src="data:image/jpg;base64,${book.base64Image}" width="128"
						height="164" />
					</a>
				</div>
				</div>
				<div style="display: inline-block;" margin:20px; vertical-align: top; width: "60%"; align="left">
					<div>
						<h2><a href="view_book?id=${book.bookId}"> <b>${book.title}</b></h2>
						</a>
					</div>
					<div>Rating *****</div>
					<div>
						<i>by ${book.author}</i>
					</div>
					<div>
						<p>${fn:substring(book.discription,0,100)}....</p>
					</div>
				</div>
				<div style="display: inline-block;" margin:20px; vertical-align: top; >
				
				<h3>$ ${book.price}</h3>
				<h3><a>href="Add to cart</a></h3>
				</div>
				
				
				
			</div>
		</div>
		</c:forEach>
		</div>
		</c:if>
		<jsp:include page="footer.jsp" />
</body>
</html>