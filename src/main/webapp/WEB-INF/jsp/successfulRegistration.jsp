
<%@ include file="header.jsp"%>
<div class="container">
<div class="jumbotron">
          <h1> Thanks  ${user.firstName} For Registration</h1>
           <h3>Please remember you username : ${user.userCredential.username} and Email : ${user.email}</h3>
          <p class="lead"> We Will Review Your Profile And Activate It Very Soon.</p>
           <p></p>
          
          <p><button  class="btn btn-lg btn-success"   role="button" onclick=window.location.href="<spring:url value="/" />">OK</button></p>
        </div>
 </div>

<%@ include file="footer.jsp"%>