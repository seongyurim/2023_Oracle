package com.study.di;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.study.di.beans.*;

// @SpringBootApplication
public class DiApplication {
	public static void main(String[] args) {
		// SpringApplication.run(DiApplication.class, args);

		ApplicationContext context = new AnnotationConfigApplicationContext(Config.class);

		Login obj = context.getBean("MemberLogin", Login.class);
		obj.login("jsh", "1234");
	}

}
