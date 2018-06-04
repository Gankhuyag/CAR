package edu.mum.domain;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

@Entity
public class Property implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id 
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;
	
	@NotEmpty(message="{String.property.vehicle}")
	private String vehicle;
	
	@NotEmpty(message="{String.property.description}")
	private String description;
	
	@NotNull(message="{NotNull.property.expectedPrice}")
	private double expectedPrice;
	
	@NotEmpty(message="{String.property.cylinders}")
	private String cylinders;
	
	@NotNull(message="{NotNull.property.odometer}")
	private Integer odometer;
	
	@NotEmpty(message="{String.property.model}")
	private String model;
	
	@Transient
	private MultipartFile image;
	
	private String imagePath;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getVehicle() {
		return vehicle;
	}

	public void setVehicle(String vehicle) {
		this.vehicle = vehicle;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getExpectedPrice() {
		return expectedPrice;
	}

	public void setExpectedPrice(double expectedPrice) {
		this.expectedPrice = expectedPrice;
	}

	
	public Integer getOdometer() {
		return odometer;
	}

	public void setOdometer(Integer odometer) {
		this.odometer = odometer;
	}

	public String getCylinders() {
		return cylinders;
	}

	public void setCylinders(String cylinders) {
		this.cylinders = cylinders;
	}



	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	

	@OneToOne(fetch=FetchType.EAGER,cascade = CascadeType.MERGE)
	@JoinColumn(name="owner_id")
	private User owner;

	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}
	
	
	
	
	/*@OneToOne(fetch=FetchType.EAGER,cascade = CascadeType.ALL)
	@JoinColumn(name="address_id")
	private Address address;*/

	

}
