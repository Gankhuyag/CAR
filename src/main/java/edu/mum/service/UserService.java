package edu.mum.service;

import java.util.List;

import edu.mum.domain.User;


public interface UserService {
	
	public void saveUser(User user);
	
	public List<User>getAllUsers();
	
	public User getUser(Long id);
	
	public void deleteUser(Long id);
	
	public void approveUser(Long id);

	public User findbyFirstName(String firstName);

}
