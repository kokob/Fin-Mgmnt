package com.aconex.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.aconex.model.Project;

public interface ProjectRepository extends JpaRepository<Project, Long> {
	
	

}
