package co.edu.uptc.firstjavawebapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@ServletComponentScan
@SpringBootApplication
public class FirstjavawebappApplication {

	public static void main(String[] args) {
		SpringApplication.run(FirstjavawebappApplication.class, args);
	}

}
