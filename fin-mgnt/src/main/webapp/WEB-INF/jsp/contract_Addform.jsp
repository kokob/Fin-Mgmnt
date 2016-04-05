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
					<a class="brand" href="/"> Home Page</a>
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
				<form:errors path="*" cssClass="errorblock" element="div" />
				<div class="control-group">
				<div class="row">
				<div class="span3">
					<label for="textinput1"> Contract code: </label>
					<form:input path="contractCode" cssErrorClass="error" />
					<form:errors class="alert" path="contractCode" cssClass="error" />

					<label for="textinput1"> Contract Name: </label>
					<form:input path="name" cssErrorClass="error" />
					<form:errors path="name" cssClass="error" />

					<label for="textinput1"> Contract Description: </label>
					<form:input path="description" cssErrorClass="error" />
					<form:errors path="description" cssClass="error" />

					<label for="textinput1"> Contract vendor: </label>
					<form:input path="vendor" cssErrorClass="error" />
					<form:errors path="vendor" cssClass="error" />
					
					<label for="textinput1"> Contract Budget: </label>
					<form:input path="budget" cssErrorClass="error" />
					<form:errors path="budget" cssClass="error" />
					</div>
					<div class="span3">
					<label for="textinput1"> Contract committed Cost: </label>
					<form:input path="commitedCost" cssErrorClass="error" />
					<form:errors path="commitedCost" cssClass="error" />

					<label for="textinput1"> Contract Forecast: </label>
					<form:input path="forecast" cssErrorClass="error" />
					<form:errors path="forecast" cssClass="error" />

					<label for="textinput1"> Contract Paid Amount: </label>
					<form:input path="paid" cssErrorClass="error" />
					<form:errors path="paid" cssClass="error" />

					<label for="textinput1"> Contract Complete %: </label>
					<form:input path="complete" cssErrorClass="error" />
					<form:errors path="complete" cssClass="error" />
					</div>
					</div>
				</div>

				<input type="submit" class="btn" value="Add Contract" />
			</form:form>
		</div>
	</div>

	<script src="jquery-1.8.3.js">
		
	</script>
	<script src="../assets/js/bootstrap.js">
		
	</script>
</body>
</html>