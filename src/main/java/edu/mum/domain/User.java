package edu.mum.domain;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.Email;

@Entity
public class User implements Serializable {
	
	private static final long serialVersionUID = 1069532369141841588L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long userId;
	
	
	@Size(min=3,max= 25,  message = "FirstName size should be between 3 and 25")
	private String firstName;
	

	@Size(min=3,max=25, message = "LastName size should be between 3 and 25")
	private String lastName;
	
	
	@Email
	private String email;
	
	
	@OneToOne(fetch=FetchType.EAGER,cascade=CascadeType.REFRESH)
	@JoinColumn(name="user_userId")
	Credential userCredential;
	
	@OneToOne(fetch=FetchType.EAGER, cascade=CascadeType.ALL )
	Phone phone;
	
	public Phone getPhone() {
		return phone;
	}

	public void setPhone(Phone phone) {
		this.phone = phone;
	}

	public Credential getUserCredential() {
		return userCredential;
	}

	public void setUserCredential(Credential userCredential) {
		this.userCredential = userCredential;
	}


	@Enumerated(EnumType.STRING)
	private UserStatus userStatus;
	
	

	public UserStatus getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(UserStatus userStatus) {
		this.userStatus = userStatus;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getEmail() {
		return email;
	}

	
	public void setEmail(String email) {
		this.email = email;
	}

	
	
}
