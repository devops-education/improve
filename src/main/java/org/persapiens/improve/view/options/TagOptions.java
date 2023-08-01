package org.persapiens.improve.view.options;

import jakarta.faces.view.ViewScoped;

import org.persapiens.improve.domain.Tag;
import org.springframework.stereotype.Component;

@ViewScoped
@Component
public class TagOptions extends DomainOptions<Tag, Long> {

    private static final long serialVersionUID = 1L;

    @Override
    public String label(Tag e) {
        return e.getDescricao();
    }

    @Override
    protected Object key(Tag e) {
        return e.getId();
    }

}
