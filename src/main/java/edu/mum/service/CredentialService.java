package edu.mum.service;

import java.util.List;

import edu.mum.domain.Credential;



public interface CredentialService {

	public void saveCredential(Credential credential);
	
	public List<Credential>getAllCredentials();
	
	public Credential getCredential(String credential);
	
	public void delete(String credential);
	
}
