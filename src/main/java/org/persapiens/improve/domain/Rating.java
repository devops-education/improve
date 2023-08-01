package org.persapiens.improve.domain;

import lombok.Getter;

public enum Rating {
    FULLY_AGREE(5, "Fully Agree"),
    AGREE(4, "Agree"),
    NEUTRAL(3, "Neutral"),
    DISAGREE(2, "Disagree"),
    FULLY_DISAGREE(1, "Fully Disagree");
    
    @Getter
    private final int code;
    
    @Getter
    private final String description;
    
    Rating(int code, String description) {
        this.code = code;
        this.description = description;
    }
    
    public boolean isFullyDisagree() {
        return this.equals(DISAGREE);
    }
    public boolean isDisagree() {
        return this.equals(DISAGREE);
    }
    public boolean isNeutral() {
        return this.equals(NEUTRAL);
    }
    public boolean isAgree() {
        return this.equals(AGREE);
    }
    public boolean isFullyAgree() {
        return this.equals(FULLY_AGREE);
    }
    
}
