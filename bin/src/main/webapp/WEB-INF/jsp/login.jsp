<%@ include file="header.jsp"%>
<c:if test="${not empty error}">
					<div class="alert alert-danger">
						<spring:message code="AbstractUserDetailsAuthenticationProvider.badCredentials"/><br />
					</div>
				</c:if>
<form   class="form-horizontal" action="<spring:url value="/postLogin"></spring:url>" method="post">

	<fieldset>

		<div class="form-group">
			<label class="col-md-4 control-label" for="">Username</label>
			<div class="col-md-4">
				<input id="" name='username'  type="text" placeholder=""
					class="form-control input-md">

			</div>
		</div>

		<!-- Password input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="">Password</label>
			<div class="col-md-4">
				<input id="" name='password' type="password" placeholder=""
					class="form-control input-md">

			</div>
		</div>

		<!-- Text input-->

		<div class="form-group">
		<label class="col-md-4 control-label" for="">Remember Me</label>
			<div class="col-md-4">
				<input type='checkbox' name="keepMe" class="form-control input-md" />
				</div>
			</div>
	
		<!-- Button (Double) -->
		<div class="form-group">
			<label class="col-md-4 control-label" for=""></label>
			<div class="col-md-8">
				<button id="" name="" class="btn btn-default">Cancel</button>

				<input type="submit" value="Login" class="btn btn-warning">
				<button class="btn btn-warning" type=button
					onclick=window.location.href="<spring:url value="/addUser" />">Register</button>

			</div>
		</div>

	</fieldset>
	<security:csrfInput />
</form>


<%@ include file="footer.jsp"%>
