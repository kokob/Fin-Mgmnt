package com.aconex.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aconex.model.Pcontract;
import com.aconex.repository.ContractRepository;

@Service
public class PcontractService {
	

	@Autowired
	private ContractRepository contractRepository;

	
	public List<Pcontract> list() {
		return contractRepository.findAll();
	}

	public Pcontract saveContract(Pcontract contract) {
		return contractRepository.saveAndFlush(contract);
	}

	public Pcontract getContract(Long id) {
		return contractRepository.findOne(id);
	}

	public void deleteContact(Long id) {
		
		contractRepository.delete(id);
	}
	
	public Pcontract update(Long id, Pcontract contract) {
		Pcontract existingContract = contractRepository.findOne(id);
		contract.setProject(existingContract.getProject());
		BeanUtils.copyProperties(contract, existingContract);
		
		return contractRepository.saveAndFlush(existingContract);
				
	}

}
