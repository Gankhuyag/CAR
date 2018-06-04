package edu.mum.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.mum.domain.Property;



@Repository
public interface PropertyRepository extends CrudRepository<Property, Long> {

}
