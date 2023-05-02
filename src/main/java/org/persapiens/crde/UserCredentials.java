package org.persapiens.crde;

import java.util.List;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import lombok.Getter;
import lombok.Setter;

/**
 * User Credentials.
 * @author Marcelo Fernandes
 */
@Getter
@Setter
public class UserCredentials {
	private String username;
	private String password;
	@SuppressFBWarnings("EI_EXPOSE_REP")
	private List<String> authorities;
}
