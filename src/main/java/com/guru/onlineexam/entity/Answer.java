package com.guru.onlineexam.entity;

public class Answer {

    int qno;
    String question;
    String submittedAnswer, originalAnswer;

    public Answer() {
    }

    public Answer(int qno, String question, String submittedAnswer, String originalAnswer) {
        this.qno = qno;
        this.question = question;
        this.submittedAnswer = submittedAnswer;
        this.originalAnswer = originalAnswer;
    }

    @Override
    public String toString() {
        return "Answer [originalAnswer=" + originalAnswer + ", qno=" + qno + ", question=" + question
                + ", submittedAnswer=" + submittedAnswer + "]";
    }

    public int getQno() {
        return qno;
    }

    public void setQno(int qno) {
        this.qno = qno;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getSubmittedAnswer() {
        return submittedAnswer;
    }

    public void setSubmittedAnswer(String submittedAnswer) {
        this.submittedAnswer = submittedAnswer;
    }

    public String getOriginalAnswer() {
        return originalAnswer;
    }

    public void setOriginalAnswer(String originalAnswer) {
        this.originalAnswer = originalAnswer;
    }

}
