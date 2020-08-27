<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>adding page</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	
	<style type="text/css">
	
	 .error {color:red}
	
	</style>
	
</head>
<body>


	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<%@include file="navbar.jsp"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


    <br><br><br>
	<div class="container">

		<form:form modelAttribute="productmodel" method="POST"
			action="/product/addproduct">

			<div class="form-group">
				<label for="inputAddress">Name</label>
				<form:input type="text" class="form-control" 
					path="name" placeholder="Name of Product" />
					
					<form:errors path="name" cssClass="error" />
			</div>

			<div class="form-group">
				<label for="inputAddress2">Description</label>
				<form:input type="text" class="form-control" 
					path="description"
					placeholder="description of Product" />
					<form:errors path="description" cssClass="error" />
			</div>
			<button type="submit" class="btn btn-primary">Add Product</button>
		</form:form>



	</div>





</body>
</html>