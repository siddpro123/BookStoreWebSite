<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add a  book to order</title>


</head>
<body>
<div align="center">
<h2>Add book to order ID:${order.orderId}</h2>
<form action="add_book_to_order" method="post">
<table>
				<tr>
					<td>Select a book:</td>
					<td><select name="bookId">
							<c:forEach var="order" items="${listBook}" varStatus="status">
								<option value="${book.bookId}">${book.title}-
									${book.author}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td>Number of copies</td>
					<td><select name="quantity">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
					</select>
					</td>
				</tr>
				<td colspan="2" align="center">
				<input type="submit" value="Add"/>
				<input type="button" value="cancel" onclick="javascript: self.close()"/>
			</table>


</form>

</div>

</body>
</html>