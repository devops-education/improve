package org.persapiens.improve.view.options;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import java.io.Serializable;
import java.util.List;
import org.persapiens.improve.domain.IdBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;

public abstract class IdBeanOptions<T extends IdBean<ID>, ID extends Serializable> extends Options <T, ID> {

    private static final long serialVersionUID = 1L;
    private CrudRepository<T, ID> service;

    @SuppressFBWarnings(EI_EXPOSE_REP)
    @Autowired
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

    @Override
    protected Object key(T e) {
        return e.getId();
    }

}
