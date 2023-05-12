package org.persapiens.crde.view.crud;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import jakarta.faces.view.ViewScoped;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.persapiens.crde.domain.ChallengeFeedback;
import org.persapiens.crde.persistence.ChallengeFeedbackRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@ViewScoped
@Component
public class ChallengeFeedbackResumeCrudMBean extends CrudMBean<ChallengeFeedback, Long> {

    private static final long serialVersionUID = 1L;
    
    @SuppressFBWarnings("SE_BAD_FIELD")
    @Autowired
    private ChallengeFeedbackRepository challengeFeedbackRepository;
    
    @Override
    public List<ChallengeFeedback> find() {
        return challengeFeedbackRepository.findByUsername(username());
    }

    @Override
    protected ChallengeFeedback createBean() {
        return ChallengeFeedback.builder().build();
    }

}
