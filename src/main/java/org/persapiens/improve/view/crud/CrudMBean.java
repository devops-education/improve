package org.persapiens.improve.view.crud;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.persapiens.improve.view.AbstractMBean;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import org.persapiens.improve.domain.IdBean;
import org.persapiens.improve.service.CrudService;
import org.primefaces.PrimeFaces;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Managed Bean abstrato de crud.
 *
 * @param <T> tipo do bean
 * @param <ID> tipo da chave do bean
 */
@Setter
public abstract class CrudMBean<T extends IdBean<ID>, ID extends Serializable> extends AbstractMBean {

	private static final long serialVersionUID = 1L;

	protected static final String ID_MESSAGES_CRUD = "messages";

	protected static final String CADASTRO_SUCESSO = "Successful insert!";

	protected static final String ATUALIZACAO_SUCESSO = "Successful update!";

	protected static final String DELECAO_SUCESSO = "Successful delete!";

	protected static final String ATIVACAO_SUCESSO = "Successful activation!";

	protected static final String CANCELAMENTO_SUCESSO = "Successful cancel!";

	protected static final String DETAIL = "DETAIL";

	protected static final String LIST = "LIST";

	protected static final String UPDATE = "UPDATE";

	protected static final String INSERT = "INSERT";

	private CrudService<T, ID> service;

	@SuppressFBWarnings("EI_EXPOSE_REP2")
	@Autowired
	public void setService(CrudService<T, ID> service) {
		this.service = service;
	}

	@Getter
	private T bean;

	@Setter(AccessLevel.NONE)
	private List<T> beanList = null;

	public CrudMBean() {
		setVisualizationMode(LIST);
	}

	@SuppressFBWarnings("EI_EXPOSE_REP")
	public final List<T> getBeanList() {
		try {
			if (this.beanList == null) {
				this.beanList = find();
			}
		}
		catch (Exception e) {
			tratarException(ID_MESSAGES_CRUD, "Pesquisa", e);
		}
		return this.beanList;
	}

	@Getter
	private List<T> filteredBeanList = null;

	@Getter
	private String visualizationMode;

	@Getter
	private String visualizationModeAfterDelete = LIST;

	@Getter
	private String visualizationModeAfterInsert = INSERT;

	@Getter
	private String visualizationModeAfterUpdate = LIST;

	@Getter
	private String keyValue;

	public List<T> find() {
		return toList(this.service.findAll());
	}

	public void startFindAction() {
		setVisualizationMode(LIST);

		this.beanList = null;
	}

	public final void findAction() {
		this.beanList = null;
	}

	protected abstract T createBean();

	protected T init(T result) {
		return result;
	}

	private T createAndInitBean() {
		T result = createBean();

		result = init(result);

		return result;
	}

	public final String getManagedBeanName() {
		String result = getClass().getName();
		result = result.substring(result.lastIndexOf('.') + 1);
		result = result.substring(0, 1).toLowerCase(Locale.ITALIAN) + result.substring(1, result.length() - 4);
		return result;
	}

	protected String cancelInsertUpdateAction() {
		startFindAction();

		return null;
	}

	public String cancelInsertAction() {
		return cancelInsertUpdateAction();
	}

	public String cancelUpdateAction() {
		return cancelInsertUpdateAction();
	}

	public void startInsertAction() {
		setBean(createAndInitBean());

		setVisualizationMode(INSERT);
	}

	protected void insert(T bean) {
		this.service.save(bean);
	}

	protected T processBeforeInsertUpdate(T bean) {
		return bean;
	}

	protected T processBeforeInsert(T bean) {
		return processBeforeInsertUpdate(bean);
	}

	protected String processAfterInsert() {
		processVisualizationMode(getVisualizationModeAfterInsert());
		return null;
	}

	public boolean isCheckStartInsert(T bean) {
		return false;
	}

	public final String insertAction(String visualizationMode) {
		String result = null;

		try {
			setVisualizationModeAfterInsert(visualizationMode);

			T beanToInsert = processBeforeInsert(getBean());

			insert(beanToInsert);

			addInfoMessage(ID_MESSAGES_CRUD, CADASTRO_SUCESSO, CADASTRO_SUCESSO);

			result = processAfterInsert();
		}
		catch (Exception e) {
			tratarException(ID_MESSAGES_CRUD, "Cadastro", e);
		}

		return result;
	}

