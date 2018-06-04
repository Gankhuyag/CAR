package edu.mum.service;

import java.util.List;

import edu.mum.domain.Auction;
import edu.mum.domain.Property;


public interface AuctionService {

	public List<Auction> getAllAuction();

	public void addAuction(Auction auction);

	public Auction approveAuction(Long auctionId);

	public Auction rejectAuction(Long auctionId);

	public void setAuctionPreassumptions(Auction auction, Property property);

	public List<Auction> getAllPendingAuctions();

	public List<Auction> getAllActiveAuctions();

	public List<Auction> getAllFutureAuctions();

	public Auction getAuction(Long auctionId);

	

	Auction completeAuction(Long auctionId);
	
//	public void UpdateAuctionStatus();
}
