package edu.mum.validator;

import java.util.Date;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import edu.mum.domain.Bid;


public class BidValidator implements Validator {

	@Override
	public boolean supports(Class<?> c) {
		return Bid.class.isAssignableFrom(c);
	}

	@Override
	public void validate(Object command, Errors errors) {
		Bid bid = (Bid) command;
		if (bid.getBidAmount() <= bid.getAuction().getCurrentBidAmount())
			errors.rejectValue("bidAmount", "Bid.Amount.notEnough");
		Date now = new Date();
		if (now.after(bid.getAuction().getEndDate()))
			errors.rejectValue("bidAmount", "Bid.TimeOver");
	}

}
