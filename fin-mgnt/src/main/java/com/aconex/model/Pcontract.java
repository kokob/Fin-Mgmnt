package com.aconex.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Pcontract implements Serializable {

	private static final long serialVersionUID = -7229110594001308409L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	
	@ManyToOne
	private Project project;
	
	private String name;
	private String description;
	private String contractCode;
	private BigDecimal budget;
	private BigDecimal commitedCost;
	private int forecast;
	private BigDecimal paid;
	private double percentageCompleted;
	private String vendor;
	
	public Pcontract(){
	}

	public Pcontract(String name, String description, String contractCode, BigDecimal budget, BigDecimal commitedCost,
			int forecast, BigDecimal paid, double percentageCompleted, String vendor) {
		super();
		this.name = name;
		this.description = description;
		this.contractCode = contractCode;
		this.budget = budget;
		this.commitedCost = commitedCost;
		this.forecast = forecast;
		this.paid = paid;
		this.percentageCompleted = percentageCompleted;
		this.vendor = vendor;
	}



	public BigDecimal getBudget() {
		return budget;
	}

	public BigDecimal getCommitedCost() {
		return commitedCost;
	}

	public double getPercentageCompleted() {
		return percentageCompleted;
	}

	public String getContractCode() {
		return contractCode;
	}

	public String getDescription() {
		return description;
	}

	public int getForecast() {
		return forecast;
	}

	public long getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public BigDecimal getPaid() {
		return paid;
	}

	public Project getProject() {
		return project;
	}

	public String getVendor() {
		return vendor;
	}

	public void setBudget(BigDecimal budget) {
		this.budget = budget;
	}

	public void setCommitedCost(BigDecimal commitedCost) {
		this.commitedCost = commitedCost;
	}

	public void setPercentageCompleted(double percentageCompleted) {
		this.percentageCompleted = percentageCompleted;
	}

	public void setContractCode(String contractCode) {
		this.contractCode = contractCode;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setForecast(int forecast) {
		this.forecast = forecast;
	}

	public void setId(long id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPaid(BigDecimal paid) {
		this.paid = paid;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public void setVendor(String vendor) {
		this.vendor = vendor;
	}

	public void calculatePercentage() {
		
		this.percentageCompleted = (this.budget.doubleValue()/this.project.getTotalProjectBudget().doubleValue()*100);
		
	} 

}
