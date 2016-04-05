package com.aconex.controller;

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

import com.aconex.model.Pcontract;
import com.aconex.model.Project;
import com.aconex.service.PcontractService;
import com.aconex.service.ProjectService;

@Controller
public class ContractController {

	@Autowired
	private PcontractService pcontractService;
	@Autowired
	private ProjectService projectService;

	@RequestMapping(value = "/getAllContracts", method = RequestMethod.GET)
	public List<Pcontract> list() {
		return pcontractService.list();
	}

	@RequestMapping(value = "/addContract/{projectId}", method = RequestMethod.GET)
	public String getAddContractForm(@ModelAttribute("contract") Pcontract contract,@PathVariable Long projectId, Model model) {
		model.addAttribute("projectId", projectId);
		return "contract_Addform";
	}
	
	@RequestMapping(value = "/saveContract/{projectId}", method = RequestMethod.POST)
	public String saveContract(@Valid @ModelAttribute("contract") Pcontract contract, BindingResult result,@PathVariable Long projectId) {
		if (result.hasErrors()) {
			return "contract_Addform";
		} else {
			Project project = projectService.getProject(projectId);
			//pcontractService.saveContract(contract);
			projectService.addContract(project, contract);
			projectService.update(projectId, project);
			return "redirect:/getProjectById/"+projectId;
		}
	}

	@RequestMapping(value = "/getContractById/{id}", method = RequestMethod.GET)
	public String getContract(@PathVariable Long id, Model model) {
		Pcontract contract = pcontractService.getContract(id);
		model.addAttribute("contract", contract);
		return "contract_View";
	}

	@RequestMapping(value = "/deleteContractById/{contractId}/{ProjectId}", method = RequestMethod.GET)
	public String deleteContact(@PathVariable Long contractId, @PathVariable Long ProjectId) {
		projectService.deleteContract(contractId,ProjectId);
		return "redirect:/getProjectById/"+ProjectId;
	}
	

	@RequestMapping(value = "/editContract/{id}", method = RequestMethod.GET)
	public String editProject(@PathVariable Long id,@ModelAttribute("contract") Pcontract contract, Model model) {
		Pcontract contractToEdit = pcontractService.getContract(id);
		model.addAttribute("contract", contractToEdit);
		return "contract_Editform";
	}
	
	@RequestMapping(value = "/updateContract/{id}", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("contract") Pcontract contract, BindingResult result,@PathVariable Long id) {
		//update the list of a project as well while updating the contract, by cascading 
		
		if (result.hasErrors()) {
			return "contract_Editform";
		} else {

			Pcontract updatedContract = pcontractService.update(id, contract);
		
			return "redirect:/getContractById/"+updatedContract.getId();	
		}
	}
}
