package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = "com.example")
public class Demo1Application {

	public static void main(String[] args) {
		ApplicationContext ctx = SpringApplication.run(Demo1Application.class, args);
		System.out.println("total bean def : " + ctx.getBeanDefinitionCount());
		// String[] beans = ctx.getBeanDefinitionNames();
	}

}
