package org.persapiens.improve.service;

import java.io.Serializable;
import java.util.Optional;
import org.persapiens.improve.domain.IdBean;

public interface CrudService<T extends IdBean<ID>, ID extends Serializable> {
    
    Optional findById(ID id);
    
    long count();
    
    Iterable<T> findAll();

    void save(T bean);

    void delete(T bean);
}
