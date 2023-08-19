package org.persapiens.improve.view.crud;

import java.io.Serializable;

import java.util.Comparator;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.SuperBuilder;
import org.persapiens.improve.domain.TeachingMethodFeedback;
import org.persapiens.improve.domain.TeachingMethodLink;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@SuperBuilder
public class TeachingMethodLinkTeachingMethodFeedback implements Serializable, Comparable<TeachingMethodLinkTeachingMethodFeedback> {

    private static final long serialVersionUID = 1L;
    
    private TeachingMethodLink teachingMethodLink;
    
    private TeachingMethodFeedback teachingMethodFeedback;
    
    @Override
    public int compareTo(TeachingMethodLinkTeachingMethodFeedback o) {
        return Comparator.comparing(TeachingMethodLinkTeachingMethodFeedback::getTeachingMethodFeedback)
                .thenComparing(TeachingMethodLinkTeachingMethodFeedback::getTeachingMethodLink)
                .compare(this, o);
    }

}
