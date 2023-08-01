package org.persapiens.improve;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserCredentials {
	private String username;
	private String password;
	private List<String> authorities;
}
