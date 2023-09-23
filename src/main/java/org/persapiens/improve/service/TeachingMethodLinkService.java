package org.persapiens.improve.service;

import java.util.Set;
import java.util.stream.Collectors;
import lombok.Getter;
import org.persapiens.improve.domain.Link;
import org.persapiens.improve.domain.TeachingMethod;
import org.persapiens.improve.domain.TeachingMethodLink;
import org.persapiens.improve.domain.TeachingMethodLinkId;
import org.persapiens.improve.persistence.TeachingMethodLinkRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeachingMethodLinkService extends InMemoryCrudService<TeachingMethodLink, TeachingMethodLinkId> {

	@Getter
	@Autowired
	private TeachingMethodLinkRepository repository;

	public Set<TeachingMethodLink> findByLink(Link link) {
		return getBeans().values().stream().filter(t -> t.getLink().equals(link)).collect(Collectors.toSet());
	}

	public Set<TeachingMethodLink> findByTeachingMethod(TeachingMethod teachingMethod) {
		return getBeans().values()
			.stream()
			.filter(t -> t.getTeachingMethod().equals(teachingMethod))
			.collect(Collectors.toSet());
	}

}
