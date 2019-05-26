<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <script src="./libs/jquery/1.10.1/jquery.min.js"></script>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>write review - online book Store</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp" />
<div align="center">
	<form id="reviewForm" >
		<table>
				<tr>
					<td>
						<h3>Your already wrote a review for this book</h3>
					</td>
					<td>
						<h2>${loggedCustomer.fullname}</h2>
					</td>
				</tr>
				<tr>
					<td colspan="3"><hr/>
					
					</td>
				</tr>
					<tr>
					<td>
					${book.title }<br/>
					<img
					src="data:image/jpg;base64,${book.base64Image}" width="128"
					height="164" />
					<td>
					<div id="rateYo"></div>
					<input type="hidden" id= "rating" name= "rating"/>
					
					<input type= "text" name="headline" size="60" placeholder="readonly" value ="${review.headline}"/>
					<br>
					<textarea name="comment" rows="70" cols="10" placeholder="readonly">${review.comment}</textarea>
					<br>
					</td>
				</tr>
			
			</table>
	
	</form>

	</div>
	<jsp:include page="footer.jsp" />
<script type="text/javascript">
$(document).ready(function () {	
	 $("#rateYo").rateYo({
		    starWidth: "40px",
		    fullStar: true,
		    rating: ${review.rating},
	 		readonly: true,
		  });
	
});
</script>

</body>
</html>