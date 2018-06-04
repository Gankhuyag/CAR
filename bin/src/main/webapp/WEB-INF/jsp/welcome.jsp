<%@ include file="header.jsp"%>
 <div id="products" class="row list-group">
    <c:forEach items="${auctionsapproved}" var="auction">
        <div class="item  col-xs-4 col-lg-4">
            <div class="thumbnail">
 
                
                <img  class="group list-group-image" src="<c:url value="/resources/images/${auction.property.id}.png"></c:url>" alt="image"  style = "width:100%"/>
		
                <div class="caption">
                    <h4 class="group inner list-group-item-heading">
                        ${auction.property.vehicle}</h4>
                    <p class="group inner list-group-item-text">
                        ${auction.property.description}</p>
                    <div class="row">
                        <div class="col-xs-12 col-md-6">
                            Current Price $<p class="lead">
                                 ${auction.property.expectedPrice}</p>
                        </div>
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