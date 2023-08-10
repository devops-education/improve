package org.persapiens.improve.service;

import jakarta.annotation.PostConstruct;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import lombok.AccessLevel;
import lombok.Getter;
import org.persapiens.improve.domain.IdBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public abstract class InMemoryCrudService<T extends IdBean<ID>, ID extends Object> extends CrudService<T, ID> {
    
    @Autowired
    private CrudRepository<T, ID> repository;
    
    @Getter(AccessLevel.PROTECTED)
    private Map<ID, T> beans;    

    @PostConstruct
    void init() {
        beans = new HashMap<>();
        for(T bean : repository.findAll()) {
            beans.put(bean.getId(), bean);
        }
        for(T bean : repository.findAll()) {
            beans.put(bean.getId(), fill(bean));
        }
    }

    protected T fill(T result) {
        return result;
    }
    
    @Override
    public Optional<T> findById(ID id)  {
        return Optional.ofNullable(beans.get(id));
    }
    
    @Override
    public long count() {
        return beans.size();
    }
    
    @Override
    public Collection<T> findAll() {
        return beans.values();
    }

    @Override
    public void save(T bean) {
        super.save(bean);
        beans.put(bean.getId(), bean);
        beans.put(bean.getId(), fill(bean));
    }

    @Override
    public void delete(T bean) {
        super.delete(bean);
        beans.remove(bean.getId());
    }
}
