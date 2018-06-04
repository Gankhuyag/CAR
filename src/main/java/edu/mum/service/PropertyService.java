package edu.mum.service;

import java.util.List;

import edu.mum.domain.Property;


public interface PropertyService {


	public List<Property> getAllProperty();
	
	public Property addProperty(Property property);
	
	public Property getOneProperty();
	
	public Property getProperty(Long id);
	
}
