package com.aconex.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aconex.model.Project;
import com.aconex.service.ProjectService;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService projectService;
	
	@RequestMapping(value = "/homePage", method = RequestMethod.GET)
	public String backToHomePage() {
		return "home";
	}

	@RequestMapping(value = "/getAllProjects", method = RequestMethod.GET)
	public String list(Model model) {
		List<Project> projects = new ArrayList<Project>();
		projects = projectService.list();
		model.addAttribute("projects", projects);
		return "allProjects";
	}

	@RequestMapping(value = "/addProject", method = RequestMethod.GET)
	public String addProject(@ModelAttribute("project") Project project, Model model) {
		return "project_Addform";
	}

	@RequestMapping(value = "/saveProject", method = RequestMethod.POST)
	public String saveProject(@Valid @ModelAttribute("project") Project project, BindingResult result) {
		if (result.hasErrors()) {
			return "project_Addform";
		} else {
			projectService.saveProject(project);
			return "redirect:/getAllProjects";
		}
	}

	@RequestMapping(value = "/getProjectById/{id}", method = RequestMethod.GET)
	public String getProject(@PathVariable Long id,Model model) {
		Project project = projectService.getProject(id);
		model.addAttribute("project", project);
		return "projectDetails";
	}

	@RequestMapping(value = "/deleteProjectById/{id}", method = RequestMethod.GET)
	public String deleteContact(@PathVariable Long id) {
		projectService.deleteProject(id);
		return "redirect:/getAllProjects";
	}
	
	@RequestMapping(value = "/updateProject/{id}", method = RequestMethod.POST)
	public String update(@PathVariable Long id, @ModelAttribute("project") Project project, BindingResult result,Model model) {
		if (result.hasErrors()) {
			return "project_Editform";
		} else {
					
			 Project updatedProject = projectService.update(id, project);
			 model.addAttribute("project", updatedProject);
			return "projectDetails";
		}
		
	}

}
