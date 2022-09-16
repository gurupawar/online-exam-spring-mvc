package com.guru.onlineexam.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDao {

    @Autowired
    SessionFactory sessionFactory;

    public Session getSession(){
        return sessionFactory.openSession();
    }
}
