package edu.mum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.domain.Auction;
import edu.mum.domain.Property;
import edu.mum.service.AuctionService;
import edu.mum.service.PropertyService;


@Controller

public class WelcomeController {
	@Autowired
	PropertyService propertyService;
	

	@Autowired
	AuctionService auctionService;
	
	@RequestMapping("/")
	public String welcome(Model model) {
		List<Auction> auctions = auctionService.getAllActiveAuctions();
		model.addAttribute("auctionsapproved", auctions);
		return "welcome";
		
	}
	
	@RequestMapping(value = "/futureAuctions", method = RequestMethod.GET)
	public String futureAuctionList(Model model) {
		List<Property> list = propertyService.getAllProperty();
		model.addAttribute("properties", list);
		return "futureAuctions";
	}

}
