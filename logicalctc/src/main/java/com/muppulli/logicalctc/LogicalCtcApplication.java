package com.muppulli.logicalctc;

import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class LogicalCtcApplication {

	public static void main(String[] args) {
		SpringApplication.run(LogicalCtcApplication.class, args);
//		final StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
//				.configure() // configures settings from hibernate.cfg.xml
//				.build();
//		try {
//			System.out.println("Session Starting...");
//			SessionFactory sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
//			System.out.println("sessionFactory = " + sessionFactory);
//			System.out.println("Session Started.");
//		} catch (Exception e) {
//			System.out.println("session Error:\t" + e.getMessage());
//			StandardServiceRegistryBuilder.destroy(registry);
//		}
	}
}
