package edu.mum.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.domain.User;
import edu.mum.domain.UserStatus;
import edu.mum.repository.UserRepository;
import edu.mum.service.CredentialService;
import edu.mum.service.UserService;


@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	UserRepository userRepository;
	
	@Autowired
	CredentialService credentialService;
	
	public void saveUser(User user) {
	
		user.setUserStatus(UserStatus.APPROVED);
		
		credentialService.saveCredential(user.getUserCredential());
		userRepository.save(user);
	
		
	}

	@Override
	public List<User> getAllUsers() {
		
		return (List<User>) userRepository.findAll();
	}

	@Override
	public User getUser(Long id) {
		return userRepository.findOne(id);
	}

	@Override
	public void deleteUser(Long id) {
		userRepository.delete(id);
		
	}

	@Override
	public void approveUser(Long id) {
		User user = userRepository.findOne(id);
		user.setUserStatus(UserStatus.APPROVED);
		
		userRepository.save(user);
		
	}

	@Override
	public User findbyFirstName(String firstName) {
		// TODO Auto-generated method stub
		return  userRepository.findbyFirstName(firstName);
	}

}
