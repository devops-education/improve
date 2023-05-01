package org.persapiens.crde.view.options;

import jakarta.faces.view.ViewScoped;
import jakarta.inject.Named;

import org.persapiens.crde.domain.Tag;

@ViewScoped
@Named
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
