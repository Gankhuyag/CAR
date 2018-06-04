package edu.mum.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.mum.domain.Auction;
import edu.mum.domain.Bid;
import edu.mum.domain.User;
import edu.mum.service.AuctionService;
import edu.mum.service.BidService;
import edu.mum.service.UserService;
import edu.mum.validator.BidValidator;

 

@Controller
public class BidController {

	@Autowired
	AuctionService auctionService;

	@Autowired
	BidService bidService;
	
	@Autowired
	UserService userService;

	@RequestMapping(value = "/auction/bid/{auctionId}", method = RequestMethod.GET)
	public String getAuctionDetail(HttpServletRequest request, @ModelAttribute("newBid") Bid bid, @PathVariable("auctionId") Long auctionId,
			Model model) {
		Auction auction = auctionService.getAuction(auctionId);
		bid.setAuction(auction);
		
		List<Bid> bids = bidService.findBidbyAuctionId(auction);
		model.addAttribute("bids", bids);
		model.addAttribute("auction", auction);
		model.addAttribute("property", auction.getProperty());
		
		return "bidding";
	}
	
	
	


	@RequestMapping(value = "/auction/bid/{auctionId}", method = RequestMethod.POST)
	public String bidAuction(HttpServletRequest request, Principal principal, @PathVariable("auctionId") Long auctionId, @Valid @ModelAttribute("newBid") Bid bid,
			BindingResult result, Model model, RedirectAttributes redirectAttributes) {
		

		String name = principal.getName();
		User activeuser = userService.findbyFirstName(name);
		bid.setBidder(activeuser);
		
		Auction auction = auctionService.getAuction(auctionId);
		bid.setAuction(auction);
	
		model.addAttribute("auction", auction);
		model.addAttribute("property", auction.getProperty());

		BidValidator bidValidator = new BidValidator();
		bidValidator.validate(bid, result);

		if (result.hasErrors()) {
			return "bidding";
		}
		redirectAttributes.addFlashAttribute("bidSuccessMessage","Congratulations!! you are the current highest bidder.");
		bidService.save(bid);
		model.addAttribute("msg", "Congratulations!! you are the current highest bidder for now. We will anounced winner after End Time. Keep Bidding");
		return "success";
		
	}
	


}
