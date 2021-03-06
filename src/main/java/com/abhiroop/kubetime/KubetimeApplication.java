package com.abhiroop.kubetime;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@EnableCaching      // to enable spring cache
@ComponentScan
public class KubetimeApplication {

	public static void main(String[] args) {
		SpringApplication.run(KubetimeApplication.class, args);
		System.out.println("App starts");
	}

	
}
