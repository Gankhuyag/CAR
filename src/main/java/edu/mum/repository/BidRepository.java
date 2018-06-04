package edu.mum.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.mum.domain.Auction;
import edu.mum.domain.Bid;

@Repository
public interface BidRepository extends CrudRepository<Bid, Long>{
	@Query(value= "SELECT b from Bid b WHERE b.bidAmount =:bidAmount")
	public double findLastBY(double bidAmount ); 
	
	@Query("Select b from Bid b where b.auction=:auction")
	public List<Bid> findBidbyAuctionId(@Param("auction") Auction auction);

}
