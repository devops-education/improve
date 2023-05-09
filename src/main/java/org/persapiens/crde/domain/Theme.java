package org.persapiens.crde.domain;

import java.util.stream.Stream;
import lombok.Getter;

public enum Theme {
    ASSESSMENT("assessment"),
    CLASS_PREPARATION("class preparation"),
    CURRICULUM("curriculum"),
    DEVOPS_CONCEPTS("devops concepts"),
    ENVIRONMENT_SETUP("environment setup"),
    STRATEGIES_IN_COURSE_EXECUTION("strategies in course execution"),
    TOOL_TECHNOLOGY("tool / technology");
    
    @Getter
    private String value;
    
    Theme(String value) {
        this.value = value;
    }
    
    public static Theme of(String value) {
        return Stream.of(Theme.values())
                .filter(t -> t.getValue().equals(value))
                .findFirst()
                .orElseThrow(IllegalArgumentException::new);
    }
}
