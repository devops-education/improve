package org.persapiens.improve.service;

import java.util.Optional;
import org.persapiens.improve.domain.IdBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public class CrudService<T extends IdBean<ID>, ID extends Object>{
    
    @Autowired
    private CrudRepository<T, ID> repository;
    
    public Optional findById(ID id)  {
        return repository.findById(id);
    }
    
    public long count() {
        return repository.count();
    }
    
    public Iterable<T> findAll() {
        return repository.findAll();
    }

    public void save(T bean) {
        this.repository.save(bean);
    }

    public void delete(T bean) {
        this.repository.delete(bean);
    }
}
