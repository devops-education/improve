package br.edu.ifrn.cr;

import org.springframework.boot.builder.SpringApplicationBuilder;

public class CrApplicationMain {

	protected CrApplicationMain() {
	}

	public static void main(String[] args) {
		new SpringApplicationBuilder()
			.sources(CrApplication.class)
			.run(args);
	}

}
