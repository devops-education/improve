package br.edu.ifrn.cr.domain;

import jakarta.persistence.Column;
import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import java.util.Comparator;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@ToString
@EqualsAndHashCode(exclude = "id")
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@SuperBuilder
@Entity
@SequenceGenerator(sequenceName = "seq_link_feedback", name = "ID_SEQUENCE", allocationSize = 1)
public class LinkFeedback implements Serializable, Comparable<LinkFeedback> {

    private static final long serialVersionUID = 1L;
    private static final int LENGTH = 40000;

    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ID_SEQUENCE")
    @Id
    private Long id;

    @ManyToOne
    private Link link;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private FeedbackType feedbackType;
    
    @Column(nullable = false)
    private String username;

    @Column(nullable = false, length = LENGTH)
    private String justification;

    @Column(nullable = false, length = LENGTH)
    private String courseImprovement;

    @Override
    public int compareTo(LinkFeedback o) {
        return Comparator.comparing(LinkFeedback::getLink)
                .thenComparing(LinkFeedback::getFeedbackType)
                .thenComparing(LinkFeedback::getUsername)
                .compare(this, o);
    }

}
