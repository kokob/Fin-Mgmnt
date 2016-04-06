package com.aconex.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aconex.model.Pcontract;
import com.aconex.model.Project;
import com.aconex.repository.ProjectRepository;

@Service
public class ProjectService {
	
	@Autowired
	private ProjectRepository projectRepository;

	
	public List<Project> list() {
		return projectRepository.findAll();
	}

	public Project saveProject(Project project) {
		return projectRepository.saveAndFlush(project);
	}

	public Project getProject(Long id) {
		return projectRepository.findOne(id);
	}

	public void deleteProject(Long id) {
		projectRepository.delete(id);
	}
	
	public Project update(Long id,Project project) {
		Project existingProject = projectRepository.findOne(id);
		copyProperties(project, existingProject);
		return projectRepository.saveAndFlush(existingProject);
				
	}

	private void copyProperties(Project project, Project existingProject) {
		existingProject.setProjectCode(project.getProjectCode());
		existingProject.setProjectName(project.getProjectName());
		existingProject.setProjectVendor(project.getProjectVendor());
		existingProject.setTotalProjectBudget(project.getTotalProjectBudget());	
	}

	public void addContract(Project project, Pcontract contract) {
		
		project.addContract(contract);
		reComputeBudgetPercentage(project);
	}

	private void reComputeBudgetPercentage(Project project) {
		project.getContracts().forEach(item-> item.calculatePercentage());	
	}

	public void deleteContract(Long contractId, Long projectId) {
		
		Project project = getProject(projectId);
		project.getContracts().removeIf(x -> x.getId() == contractId);							  
		update(projectId,project);					  							  
	}

	public void prePopulateProjects() {
		Project p1 = new Project("Bay bridge", new BigDecimal(1000000.00) , "BRG_Con", "SF city");
		Pcontract pc1 = new Pcontract("bridge contract 1", "Lay foundation", "BRG_C1", new BigDecimal(32344), new BigDecimal(3454), 0, new BigDecimal(34), 0, "SF county");
		Pcontract pc2 = new Pcontract("bridge contract 2", "Build Support", "BRG_C2", new BigDecimal(76576), new BigDecimal(6567), 0, new BigDecimal(76), 0, "SF county");
		Pcontract pc3 = new Pcontract("bridge contract 3", "Add Suspension", "BRG_C3", new BigDecimal(62324), new BigDecimal(3435), 0, new BigDecimal(65), 0, "SF county");
		p1.addContract(pc1);
		p1.addContract(pc2);
		p1.addContract(pc3);
		
		projectRepository.save(p1);
		
		Project p2 = new Project("Aconex Skyscraper", new BigDecimal(500000.00) , "BLD_Con", "Aconex");
		Pcontract pc_1 = new Pcontract("building contract 1", "Lay foundation", "BLD_C1", new BigDecimal(3344), new BigDecimal(454), 0, new BigDecimal(41), 0, "ABC inc");
		Pcontract pc_2 = new Pcontract("building contract 2", "Build Beams", "BLD_C2", new BigDecimal(7576), new BigDecimal(657), 0, new BigDecimal(63), 0, "Orchard");
		Pcontract pc_3 = new Pcontract("building contract 3", "Add Finishing", "BLD_C3", new BigDecimal(6324), new BigDecimal(345), 0, new BigDecimal(45), 0, "Home Depot");
		p2.addContract(pc_1);
		p2.addContract(pc_2);
		p2.addContract(pc_3);
		
		projectRepository.save(p2);
		
		
	}


}
