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
	<form id="reviewForm" action="submit_review" method="post">
		<table>
				<tr>
					<td>
						<h2>Your reviews</h2>
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
					<input type="hidden" id= "bookId" value="${book.bookId}"/>
					<input type= "text" name="headline" size="60" placeholder="headline or summary for your review (required)"/>
					<br>
					<textarea name="comment" rows="70" cols="10" placeholder="write the review details"></textarea>
					<br>
					</td>
				</tr>
				<tr>
				<td colspan="3" align="center">
				<button type="submit">submit</button>
				<button id = "buttonCancel">cancel</button>
				</td>
				</tr>
			</table>
	
	</form>

	</div>
	<jsp:include page="footer.jsp" />
<script type="text/javascript">
$(document).ready(function () {
	$("#reviewForm").validate({
		rules:{
			headline:
				"required",
			comment:
					"required",
			},
			
		},
		messages:{
			headline: "please enter headline",
				comment:"please enter review details"
			},
			
		}
	});
	
	$("#buttonCancel").click(function()){
		history.go(-1);
	});
	
	 $("#rateYo").rateYo({
		    starWidth: "40px",
		    fullStar: true,
		    onSet: function( rating, rateYoInstance){
		    	$('#rating').val(rating);
		    }
		  });
	
});
</script>

</body>
</html>