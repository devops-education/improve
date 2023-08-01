package org.persapiens.improve;

import org.springframework.boot.builder.SpringApplicationBuilder;

public class ImproveApplicationMain {

	protected ImproveApplicationMain() {
	}

	public static void main(String[] args) {
		new SpringApplicationBuilder()
			.sources(ImproveApplication.class)
			.run(args);
	}

}
