package com.erictrudell.languages.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.erictrudell.languages.models.Language;
import com.erictrudell.languages.services.LanguageService;

@Controller
@RequestMapping("/language")
public class LanguageController {
	@Autowired
	private LanguageService langServ;
	@PostMapping("/create")
	public String create(@Valid @ModelAttribute("expense")Language lang,
			BindingResult result){
		if (result.hasErrors()) {
			return "index.jsp";
			
		}else {
			langServ.createLanguage(lang);
			return "redirect:/";
		}
	}
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Long id,
			Model model) {
//		List<ExpenseModel> allExpenses = expenseServ.getAllExpenses();
		model.addAttribute("language", langServ.getOneLanguage(id));
		return"edit.jsp";
	}
	@GetMapping("/show/{id}")
	public String showMeWhatYouGot(@PathVariable("id") Long id,
			Model model) {
//		List<ExpenseModel> allExpenses = expenseServ.getAllExpenses();
		model.addAttribute("language", langServ.getOneLanguage(id));
		return"show.jsp";
	}
	@PutMapping("/edit/{id}")
	public String update(@Valid @ModelAttribute("language")Language lang,
			BindingResult result) {
		if(result.hasErrors()) {
			return"edit.jsp";
		}else {
			langServ.updateLanguage(lang);
			return"redirect:/";
		}
	}
	@DeleteMapping("/{id}")
	public String destroy(@PathVariable("id")Long id) {
		langServ.deleteLanguage(id);
		return"redirect:/";
	}
}
