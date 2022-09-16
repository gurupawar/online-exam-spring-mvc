package com.guru.onlineexam.service;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guru.onlineexam.dao.MainDao;
import com.guru.onlineexam.entity.Question;

@Service
public class QuestionService {

    @Autowired
    MainDao mainDao;
    public List<Question> getQuestion(String selectedOption) {

        Session session = mainDao.getSession();
        Criteria criteria = session.createCriteria(Question.class);
        List<Question> list=  criteria.add(Restrictions.eq("que_subject", selectedOption)).list();
        return list;

    }
}
