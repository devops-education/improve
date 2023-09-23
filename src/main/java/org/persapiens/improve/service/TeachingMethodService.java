package org.persapiens.improve.service;

import lombok.Getter;
import org.persapiens.improve.domain.TeachingMethod;
import org.persapiens.improve.persistence.TeachingMethodRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeachingMethodService extends InMemoryCrudService<TeachingMethod, Long> {

	@Getter
	@Autowired
	private TeachingMethodRepository repository;

}
