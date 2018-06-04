package edu.mum.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.domain.Auction;
import edu.mum.service.AuctionService;

@Controller
public class LoginController {
	

	@Autowired
	AuctionService auctionService;
	
	@RequestMapping(value = "/home")
	public String welcome(Model model) {
		model.addAttribute("greeting", "Welcome to our Car Auction Portal");
		model.addAttribute("tagline", "Start placing your bid now");
		List<Auction> auctions = auctionService.getAllActiveAuctions();
		model.addAttribute("auctionsapproved", auctions);
		
		
		return "home";

	}

	@RequestMapping("/admin")
	public String admin(Model model, Principal principal) {

		String loggedInUserName = principal.getName();
		model.addAttribute("user", loggedInUserName);
		model.addAttribute("name", "Spring Security Custom Login Demo");
		model.addAttribute("description", "Protected page !");
		return "admin";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap model) {

		return "login";

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {
		return "redirect:/";

	}

	@RequestMapping(value = "/loginError", method = RequestMethod.GET)
	public String loginError(ModelMap model) {
//		model.addAttribute("error", "true");
		return "login";

	}

}
