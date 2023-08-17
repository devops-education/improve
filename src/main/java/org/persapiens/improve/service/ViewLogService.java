package org.persapiens.improve.service;

import lombok.Getter;
import org.persapiens.improve.domain.ViewLog;
import org.persapiens.improve.persistence.ViewLogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.core.RepositoryCreationException;
import org.springframework.stereotype.Service;

@Service
public class ViewLogService extends RepositoryCrudService <ViewLog, Long> {

    @Getter
    @Autowired
    private ViewLogRepository repository;

    @Override
    public void save(ViewLog bean) {
        if (bean.getId() == null) {
            bean.insert();
        } else {
            throw new RepositoryCreationException("Cannot update viewLog", RepositoryCrudService.class);
        }
        super.save(bean);
    }
    
}
