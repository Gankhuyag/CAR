
<%@ include file="header.jsp"%>




<form:form modelAttribute="newAuction" action="../added" method="POST">
	<div class="container">
	<p>
				<form:errors path="*" cssStyle="color : red;" />
			</p>
		<div class="row">
			<div class="col-xs-5" style="border: 0px solid gray">



				<div>
					<img class="group list-group-image"
						src="<c:url value="/resources/images/${newAuction.property.id}.png"></c:url>"
						alt="image" style="width: 100%" />
				</div>
			</div>

			<div class="col-xs-6" style="border: 0px solid gray">

				<%-- <div class="form-group">
							<label for="minBidAmount">Minimum Bid Amount: </label>
							<form:input path="minBidAmount" id="minBidAmount" />
						</div> --%>
				<div class="form-group">
					<h3>${newAuction.property.vehicle}</h3>
				</div>

				<div class="form-group">
					<h4>Minimum Price : ${newAuction.property.expectedPrice}</h4>
				</div>

				<div class="form-group">
					<h4>Cylinders : ${newAuction.property.cylinders}</h4>
				</div>


				<div class="form-group">
					<h4>Miles Reading : ${newAuction.property.odometer}</h4>
				</div>


				<div class="form-group">
					<h4>Model : ${newAuction.property.model}</h4>
				</div>

				<div class="form-group">
					<h4>Description :</h4>
					<h4>${newAuction.property.description}</h4>
				</div>
				<div class="form-group">
					<label for="minBidAmount">Minimum Bid Amount: </label>
					<form:input path="minBidAmount" />
					<div>
						<form:errors path="minBidAmount" cssStyle="color : red;" />
					</div>
				</div>
				<div class="form-group">
					<label><span>Start Date:</span></label>
					<div class='input-group date' id="startDate">
						<form:input path="startDate" cssClass="form-control" />
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-th"></span></span>
					</div>
				</div>

				<div class="form-group">
					<label><span>End Date:</span></label>
					<div class='input-group date' id="endDate">
						<form:input path="endDate" cssClass="form-control" />
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-th"></span></span>
					</div>
				</div>
				<div>
						<form:errors path="endDate" cssStyle="color : red;" />
					</div>
				<div>
					<input type="submit" value="Submit" class="btn btn-success" />
				</div>
			</div>


		</div>
	</div>

</form:form>


</body>
</html>