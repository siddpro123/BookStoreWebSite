<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit review</title>
<link rel="stylesheet" href ="../css/jquery-ui.min.css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="..//css/richtext.min.css">
<script type="text/javascript" src ="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src ="../js/jquery.validate.min.js"></script>

</head>
<body>
	<jsp:include page="header.jsp" />
	
	<div align="center">
		<h2>
			Edit Review
		</h2>
	</div>

	<div align="center">
		<form action="update_review" method="post" id ="reviewForm" >
		<input type = "hidden" name = "reviewId" value ="${review.reviewId}"/>
	
			<table>
				<tr>
					<td align="right">Book</td>
					<td align="left">${review.book.title}</td>
				</tr>
				<tr>
					<td align="right">Rating</td>
					<td align="left">${review.rating}</td>
				</tr>
				<tr>
					<td align="right">Headline</td>
					<td align="left">${review.customer.fullname}</td>
				</tr>
				<tr>
					<td align="right">Customer</td>
					<td align="left"><input type="text" size="60" name="headline" value = "${review.headline}">
					</td>
				</tr>
				<tr>
					<td align="right">Comment</td>
					<td align="left"><textarea rows= "5" cols="70" name="comment" value = "${review.comment}">
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<button type="submit" value="Save" />Save</button>
					<button  id="buttonCancel">Cancel</button>
				</tr>

			</table>

		</form>
	</div>
	<jsp:include page="footer.jsp" />
</body>
<script type="text/javascript">
$(document).ready(function () {
	
	$("#reviewForm").validate({
		rules:{
			
			headline:"required",
			comment:"required"
		},
		messages:{
			
			headline:"please select a headline",
			comment:"please enter comment"
		}
	});
	
	$("#buttonCancel").click(function()){
		history.go(-1);
	});
	
});

</script>
</html>>