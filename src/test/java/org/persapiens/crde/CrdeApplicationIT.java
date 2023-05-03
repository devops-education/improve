package org.persapiens.crde;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;

import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@SpringBootTest(classes = CrdeApplication.class)
public class CrdeApplicationIT {

	@Test
	public void contextLoads() {
	}
}
