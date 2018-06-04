package edu.mum.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import edu.mum.domain.Auction;


public class AuctionValidator implements Validator {

	@Override
	public boolean supports(Class<?> c) {
		return Auction.class.isAssignableFrom(c);
	}

	@Override
	public void validate(Object command, Errors errors) {
		Auction auction = (Auction) command;
		if (auction.getStartDate().after(auction.getEndDate()))
			errors.rejectValue("endDate", "auction.endDateBeforeStart");
		
	}

}
