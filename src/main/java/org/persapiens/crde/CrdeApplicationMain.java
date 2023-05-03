package org.persapiens.crde;

import org.springframework.boot.builder.SpringApplicationBuilder;

public class CrdeApplicationMain {

	protected CrdeApplicationMain() {
	}

	public static void main(String[] args) {
		new SpringApplicationBuilder()
			.sources(CrdeApplication.class)
			.run(args);
	}

}
