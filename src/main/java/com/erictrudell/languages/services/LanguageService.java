package com.erictrudell.languages.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erictrudell.languages.models.Language;
import com.erictrudell.languages.repositories.LanguageRepository;


@Service
public class LanguageService {

	@Autowired
	private LanguageRepository langRepo;
	
	public Language getOneLanguage(Long id){
		return langRepo.getOne(id);
	}
	public List<Language> getAllLanguages(){
		return langRepo.findAll();
	}
	public Language createLanguage(Language e) {
		return langRepo.save(e);
	}
	public Language updateLanguage(Language e) {
		return langRepo.save(e);
	}
	public void deleteLanguage(Long id) {
		langRepo.deleteById(id);
	}
}
