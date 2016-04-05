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
					<a
						class="btn btn-primary offset8"
						href="../getProjectById/${contract.project.id}">Back to ${contract.project.projectName } </a>
					<ul class="nav">
					</ul>
				</div>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="col-md-12 text-center hero-unit">
			<h1>
				<strong>${contract.name} Contract Details</strong> 
						
			</h1>
			
						<br />
						
						<br />

			<div class="control-group">
				<div class="row">
					<div class="span5">
						<p><strong>Contract code</strong> | ${contract.contractCode} </p>
						<br />

						<p><strong>Contract Name</strong>   | ${contract.name} </p> 
						<br />

						<p><strong>Contract Description</strong> | ${contract.description} </p> 
						<br />

						<p><strong>Contract vendor</strong> | ${contract.vendor} </p>
						<br />

						<p><strong>Contract Budget</strong> | ${contract.budget} </p>
						<br />

					</div>
					<div class="span5">
					
						<p><strong>Contract committed Cost</strong> | ${contract.commitedCost} </p>
						<br />

						<p><strong>Contract Forecast</strong>| ${contract.forecast} </p> 
						<br />

						<p><strong>Contract Paid Amount</strong> | ${contract.paid} </p> 
						<br />

						<p><strong>Contract Complete %</strong> | ${contract.complete} </p> 
						<br />

					</div>
				</div>
			</div>
			
			
			 <a class="btn btn-primary" data-toggle="modal" data-target="#editContractModal"> Edit </a>

		</div>
	</div>
	
	<div id="editContractModal" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">${contract.name}</h3>
		</div>
		
		<spring:url value="/updateContract/${contract.id}" var="action" />
		<form:form action="${action}" method="POST" modelAttribute="contract">
		<form:errors path="*" cssClass="errorblock" element="div" />
		<div class="modal-body">
			<div class="control-group">
			<div class="row">
			<div class="span3">
			<label for="textinput1">
	          Contract code:
	        </label>	
			<form:input path="contractCode" cssErrorClass="error" />
			<form:errors path="contractCode" cssClass="error" />
			
			<label for="textinput1">
	          Contract Name:
	        </label>	
			<form:input path="name" cssErrorClass="error" />
			<form:errors path="name" cssClass="error" />
			
			<label for="textinput1">
	          Contract Description:
	        </label>	
			<form:input path="description" cssErrorClass="error" />
			<form:errors path="description" cssClass="error" />
			
			<label for="textinput1">
	          Contract vendor:
	        </label>	
			<form:input path="vendor" cssErrorClass="error" />
			<form:errors path="vendor" cssClass="error" />
			
			<label for="textinput1">
	          Contract Budget:
	        </label>	
			<form:input path="budget" cssErrorClass="error" />
			<form:errors path="budget" cssClass="error" />
			</div>
			<div class="span3">
			<label for="textinput1">
	          Contract committed Cost:
	        </label>	
			<form:input path="commitedCost" cssErrorClass="error" />
			<form:errors path="commitedCost" cssClass="error" />
			
			<label for="textinput1">
	          Contract Forecast:
	        </label>	
			<form:input path="forecast" cssErrorClass="error" />
			<form:errors path="forecast" cssClass="error" />
			
			<label for="textinput1">
	          Contract Paid Amount:
	        </label>	
			<form:input path="paid" cssErrorClass="error" />
			<form:errors path="paid" cssClass="error" />
			
			<label for="textinput1">
	          Contract Complete %:
	        </label>	
			<form:input path="complete" cssErrorClass="error" />
			<form:errors path="complete" cssClass="error" />
			
			</div>
			</div>
			</div>
			</div>
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
				<button type="submit" class="btn btn-primary">Save</button>
			</div>
	  </form:form>
	  </div>

	<script src="../jquery-1.11.2.js">
		
	</script>

	<script src="../assets/js/bootstrap.js">
		
	</script>
</body>
</html>