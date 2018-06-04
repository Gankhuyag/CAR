package edu.mum.serviceimpl;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.domain.Auction;
import edu.mum.domain.AuctionStatus;
import edu.mum.domain.Property;
import edu.mum.repository.AuctionRepository;
import edu.mum.service.AuctionService;



@Service
@Transactional
public class AuctionServiceImpl implements AuctionService {

	@Autowired
	private AuctionRepository auctionRepository;

	public List<Auction> getAllAuction() {
		return (List<Auction>) auctionRepository.findAll();
	}


	public void addAuction(Auction auction) {
		
		auction.setCurrentBidAmount(auction.getMinBidAmount());
		auction.setStatus(AuctionStatus.PENDING);
		auctionRepository.save(auction);
	}

	
	public void setAuctionPreassumptions(Auction auction, Property property) {

		auction.setProperty(property);
		auction.setMinBidAmount(property.getExpectedPrice()/ 2);

		Calendar now = Calendar.getInstance();
		now.set(Calendar.HOUR_OF_DAY, 9);
		now.set(Calendar.MINUTE, 00);
		now.set(Calendar.SECOND, 00);
		now.add(Calendar.DAY_OF_MONTH, 7);

		auction.setStartDate(now.getTime());
		now.add(Calendar.DAY_OF_MONTH, 7);
		now.set(Calendar.HOUR_OF_DAY, 17);

		auction.setEndDate(now.getTime());
	}

	@Override
	public Auction approveAuction(Long auctionId) {

		Auction auction = auctionRepository.findOne(auctionId);
		auction.setStatus(AuctionStatus.ACTIVE);
		return auctionRepository.save(auction);
	}
	

	@Override
	public Auction rejectAuction(Long auctionId) {
		Auction auction = auctionRepository.findOne(auctionId);
		auction.setStatus(AuctionStatus.CANCELLED);
		return auctionRepository.save(auction);

	}
	@Override
	public Auction completeAuction(Long auctionId) {
		Auction auction = auctionRepository.findOne(auctionId);
		auction.setStatus(AuctionStatus.COMPLETED);
		return auctionRepository.save(auction);

	}
	@Override
	public List<Auction> getAllPendingAuctions() {

		return auctionRepository.findByStatus(AuctionStatus.PENDING);
	}

	@Override
	public List<Auction> getAllActiveAuctions() {

		return auctionRepository.findByStatus(AuctionStatus.ACTIVE);
	}

	@Override
	public List<Auction> getAllFutureAuctions() {

		return auctionRepository.findByStatus(AuctionStatus.APPROVED);
	}

	@Override
	public Auction getAuction(Long auctionId) {

		return auctionRepository.findOne(auctionId);
	}

}
