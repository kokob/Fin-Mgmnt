package com.aconex.service;

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
		
		project.getContracts().add(contract);
		contract.setProject(project);
	}

	public void deleteContract(Long contractId, Long projectId) {
		
		Project project = getProject(projectId);
		project.getContracts().removeIf(x -> x.getId() == contractId);
							  
		update(projectId,project);					  
							  
							  
	}


}
