
<%@ include file="usermenu.jsp"%>


	<form:form modelAttribute="newBid" action="" method="post">
		<div class="container">

			<div class="row">
				<div class="col-xs-5">

					<div>
						<img class="group list-group-image"
							src="<c:url value="/resources/images/${newBid.auction.property.id}.png"></c:url>"
							alt="image" style="width: 100%" />
					</div>
					<div class="form-group">
						<h3>Description : ${property.description}</h3>
					</div>
				</div>

				<div class="col-xs-6">

					<div class="form-group">
						<h3>Start Date : ${auction.startDate}</h3>
					</div>
					<div class="form-group">
						<h3>End Date : ${auction.endDate}</h3>
					</div>

					<div class="form-group">
						<h3>Car Brand : ${property.vehicle}</h3>
					</div>

					<div class="form-group">
						<h3>Cylinders : ${property.cylinders}</h3>
					</div>
					<div class="form-group">
						<h3>Expected Price $ : ${property.expectedPrice}</h3>
					</div>

					<div class="form-group">
						<h3>Odometer Reading : ${property.odometer}</h3>
					</div>

					<c:if test="${auction.status == 'ACTIVE'}">

						<div class="form-group">


							<form:errors path="*" cssStyle="color : red;" />
							<br>



							<div class="form-group">
								<div>

									<h3>
										<spring:message code="bid.CurrentMaximumBid"/> <strong>${auction.currentBidAmount }</strong>
									</h3>

								</div>

								<div class="form-group">
									<h3>
										<label><span><spring:message code="bid.bidAmount"/> </span></label>
									</h3>
									<div class='form-group'>
										<form:input path="bidAmount" cssClass="form-control" />
										<form:errors path="bidAmount" cssStyle="color : red;" />
									</div>
								</div>

								<input type="submit" value="<spring:message code="bid.botton"/>" class="btn btn-success" />
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</form:form>

<div class="container">
<table class="table">
  <thead>
    <tr>
      <th scope="col">Bidder Name</th>
      <th scope="col">Bid Amount</th>
     
    </tr>
  </thead>
  <tbody>
    <c:forEach var="bid" items="${bids}">
    <tr>
      <th scope="row">${bid.bidder.firstName}</th>
      <td>${bid.bidAmount}</td>
     
    </tr>
   </c:forEach>
  </tbody>
</table>
</div>

</body>
</html>