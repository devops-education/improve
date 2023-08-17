package org.persapiens.improve.domain;

import java.util.stream.Stream;
import lombok.Getter;

public enum ViewLogType {
    LOGIN("login"),
    HOME("menu home"),
    CHALLENGE("menu challenge"),
    RECOMMENDATION("menu recommendation"),
    SUMMARY("menu summary"),
    USER("menu user"),
    LOGOUT("logout"),
    CHALLENGE_DETAIL("challenge detail"),
    RECOMMENDATION_DETAIL("recommendation detail");
    
    @Getter
    private String value;
    
    ViewLogType(String value) {
        this.value = value;
    }
    
    public static ViewLogType of(String value) {
        return Stream.of(ViewLogType.values())
                .filter(t -> t.getValue().equals(value))
                .findFirst()
                .orElseThrow(IllegalArgumentException::new);
    }
}
