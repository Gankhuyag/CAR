package edu.mum.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.mum.domain.Credential;



@Repository
public interface CredentialRepository extends CrudRepository<Credential,String> {

}
