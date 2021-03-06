<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Add Project Page</title>
 	<link href="assets/css/bootstrap.css" rel="stylesheet">
	<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">

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
        <h1>
          Add Project
        </h1>
      
    <spring:url value="/saveProject" var="action" />
	<form:form action="${action}" method="POST" modelAttribute="project">
			<div class="control-group">
			<label for="textinput1">
	          Project code:
	        </label>	
			<form:input path="projectCode" cssErrorClass="error" />
			
			<label for="textinput1">
	          Project Name:
	        </label>	
			<form:input path="projectName" cssErrorClass="error" />
			
			<label for="textinput1">
	          Project vendor:
	        </label>	
			<form:input path="projectVendor" cssErrorClass="error" />
			
			
			<label for="textinput1">
	          Project Budget:
	        </label>	
			<form:input class="numberOnly" path="totalProjectBudget" cssErrorClass="error" />
			
			
			</div>
			
			<input type="submit" class="btn" value="Add Project"/>
	  </form:form>
	  </div>
    </div>

     <script src="jquery-1.11.2.js">
    </script>
    <script src="assets/js/fin-mgnt.js">
    </script>
    <script src="assets/js/bootstrap.js">
    </script>
  </body>
</html>