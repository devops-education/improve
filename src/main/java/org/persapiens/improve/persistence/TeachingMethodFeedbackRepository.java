package org.persapiens.improve.persistence;

import java.util.Collection;
import java.util.List;
import org.persapiens.improve.domain.TeachingMethod;
import org.persapiens.improve.domain.TeachingMethodFeedback;
import org.persapiens.improve.domain.User;

import org.springframework.data.repository.CrudRepository;

public interface TeachingMethodFeedbackRepository extends CrudRepository<TeachingMethodFeedback, Long> {
    List<TeachingMethodFeedback> findByUser(User user);
    
    List<TeachingMethodFeedback> findByTeachingMethodInAndUser(Collection<TeachingMethod> teachingMethods, User user);
}
