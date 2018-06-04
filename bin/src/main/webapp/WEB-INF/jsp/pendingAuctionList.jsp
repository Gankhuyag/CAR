
<%@ include file="header.jsp" %>



		<table class="table table-striped">
			<tr>
				<th>Car Name</th>
				<th>Owner Description</th>
				<th>Expected Price</th>
				<th>Start Date</th>
				<th>End Date</th>
			</tr>

			<c:forEach items="${auctionList}" var="auction">
			<c:forEach items="${propertyList}" var="property">
				<c:if test = "${property.id==auction.id}"> 
				<tr id="row-${auction.id}" >
					<td width="250px">${property.vehicle}</td>
					<td width="250px">${property.description}</td>
					<td width="140px">${property.expectedPrice}</td>
					<td width="240px">${auction.startDate}</td>
					<td width="240px">${auction.endDate}</td>
					<td align="right"><button onclick="approveAuction(${auction.id})">Approve</button>
					<button onclick="rejectAuction(${auction.id})">Reject</button></td>
				</tr>
				</c:if>
				</c:forEach>
			</c:forEach>

		</table>
	
	<%@ include file="footer.jsp"%>

</body>
</html>
