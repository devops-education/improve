package org.persapiens.improve.domain;

import java.io.Serializable;

public interface IdBean<ID> extends Serializable {

	int LENGTH = 40000;

	ID getId();

}
