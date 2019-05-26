<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create New Book</title>
<link rel="stylesheet" href ="../css/jquery-ui.min.css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="..//css/richtext.min.css">
<script type="text/javascript" src ="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src ="../js/jquery.validate.min.js"></script>
<script type="text/javascript" src ="../js/jquery-ui.min.js"></script>
<script type="text/javascript" src ="../js/jquery.richtext.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<h2>
			<c:if test="${Book != null}">Edit Book</c:if>
			<c:if test="${Book == null}">Create New Book</c:if>
		</h2>
	</div>

	<div align="center">
	
	<c:if test="${Book != null}">
		<form action="update_book" method="post" id ="bookForm" encrypt="multipart/form-data">
		<input type = "hidden" name = "bookId" value ="${book.bookId}"/>
	</c:if>
	<c:if test="${Book == null}">
		<form action="create_Book" method="post" id ="bookForm">
	</c:if>
	
			<table>
			<tr>
			<td>Category:</td>
			<td>
			<select name="catefory">
			<c:forEach items="${listCategory}" var="category">
				<c:if test=""${category.categoryId eq book.category.categoryId }">
					<option value="${category.categoryId}" selected/>
				</c:if>
				<c:if test=""${category.categoryId ne book.category.categoryId }">
					<option value="${category.categoryId}" />
				</c:if>
			${category.name}
			</c:forEach>
			
			</section>
			</tr>
				<tr>
					<td align="right">title</td>
					<td align="left"><input type="text" id="title" name="title"
						size="20" value="${Book.title}" /></td>
				</tr>
				<tr>
					<td align="right">Author:</td>
					<td align="left"><input type="text" id="author"
						name="author" size="20" value="${Book.author}" /></td>
				</tr>
				<tr>
					<td align="right">ISBN:</td>
					<td align="left"><input type="text" id="isbn"
						name="isbn" size="20" value="${Book.password}" /></td>
				</tr>
				<tr>
					<td align="right">Publish Date:</td>
					<td align="left"><input type="text" id="publishDate"
						name="publishDate" size="20" value="<fmt:formatDate pattern ="MM/dd/yyyy" value= '${Book.publishDate}'/>"/></td>
				</tr>
				<tr>
					<td align="right">Book Image:</td>
					<td align="left"><input type="file" id="bookImage"
						name="isbn" size="20"/><br>
						<image id="thumbnail"  alt="Image Preview" style="width:20% margin-top: 10px" 
						src= "data:image/jpg;base64,${book.base64Image}"/></td>
				</tr>
				<tr>
					<td align="right">Price:</td>
					<td align="left"><input type="text" id="price"
						name="price" size="20" value="${Book.price}" /></td>
				</tr>
					<tr>
					<td align="right">Discription:</td>
					<td align="left">
					<textarea rows="5" cols="50" name ="discription" id="discription">book.discription</textarea>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Save" /> <input type="button" value="Cancel"
						onclick="javascript: history.go(-1)" /></td>
				</tr>

			</table>

		</form>
	</div>
	<jsp:include page="footer.jsp" />
</body>
<script type="text/javascript">
$(document).ready(function () {
	$('#publishDate').datepicker();	
	$('#discription').richText();
	$('#bookImage').change(function(){
		showImageThumbnail(this);
	};	
	
	$("#loginForm").validate({
		rules:{
			category: "required",
			title:"required",
			author:"required",
			isbn:"required",
			publishDate: "required",https://www.amazon.com/#
			<c:if test="${book == null}">
				bookImage: "required",
			</c:if>
			bookImage:"required" ,
			price:"required" ,
			discription: "required",
		},
		messages:{
			category:"please select a category for the book",
			title: "please enter book title",
			author: "please enter book author",
			isbn: "please enter book isbn",
			publishDate: "please enter book publishDate",
			bookImage: "please enter full name",
			password: "please enter password",
			price:"please enter book price",
			discription:"please enter book discription"
		}
	});
	
	$("#buttonCancel").click(function()){
		history.go(-1);
	});
	
});

function showImageThumbnail(fileInput){
	var file = fileInput.files[0];
	var reader = new FileReader(e){
		$('#thubnail').attr('src',e.target.result);
	};
	reader.readAsDataURL(file);
	
}

</script>
</html>>