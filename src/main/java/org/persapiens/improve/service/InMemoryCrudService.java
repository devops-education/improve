package org.persapiens.improve.service;

import jakarta.annotation.PostConstruct;
import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import org.persapiens.improve.domain.IdBean;

public abstract class InMemoryCrudService<T extends IdBean<ID>, ID extends Serializable> extends RepositoryCrudService<T, ID> {    
    private Map<ID, T> beans;
    
    private boolean filled = false;

    @PostConstruct
    public void init() {
        if (beans == null) {
            beans = new HashMap<>();
            for(T bean : super.findAll()) {
                beans.put(bean.getId(), bean);
            }
        }
    }
    
    private void checkFilled() {
        if (!filled) {
            filled = true;
            for(Map.Entry<ID, T> entry : beans.entrySet()) {
                entry.setValue(fill(entry.getValue()));
            }
        }
    }
    
    protected T fill(T result) {
        return result;
    }
    
    protected Map<ID, T> getBeans() {
        checkFilled();
        return beans;
    }
    
    @Override
    public Optional<T> findById(ID id)  {
        return Optional.ofNullable(getBeans().get(id));
    }
    
    @Override
    public long count() {
        return getBeans().size();
    }
    
    @Override
    public Collection<T> findAll() {
        return getBeans().values();
    }

    @Override
    public void save(T bean) {
        super.save(bean);
        getBeans().put(bean.getId(), bean);
    }

    @Override
    public void delete(T bean) {
        super.delete(bean);
        getBeans().remove(bean.getId());
    }
}
