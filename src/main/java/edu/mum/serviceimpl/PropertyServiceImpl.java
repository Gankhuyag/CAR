package edu.mum.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.domain.Property;
import edu.mum.repository.PropertyRepository;
import edu.mum.service.PropertyService;


@Service
@Transactional
public class PropertyServiceImpl implements PropertyService{
	
	@Autowired
	private PropertyRepository propertyRepository;

	public List<Property> getAllProperty() {
		return (List<Property>) propertyRepository.findAll();
	}
	
	public Property addProperty(Property property) {
		return propertyRepository.save(property);
	}

	@Override
	public Property getOneProperty() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Property getProperty(Long id) {
		return propertyRepository.findOne(id);
		}



	
	
	

}
