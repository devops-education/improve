package org.persapiens.crde.view.crud;

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
import org.persapiens.crde.domain.ChallengeFeedback;
import org.persapiens.crde.domain.LinkFeedback;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@SuperBuilder
public class LinkChallengeFeedback implements Serializable, Comparable<LinkChallengeFeedback> {

    private static final long serialVersionUID = 1L;

    private LinkFeedback linkFeedback;
    
    private ChallengeFeedback challengeFeedback;
    
    @Override
    public int compareTo(LinkChallengeFeedback o) {
        return Comparator.comparing(LinkChallengeFeedback::getLinkFeedback)
                .thenComparing(LinkChallengeFeedback::getChallengeFeedback)
                .compare(this, o);
    }

}
