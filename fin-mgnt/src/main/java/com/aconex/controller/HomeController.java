package com.aconex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aconex.service.ProjectService;

@Controller
public class HomeController {
	
	@Autowired
	private ProjectService projectService;
	
	@RequestMapping("/Aconex")
	public String homePage(){
		projectService.prePopulateProjects();
			return "home";
	}
}
