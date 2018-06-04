package edu.mum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.mum.domain.Auction;
import edu.mum.service.AuctionService;
import edu.mum.service.PropertyService;

@Controller
@RequestMapping("admin/auction")
public class AuctionAdminController {

	@Autowired
	AuctionService auctionService;

	@Autowired
	PropertyService propertyService;

	@RequestMapping(value = { "", "/", "auctionList" }, method = RequestMethod.GET)
	public String homeAuction(Model model) {
		model.addAttribute("auctionList", auctionService.getAllAuction());
		
		model.addAttribute("propertyList", propertyService.getAllProperty());
		
		return "adminhome";
	}
	
	@RequestMapping(value = { "pendingAuctions" }, method = RequestMethod.GET)
	public String pendingAuction(Model model) {
		model.addAttribute("auctionList", auctionService.getAllPendingAuctions());
		model.addAttribute("propertyList", propertyService.getAllProperty());		
		return "pendingAuctionList";
	}
	
	@RequestMapping(value = "/approve/{auctionId}", method = RequestMethod.PUT)
	public @ResponseBody Auction approveAuction(@PathVariable("auctionId") Long auctionId) {		
		return auctionService.approveAuction(auctionId);
	}
	
	@RequestMapping(value = "/reject/{auctionId}", method = RequestMethod.PUT)
	public @ResponseBody Auction rejectAuction(@PathVariable("auctionId") Long auctionId) {		
		return auctionService.rejectAuction(auctionId);
	}
}
