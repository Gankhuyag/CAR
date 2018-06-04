
<%@ include file="header.jsp"%>


	<div class="jumbotron">
			<div class="container">
				<h1> ${greeting} </h1>
				<p> <security:authorize access="isAuthenticated()">
  					Welcome  <security:authentication property="principal.username" />
				</security:authorize> ${tagline} 
				</p>
			</div>	
			<div id="products" class="row list-group">
    <c:forEach items="${auctionsapproved}" var="auction">
        <div class="item  col-xs-4 col-lg-4">
            <div class="thumbnail">
 
                
                <img  class="group list-group-image" src="<c:url value="/resources/images/${auction.property.id}.png"></c:url>" alt="image"  style = "width:100%"/>
		
                <div class="caption">
                    <div>

								<h3>
									Current Maximum Bid: <strong>${auction.currentBidAmount }</strong>
								</h3>

							</div>
							
							   <div>

								<h3>
									Vehicle : <strong> ${auction.property.vehicle}</strong>
								</h3>

							</div>
                    <div >
                       		<h5>Place by : ${auction.property.owner.firstName}</h5>
                        </div>
                   
                  
                    <div class="row">
                       
                        <div class="col-xs-12 col-md-6">
                        <a  class="btn btn-success"  href="<c:url value='/auction/bid/${auction.id}' />" >
                         Bid</a>
                        </div>
                        
                        
                        
                    </div>
                </div>
            </div>
        </div>
        
       </c:forEach>
         </div>
</div>


		
<%@ include file="footer.jsp"%>