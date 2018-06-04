<%@ include file="header.jsp"%>

<spring:url var="addUser" value="/addUser" />

<form:form modelAttribute="newUser" action="${addUser}" method="POST"
	class="form-horizontal">

	<legend align="center">Sign up form</legend>
	<br></br>



	<div class="form-group">
		<label class="col-md-4 control-label" for="">First Name</label>
		<div class="col-md-4">
			<form:input id="firstName" path="firstName" type="text"
				class="form-control input-md" />
			<form:errors path="firstName" cssStyle="color : red;" />

		</div>
	</div>

	<div class="form-group">
		<label class="col-md-4 control-label" for="">Last Name</label>
		<div class="col-md-4">
			<form:input id="lastName" path="lastName" type="text"
				class="form-control input-md" />
			<form:errors path="lastName" cssStyle="color : red;" />

		</div>
	</div>


	<div class="form-group">
		<label class="col-md-4 control-label" for="">Email</label>
		<div class="col-md-4">
			<form:input id="email" path="email" type="text"
				class="form-control input-md" />
			<form:errors path="email" cssStyle="color : red;" />

		</div>
	</div>



	<div class="form-group">
		<label class="col-md-4 control-label" for="">Phone</label>
		<div class="col-md-4">
			<form:input id="phone.area" path="phone.area" type="text" />
			<form:errors path="phone.area" cssStyle="color:red;"></form:errors>
			<form:input id="phone.prefix" path="phone.prefix" type="text" />
			<form:errors path="phone.prefix" cssStyle="color:red;"></form:errors>
			<form:input id="phone.number" path="phone.number" type="text" />
			<form:errors path="phone.number" cssStyle="colory:red;"></form:errors>

			<br></br>
		</div>
	</div>

	<div class="form-group">
		<label class="col-md-4 control-label" for="">Username</label>
		<div class="col-md-4">

			<form:input id="userCredential.username"
				path="userCredential.username" type="text"
				class="form-control input-md" />
			<form:errors path="userCredential.username" cssStyle="color:red;"></form:errors>
		</div>
	</div>

	<div class="form-group">
		<label class="col-md-4 control-label" for="">Password</label>
		<div class="col-md-4">
			<form:password id="password" path="userCredential.password"
				class="form-control input-md" />
			<form:errors path="userCredential.password" cssStyle="color:red"></form:errors>
		</div>
	</div>

	<div class="form-group">
		<label class="col-md-4 control-label" for="">Verify password</label>
		<div class="col-md-4">
			<form:password id="verifyPassword"
				path="userCredential.verifyPassword" class="form-control input-md"  />
			<form:errors path="userCredential.verifyPassword"
				cssStyle="color:red"></form:errors>
		</div>
	</div>


	<div class="form-group">
		<label class="col-md-4 control-label" for="">Role</label>
		<div class="col-md-4">
			<form:input path="userCredential.authority[0].authority" type="text"
				value="ROLE_USER" />
			<form:errors path="userCredential.authority[0].authority"
				cssStyle="color:red;"></form:errors>
			<form:hidden path="userCredential.enable" value="TRUE" />
		</div>
	</div>


	<div class="form-group">
		<label class="col-md-4 control-label" for=""></label>
		<div class="col-md-4">
			<p id="buttons">
				<button type=button onclick=window.location.href="<spring:url value="/" />">Back</button>
				<input id="reset" type="reset" tabindex="4"> <input
					id="submit" type="submit" tabindex="5" value="Sign up">
			</p>
		</div>
	</div>


</form:form>
<%@ include file="footer.jsp"%>
