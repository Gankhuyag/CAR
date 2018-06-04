package edu.mum.service;

import java.util.List;


import edu.mum.domain.Auction;
import edu.mum.domain.Bid;
public interface BidService {

	public List<Bid> getAllBid();

	public void save(Bid auction);

	public Bid getBid(Long bidId);
	
	public List<Bid> findBidbyAuctionId(Auction auction);
	
	}

