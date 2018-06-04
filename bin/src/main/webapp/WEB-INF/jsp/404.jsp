<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>403 error</title>
  </head>
  <body>


  <div class="row">
    <div class="col-md-6 col-md-offset-3 text-center">
      <br>
      <h4>Sorry</h4>
      <img src="<spring:url value="/resources/images/403-forbidden-error.jpg"  htmlEscape="true" />" alt="Not Allowed!!!"  />

      <h2><i class="fa fa-exclamation-triangle" style="color:red"></i>
 Page not found <small>404 error</small></h2>
      <p>Well, this is embarrassing.

        <br>
      </p>

      <p><a href="#">Click Home</a> to visit our home page</p>
     <button type=button onclick=window.location.href="<spring:url value="/" />">Home</button>
</div>
</div>
  </body>
</html>