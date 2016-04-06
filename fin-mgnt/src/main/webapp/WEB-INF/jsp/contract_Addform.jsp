<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Add Contract Page</title>
<link href="../assets/css/bootstrap.css" rel="stylesheet">
<link href="../assets/css/bootstrap-responsive.css" rel="stylesheet">

</head>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<div class="navbar-header">
					<a class="brand" href="/homePage"> Home Page</a>
					<ul class="nav">
					</ul>
				</div>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="col-md-12 text-center hero-unit">
			<div>
				<h1>Add Contract</h1>
			</div>
			<spring:url value="/saveContract/${projectId}" var="action" />
			<form:form action="${action}" method="POST" modelAttribute="contract">
				<div class="control-group">
				<div class="row">
				<div class="span3">
					<label for="textinput1"> Contract code: </label>
					<form:input path="contractCode" cssErrorClass="error" />

					<label for="textinput1"> Contract Name: </label>
					<form:input path="name" cssErrorClass="error" />

					<label for="textinput1"> Contract Description: </label>
					<form:input path="description" cssErrorClass="error" />

					<label for="textinput1"> Contract vendor: </label>
					<form:input path="vendor" cssErrorClass="error" />
					
					</div>
					<div class="span3">
					<label for="textinput1"> Contract Budget: </label>
					<form:input class="numberOnly" path="budget" cssErrorClass="error" />
					
					
					<label for="textinput1"> Contract committed Cost: </label>
					<form:input class="numberOnly" path="commitedCost" cssErrorClass="error" />
					

					<label for="textinput1"> Contract Forecast: </label>
					<form:input class="numberOnly" path="forecast" cssErrorClass="error" />
					

					<label for="textinput1"> Contract Paid Amount: </label>
					<form:input class="numberOnly" path="paid" cssErrorClass="error" />

					
					</div>
					</div>
				</div>

				<input type="submit" class="btn" value="Add Contract" />
			</form:form>
		</div>
	</div>

	<script src="../jquery-1.11.2.js">
    </script>
    <script src="../assets/js/fin-mgnt.js">
    </script>
	<script src="../assets/js/bootstrap.js">
		
	</script>
</body>
</html>