	protected T getDetailBean(T bean) {
		return bean;
	}

	protected T getUpdateBean(T bean) {
		return bean;
	}

	public void startUpdateAction() {
		setBean(getUpdateBean(getBean()));

		setVisualizationMode(UPDATE);
	}

	protected void update(T bean) {
		this.service.save(bean);
	}

	protected T processBeforeUpdate(T bean) {
		return processBeforeInsertUpdate(bean);
	}

	protected String processAfterUpdate() {
		processVisualizationMode(getVisualizationModeAfterUpdate());

		return null;
	}

	public boolean isCheckStartUpdate(T bean) {
		return false;
	}

	public final String updateAction(String visualizationMode) {
		String result = null;
		try {
			setVisualizationModeAfterUpdate(visualizationMode);

			// recupera o bean para atualizar
			T updateBean = getBean();

			// processa o bean antes de atualizar
			updateBean = processBeforeUpdate(updateBean);

			// atualiza o bean na fachada
			update(updateBean);

			// atualizando a lista de beans
			if (this.beanList != null) {
				int indexOfBean = -1;

				for (int counter = 0; counter < this.beanList.size(); counter++) {
					if (this.beanList.get(counter).equals(updateBean)) {
						indexOfBean = counter;
						break;
					}
				}
				if (indexOfBean > -1) {
					List<T> newBeanList = new ArrayList<>();
					newBeanList.addAll(this.beanList.subList(0, indexOfBean));
					newBeanList.add(updateBean);
					newBeanList.addAll(this.beanList.subList(indexOfBean + 1, this.beanList.size()));
					this.beanList = newBeanList;
				}
			}

			// adicionar mensagem de cadastro ok
			addInfoMessage(ID_MESSAGES_CRUD, ATUALIZACAO_SUCESSO, ATUALIZACAO_SUCESSO);

			result = processAfterUpdate();
		}
		catch (Exception e) {
			tratarException(ID_MESSAGES_CRUD, "Atualização", e);
		}
		return result;
	}

	public void startDetailAction() {
		setVisualizationMode(DETAIL);

		T newBean = getDetailBean(getBean());
		setBean(newBean);
	}

	public boolean isDetailable(T bean) {
		return true;
	}

	public final void detailAction() {
		setVisualizationMode(LIST);
	}

	protected void delete(T bean) {
		this.service.delete(bean);
	}

	protected T processBeforeDelete(T bean) {
		return bean;
	}

	public boolean isCheckBeforeDelete(T bean) {
		return false;
	}

	public boolean alarmOnDelete(T bean) {
		return true;
	}

	protected void processAfterDelete() {
		processVisualizationMode(getVisualizationModeAfterDelete());
	}

	protected final void processVisualizationMode(String visualizationModeParameter) {
		if (visualizationModeParameter.equals(LIST)) {
			startFindAction();
		}
		else if (visualizationModeParameter.equals(DETAIL)) {
			startDetailAction();
		}
		else if (visualizationModeParameter.equals(INSERT)) {
			startInsertAction();
		}
		else if (visualizationModeParameter.equals(UPDATE)) {
			startUpdateAction();
		}

		processCustomVisualizationMode(visualizationModeParameter);

		PrimeFaces primefaces = PrimeFaces.current();
		primefaces.ajax().update("messages");
		primefaces.scrollTo("messages");
	}

	protected void processCustomVisualizationMode(String visualizationModeParameter) {
	}

	public final void deleteAction(String visualizationMode) {
		try {
			setVisualizationModeAfterDelete(visualizationMode);

			// recupera o bean para remover
			T deleteBean = getBean();

			// processa o bean antes de remover
			deleteBean = processBeforeDelete(deleteBean);

			// remove o bean na fachada
			delete(deleteBean);

			// adicionar mensagem de deleção ok
			addInfoMessage(ID_MESSAGES_CRUD, DELECAO_SUCESSO, DELECAO_SUCESSO);

			processAfterDelete();
		}
		catch (Exception e) {
			tratarException(ID_MESSAGES_CRUD, "Remoção", e);
		}
	}

	public String deleteAlertMessage(T bean) {
		return "Confirma remoção?";
	}

	public boolean isDisabledUpdateButton() {
		return false;
	}

	public boolean isDisabledInsertButton() {
		return false;
	}

	public String getDatabaseFilterProcess() {
		return "";
	}

}
