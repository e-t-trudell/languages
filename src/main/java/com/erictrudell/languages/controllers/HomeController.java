package com.erictrudell.languages.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.erictrudell.languages.models.Language;
import com.erictrudell.languages.services.LanguageService;

@Controller
public class HomeController {
	
	@Autowired
	private LanguageService languageServ;
	@GetMapping("/")
	public String home(@ModelAttribute("language") Language lang, 
			Model model) {
		List<Language> allLang = languageServ.getAllLanguages();
		model.addAttribute("allLangs", allLang);
		return "index.jsp";
	}
}
