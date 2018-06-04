package edu.mum.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.domain.Auction;
import edu.mum.domain.AuctionStatus;

@Repository
public interface AuctionRepository extends JpaRepository<Auction, Long> {

	@Query("Select a from Auction a where a.endDate<CURRENT_TIMESTAMP and a.status = 'ACTIVE'")
	public List<Auction> getEndingAuctions();

	@Query("Select a from Auction a where a.status = 'PENDING'")
	public List<Auction> getPendingAuctions();
	
	@Query("Select a from Auction a where a.status = 'APPROVED'")
	public List<Auction> getFutureAuctions();
	
	@Query("Select a from Auction a where a.status = 'ACTIVE'")
	public List<Auction> getActiveAuctions();
	
	@Query("Select a from Auction a where a.status = 'PENDING'")
	public List<Auction> getCancelledAuctions();
	
	@Query("Select a from Auction a where a.status = :status")
	public List<Auction> getFilteredAuctions(@Param("status") AuctionStatus status);

	public List<Auction> findByStatus(AuctionStatus status);

}
