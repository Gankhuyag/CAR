<%@ include file="header.jsp"%>


<h3 align="center"><spring:message code="car.ph"/> </h3>

<div class="container">
	<form:form modelAttribute="newProperty" enctype="multipart/form-data">
		<p>
			<form:errors path="*" cssStyle="color : red;" />
		</p>
		<div class="col-md-6 form-line">
			<div class="form-group">
				<label for="vehicle"><spring:message code="car.carname"/> </label>
				<form:input class="form-control" id="vehicle"
					placeholder="Enter Car Name" path="vehicle" />
				<div>
					<form:errors path="vehicle" cssStyle="color : red;" />
				</div>
			</div>
		</div>

		<div class="col-md-6 form-line">
			<div class="form-group">
				<label for="expectedPrice"><spring:message code="car.price"/> </label>
				<form:input class="form-control" id="expectedPrice"
					placeholder=" Enter Price you desire" path="expectedPrice" />
				<div>
					<form:errors path="expectedPrice" cssStyle="color : red;" />
				</div>
			</div>
		</div>

		<div class="col-md-6 form-line">
			<div class="form-group">
				<label for="cylinders"><spring:message code="car.cylinder"/></label>
				<form:input class="form-control" id="cylinders"
					placeholder=" Enter Cylinders Cycle" path="cylinders" />
				<div>
					<form:errors path="cylinders" cssStyle="color : red;" />
				</div>
			</div>
		</div>

		<div class="col-md-6 form-line">
			<div class="form-group">
				<label for="model"><spring:message code="car.model"/></label>
				<form:input class="form-control" id="model"
					placeholder=" Enter Car Model" path="model" />
				<div>
					<form:errors path="model" cssStyle="color : red;" />
				</div>
			</div>
		</div>

		<div class="col-md-6 form-line">
			<div class="form-group">
				<label for="odometer"><spring:message code="car.o"/></label>
				<form:input class="form-control" id="odometer"
					placeholder="Enter odometer " path="odometer" />
				<div>
					<form:errors path="odometer" cssStyle="color : red;" />
				</div>

			</div>
		</div>

		<div class="col-md-6 form-line">
			<div class="form-group">
				<label for="Image"><spring:message code="car.upload"/></label>
				<form:input id="image" path="image" type="file" />
			</div>
		</div>


		<div class="col-md-6">
			<div class="form-group">
				<label for="description"><spring:message code="car.detail"/></label>
				<form:textarea class="form-control" id="description"
					placeholder="Enter Your Car Description" path="description" />
				<div>
					<form:errors path="description" cssStyle="color : red;" />
				</div>

			</div>


			<div>

				<input type="submit" value="Submit" class="btn btn-success"/>
			</div>
		</div>	
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form:form>
</div>


</body>
</html>