package org.persapiens.improve.view.options;

import jakarta.faces.view.ViewScoped;

import org.persapiens.improve.domain.Tag;
import org.springframework.stereotype.Component;

@ViewScoped
@Component
public class TagOptions extends IdBeanOptions<Tag, Long> {

    private static final long serialVersionUID = 1L;

    @Override
    public String label(Tag e) {
        return e.getDescricao();
    }

}
