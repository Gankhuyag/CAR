<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

	<%@ include file="header.jsp"%>


	<table class="table table-striped">
		<tr>
			<th>Property Name</th>
			<th>Owner Description</th>
			<th>Expected Price</th>
			<th>Start Date</th>
			<th>End Date</th>
			<th>Status</th>
		</tr>

		<c:forEach items="${auctionList}" var="auction">
			<c:forEach items="${propertyList}" var="property">

				<c:if test = "${property.id==auction.id}"> 
					<tr>
						<td width="150px">${property.vehicle}</td>
						<td width="150px">${property.description}</td>
						<td width="140px">${property.expectedPrice}</td>
						<td width="140px">${auction.startDate}</td>
						<td width="140px">${auction.endDate}</td>
						<td width="100px">${auction.status}</td>
						
						
						
					</tr>
				</c:if>
			</c:forEach>

		</c:forEach>

	</table>
	
<%@ include file="footer.jsp"%>