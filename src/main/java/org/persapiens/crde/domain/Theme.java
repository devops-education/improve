package org.persapiens.crde.domain;

import java.util.stream.Stream;
import lombok.Getter;

/**
 * Theme enum.
 *
 * @author Marcelo Fernandes
 */
public enum Theme {
    CURRICULUM("curriculum"),
    DEVOPS_CONCEPTS("devops concepts"),
    ASSESSMENT("assessment"),
    ENVIRONMENT_SETUP("environment setup"),
    TOOL_TECHNOLOGY("tool / technology"),
    CLASS_PREPARATION("class preparation"),
    STRATEGIES_IN_COURSE_EXECUTION("strategies in course execution");
    
    @Getter
    private String value;
    
    Theme(String value) {
        this.value = value;
    }
    
    public static Theme of(String persistentValue) {
        return Stream.of(Theme.values())
                .filter(t -> t.getValue().equals(persistentValue))
                .findFirst()
                .orElseThrow(IllegalArgumentException::new);
    }
}
