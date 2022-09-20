package com.guru.onlineexam.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;


import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.guru.onlineexam.dao.MainDao;
import com.guru.onlineexam.entity.Question;

@Service
public class QuestionService {

    @Autowired
    MainDao mainDao;

    @Autowired
    SessionFactory sessionFactory;

    public List<Question> getQuestion(String selectedOption) {

        Session session = mainDao.getSession();
        Criteria criteria = session.createCriteria(Question.class);
        List<Question> list = criteria.add(Restrictions.eq("que_subject", selectedOption)).list();
        return list;

    }

    public List<Question> getSubList() {
        // Session session = mainDao.getSession();
        Session session = sessionFactory.openSession();
        String query = "SELECT DISTINCT que_subject FROM Question";
        Query q = session.createQuery(query);
        List<Question> sublist = q.getResultList();

        return sublist;
    }

    public void addQuestionHandler(String q_question, String q_option1, String q_option2, String q_option3,
            String q_option4, String q_answeser, String q_subject) {

        Session session = mainDao.getSession();
        Transaction tx = session.beginTransaction();
        Question newQue = new Question();
        newQue.setQuestion(q_question);
        newQue.setOpt1(q_option1);
        newQue.setOpt2(q_option2);
        newQue.setOpt3(q_option3);
        newQue.setOpt4(q_option4);
        newQue.setAns(q_answeser);
        newQue.setQue_subject(q_subject);

        session.save(newQue);
        tx.commit();
        System.out.println("new que added...");

    }
}
