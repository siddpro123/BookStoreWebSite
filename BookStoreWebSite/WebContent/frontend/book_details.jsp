<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content=text/html;charset="ISO-8859-1">
<title>${book.title}OnlineBookStore</title>
<script type="text/javascript" src ="/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div align="center">
		<table width=80%border"0">
			<tr style="height: 30px">
				<td colspan="3" align="left">
					<h2>${book.title}</h2>by${book.author}
				</td>
				<td rowspan="2"><img
					src="data:image/jpg;base64,${book.base64Image}" width="128"
					height="164" /></td>

				<td valign="top" align="left"><jsp:directive.include
						file="book_rating.jsp" /></jsp:include>
						<a href="#review">${fn:length}(book.reviews)Reviews</a>
						</td>
				<td valign="top" rowspan="2" width="20%"><h2>$${book.price}</h2>
					<br />
				<br />
					<button id="buttonAddToCart">Add to Cart</button></td>
			</tr>
			<tr>
				<td valign="top">${book.discription}</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><h2>Customer.Reviews</h2></td>
				<td colspan="2" align="center">
					<button id ="buttonWriteReview">Write a customer review</button>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<table boarder="0">
						<c:forEach items="${book.reviews }" var="review">
							<tr>
								<td><c:forTokens items="${review.stars }" delims=","
										var="star">
										<c:if test="${star eq 'on'}">
											<img src="images/rating_on.png" />
										</c:if>
										<c:if test="${star eq 'off'}">
											<img src="images/rating_off.png" />
										</c:if>
									</c:forTokens> <b> ${review.headline}</b></td>
							</tr>
							<tr>
								<td>by${review.customer.fullname} on ${review.reviewTime}</td>
							</tr>
							<tr>
								<td>by${review.comment}</td>
							</tr>
						</c:forEach>
					</table>
			</tr>

		</table>
	</div>
	<jsp:include page="footer.jsp" />
	<script type="text/javascript">
	$(document).ready(function()){
		
		$("#buttonWriteReview").click(function()){
			window.location = "write_review?book_id="+${book.bookId};
		});
		
		$("#buttonAddToCart").click(function()){
			window.location = "add_to_cart?book_id="+${book.bookId};
			history.go(-1);
		});
	}
	}
	</script>
</body>
</html>
