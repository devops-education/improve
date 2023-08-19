package org.persapiens.improve.service;

import java.util.Collection;
import java.util.List;
import lombok.Getter;
import org.persapiens.improve.domain.TeachingMethod;
import org.persapiens.improve.domain.TeachingMethodFeedback;
import org.persapiens.improve.domain.User;
import org.persapiens.improve.persistence.TeachingMethodFeedbackRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeachingMethodFeedbackService extends RepositoryCrudService <TeachingMethodFeedback, Long> {

    @Getter
    @Autowired
    private TeachingMethodFeedbackRepository repository;
    
    @Autowired
    private TeachingMethodService teachingMethodService;
    
    @Autowired
    private UserService userService;
    
    private List<TeachingMethodFeedback> fill(List<TeachingMethodFeedback> result) {
        for (TeachingMethodFeedback bean : result) {
            bean.setTeachingMethod(teachingMethodService.findById(bean.getTeachingMethod().getId()).get());
            bean.setUser(userService.findById(bean.getUser().getId()).get());
        }
        
        return result;
    }
    
    public List<TeachingMethodFeedback> findByUser(User user) {
        return fill(repository.findByUser(user));
    }
    
    public List<TeachingMethodFeedback> findByTeachingMethodInAndUser(Collection<TeachingMethod> recommendation, User user) {
        return fill(repository.findByTeachingMethodInAndUser(recommendation, user));
    }

    @Override
    public void save(TeachingMethodFeedback bean) {
        if (bean.getId() == null) {
            bean.insert();
        } else {
            bean.update();
        }

        super.save(bean);
    }
    
}
