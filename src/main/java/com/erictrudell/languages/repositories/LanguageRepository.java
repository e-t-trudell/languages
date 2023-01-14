package com.erictrudell.languages.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.erictrudell.languages.models.Language;

public interface LanguageRepository extends CrudRepository<Language, Long>{
	List<Language> findAll();
	Language getOne(Long id);
	List<Language> save(String e);
}
