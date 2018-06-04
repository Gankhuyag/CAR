package edu.mum.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import edu.mum.domain.User;

public interface UserRepository extends CrudRepository<User,Long>{
	
	@Query("Select u from User u where u.firstName = :firstName")
	public User findbyFirstName(@Param("firstName") String firstName);

}
