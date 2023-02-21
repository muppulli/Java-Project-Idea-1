package com.muppulli.logicalctc;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.query.Query;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServices {

    private SessionFactory sessionFactory;

    // @Autowired
    public UserServices() { // SessionFactory sessionFactory) {
        //  this.sessionFactory = sessionFactory;
        System.out.println("session");
        final StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                .configure() // configures settings from hibernate.cfg.xml
                .build();
        try {
            System.out.println("session try");
            sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
            System.out.println("sessionFactory = " + sessionFactory);
        } catch (Exception e) {
            System.out.println("session catch");
            // The registry would be destroyed by the SessionFactory, but we had trouble building the SessionFactory
            // so destroy it manually.
            StandardServiceRegistryBuilder.destroy(registry);
        }
    }

    public List<Users> getUsers() {
        System.out.println("Ger Users");
        List<Users> customers;
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();

            Query<Users> theQuery = session.createQuery("SELECT u FROM USERS u", Users.class);

            customers = theQuery.getResultList();

            session.getTransaction().commit();
        }

        return customers;

    }
}