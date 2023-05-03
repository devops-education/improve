package org.persapiens.crde;

import java.util.List;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import lombok.Getter;
import lombok.Setter;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties("application-users")
@Getter
@Setter
public class ApplicationUsers {
	@SuppressFBWarnings("EI_EXPOSE_REP")
	private List<UserCredentials> usersCredentials;
}
