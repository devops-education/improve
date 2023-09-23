package org.persapiens.improve.service;

import java.io.Serializable;
import java.util.Optional;
import org.persapiens.improve.domain.IdBean;
import org.springframework.data.repository.CrudRepository;

public abstract class RepositoryCrudService<T extends IdBean<ID>, ID extends Serializable>
		implements CrudService<T, ID> {

	protected abstract CrudRepository<T, ID> getRepository();

	@Override
	public Optional findById(ID id) {
		return getRepository().findById(id);
	}

	@Override
	public long count() {
		return getRepository().count();
	}

	@Override
	public Iterable<T> findAll() {
		return getRepository().findAll();
	}

	@Override
	public void save(T bean) {
		this.getRepository().save(bean);
	}

	@Override
	public void delete(T bean) {
		this.getRepository().delete(bean);
	}

}
