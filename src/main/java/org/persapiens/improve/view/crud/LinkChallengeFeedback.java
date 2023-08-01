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
import org.persapiens.improve.domain.ChallengeFeedback;
import org.persapiens.improve.domain.Link;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@SuperBuilder
public class LinkChallengeFeedback implements Serializable, Comparable<LinkChallengeFeedback> {

    private static final long serialVersionUID = 1L;
    
    private Link link;
    
    private ChallengeFeedback challengeFeedback;
    
    @Override
    public int compareTo(LinkChallengeFeedback o) {
        return Comparator.comparing(LinkChallengeFeedback::getChallengeFeedback)
                .thenComparing(LinkChallengeFeedback::getLink)
                .compare(this, o);
    }

}
