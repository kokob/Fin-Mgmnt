package com.aconex.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Project implements Serializable {

	private static final long serialVersionUID = -6797798475854053407L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	
	private String projectName;
	
	private BigDecimal totalProjectBudget;
	
	private String projectCode;
	
	private String projectVendor;
		
	@OneToMany(fetch=FetchType.EAGER ,cascade=CascadeType.ALL)
	private List<Pcontract> pcontracts;
	
	public Project(){
		
	}
	
	public Project(String projectName, BigDecimal totalProjectBudget, String projectCode, String projectVendor) {
		super();
		this.projectName = projectName;
		this.totalProjectBudget = totalProjectBudget;
		this.projectCode = projectCode;
		this.projectVendor = projectVendor;
		this.pcontracts = new ArrayList<Pcontract>();
	}

	public List<Pcontract> getContracts() {
		return pcontracts;
	}

	public long getId() {
		return id;
	}

	public List<Pcontract> getPcontracts() {
		return pcontracts;
	}

	public String getProjectCode() {
		return projectCode;
	}

	public String getProjectName() {
		return projectName;
	}

	public String getProjectVendor() {
		return projectVendor;
	}

	public BigDecimal getTotalProjectBudget() {
		return totalProjectBudget;
	}

	public void setContracts(List<Pcontract> pcontracts) {
		this.pcontracts = pcontracts;
	}

	public void setId(long id) {
		this.id = id;
	}

	public void setPcontracts(List<Pcontract> pcontracts) {
		this.pcontracts = pcontracts;
	}

	public void setProjectCode(String projectCode) {
		this.projectCode = projectCode;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public void setProjectVendor(String projectVendor) {
		this.projectVendor = projectVendor;
	}

	public void setTotalProjectBudget(BigDecimal totalProjectBudget) {
		this.totalProjectBudget = totalProjectBudget;
	}
	
	public void addContract(Pcontract contract){
		this.pcontracts.add(contract);
		contract.setProject(this);
	}
	

}
