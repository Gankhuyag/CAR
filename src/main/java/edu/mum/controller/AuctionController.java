package edu.mum.controller;


import javax.validation.Valid;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.mum.domain.Auction;
import edu.mum.domain.Property;
import edu.mum.service.AuctionService;
import edu.mum.service.PropertyService;
import edu.mum.validator.AuctionValidator;


@Controller
@SessionAttributes("addedProperty")
public class AuctionController {

	@Autowired
	AuctionService auctionService;

	@Autowired
	PropertyService propertyService;
	

	@RequestMapping(value = "/auction/add/{propertyId}", method = RequestMethod.GET)
	public String addAuction(@ModelAttribute("newAuction") Auction auction, @PathVariable("propertyId") Long propertyId,
			Model model) {
		Property property = propertyService.getProperty(propertyId);
		auctionService.setAuctionPreassumptions(auction, property);
		model.addAttribute("addedProperty", property);
		return "auctionForm";
	}

	
	@RequestMapping(value = "/auction/added", method = RequestMethod.POST)
	public String processAuction(@Valid @ModelAttribute("newAuction") Auction auction, BindingResult result,
			@ModelAttribute("addedProperty")Property property) {
		AuctionValidator auctionValidator = new AuctionValidator();
		auctionValidator.validate(auction, result);
		if (result.hasErrors())
			return "auctionForm";

		auction.setProperty(property);     
		auction.setMinBidAmount(property.getExpectedPrice());
		auctionService.addAuction(auction);
		return "redirect:/home";

	}

	@RequestMapping(value = "/pendingauctions",method=RequestMethod.GET)
	public String pendingAuction(Model model) {
		
		List<Auction> auctions = auctionService.getAllPendingAuctions();
		model.addAttribute("pendingauctions",auctions);
		return "pendingAuctions";
		
	}
	

}
