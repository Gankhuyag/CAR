package edu.mum.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.domain.Auction;
import edu.mum.domain.Bid;
import edu.mum.repository.BidRepository;
import edu.mum.service.BidService;

@Service
@Transactional
public class BidServiceImpl implements BidService  {
	
@Autowired
	private BidRepository bidRepository ;

	@Override
	public List<Bid> getAllBid() {
		
		return (List<Bid>) bidRepository.findAll();
	}

	
	@Override
//	@PreAuthorize("hasRole('ROLE_USER')")
	public void save(Bid bid) {
	Auction auction = bid.getAuction();
	auction.setCurrentBidAmount(bid.getBidAmount());
	auction.incrementBidCount();
    bidRepository.save(bid);
		
	}

	@Override
	public Bid getBid(Long bidId) {
		
		return bidRepository.findOne(bidId);
	}


	@Override
	public List<Bid> findBidbyAuctionId(Auction auction) {
		// TODO Auto-generated method stub
		return bidRepository.findBidbyAuctionId(auction);
	}
	
	//getting last bidAmont 
	
}
