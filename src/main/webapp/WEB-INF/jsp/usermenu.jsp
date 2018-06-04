<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>CAR AUCTION SYSTEM</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet"
	href="<spring:url value='/resources/css/property.css' />" />
	
	<link type="text/css" rel="stylesheet"
	href="<spring:url value='/resources/css/main.css' />" />
	
</head>
<body>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">CAR AUCTION SYSTEM</a>
    </div>
    <ul class="nav navbar-nav">
  <li class="active"><a href="<spring:url value='/home' />">Home</a></li>
      <li><a href="<spring:url value='/property/add' />">Add Property</a></li>
        <li><div>
<spring:url value="/dologout" var="logout_url" />				
  			<form:form action="${logout_url}" class="form-horizontal" method="POST" >
  					<div class="form-group">
					<div class="col-lg-offset-2 col-lg-10">
						<input type="submit" id="btnAdd" class="btn btn-danger btn-mini  pull-right" value ="Logout"/>
					</div>
				</div>
			</form:form>
</div>
</li>
    </ul>
  </div>
    <a href="?language=en" >English</a>  |  <a href="?language=de_DE" >GERMANY</a> </a>
</nav>
