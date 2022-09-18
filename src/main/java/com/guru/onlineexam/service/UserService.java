package com.guru.onlineexam.service;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.guru.onlineexam.dao.MainDao;
import com.guru.onlineexam.entity.User;

@Service
public class UserService {

    @Autowired
    MainDao maindDao;

    public boolean handleRegistration(String username, String email, String password) {
        boolean isRegistered;
        Session session = maindDao.getSession();
        Transaction tx = session.beginTransaction();
        User user = new User();

        user.setName(username);
        user.setEmail(email);

        user.setPassword(password);
        user.setUser_type("normal");

        session.save(user);
        if (user.equals(null)) {
            isRegistered = false;
        } else {
            System.out.println(user);
            System.out.println("registed...");
            isRegistered = true;
        }

        tx.commit();
        return isRegistered;
    }

    public User loginHandler(String email, String password) {
        User user = null;

        try {
            String query = "from User where email=: e and password=: p";
            Session session = maindDao.getSession();
            Query q = session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", password);
            user = (User) q.uniqueResult();
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;

    }

}
