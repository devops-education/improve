package org.persapiens.crde.view.options;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import java.io.Serializable;
import java.util.List;

import jakarta.inject.Inject;

import org.springframework.data.repository.CrudRepository;

public abstract class DomainOptions<T, ID extends Serializable> extends Options <T, ID> {

    private static final long serialVersionUID = 1L;
    private CrudRepository<T, ID> service;

    @SuppressFBWarnings(EI_EXPOSE_REP)
    @Inject
    public void setService(CrudRepository<T, ID> service) {
        this.service = service;
    }

    /**
     * SOBRESCREVA se quiser alterar a forma padrao de como os beans sao
     * recuperados. Devolve a lista de beans. Por default, chama o service
     *
     * @return list of beans
     */
    protected List<T> fillList() {
        return toList(this.service.findAll());
    }

}
