package edu.mum.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.domain.Credential;
import edu.mum.repository.CredentialRepository;
import edu.mum.service.CredentialService;



@Service
@Transactional
public class CredentialServiceImpl implements CredentialService {

	@Autowired
	CredentialRepository credentialRepository;
	
	@Autowired
 	BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public void saveCredential(Credential credential) {
		String pass=credential.getPassword();
		String encodedPassword = passwordEncoder.encode(credential.getPassword());
  		credential.setPassword(encodedPassword);
  		
  		credentialRepository.save(credential);
	}

	@Override
	public List<Credential> getAllCredentials() {
		// TODO Auto-generated method stub
		return (List<Credential>) credentialRepository.findAll();
	}

	@Override
	public Credential getCredential(String credential) {
		
		return credentialRepository.findOne(credential);
	}

	@Override
	public void delete(String credential) {
		credentialRepository.delete(credential);
		
	}

}
