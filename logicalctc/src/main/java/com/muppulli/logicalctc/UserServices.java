package com.muppulli.logicalctc;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServices {

    private final SessionFactory sessionFactory;

    @Autowired
    public UserServices(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List<Users> getUsers() {
        System.out.println("Ger Users");
        List<Users> customers;
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            Query<Users> theQuery = session.createQuery("SELECT u FROM Users u", Users.class);
            customers = theQuery.getResultList();
            session.getTransaction().commit();
        }
        return customers;
    }
}