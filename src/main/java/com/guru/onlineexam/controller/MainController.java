package com.guru.onlineexam.controller;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.guru.onlineexam.entity.Answer;
import com.guru.onlineexam.entity.Question;
import com.guru.onlineexam.entity.User;
import com.guru.onlineexam.service.QuestionService;
import com.guru.onlineexam.service.UserService;

@Controller
public class MainController implements ErrorController {

    @Autowired
    UserService userService;

    @Autowired
    QuestionService questionService;

    @RequestMapping("/error")
    public String error() {
        return "error";
    }

    // ! Home URL mapping
    @GetMapping("/home")
    public String home() {
        return "home";
    }

    // ! Register URL mapping
    @RequestMapping("/signup")
    public String signup() {
        return "signup";
    }

    // ! Register Button Click Handler
    @RequestMapping("registerUser")
    public ModelAndView registerUser(@RequestParam("username") String username, @RequestParam("email") String email,
            @RequestParam("password") String password) {
        ModelAndView mv = new ModelAndView();
        boolean isRegistered = userService.handleRegistration(username, email, password);

        if (isRegistered == true) {
            mv.setViewName("login");
            mv.addObject("msg", "<div class='alert alert-success' role='alert'> Registration successfull🎉 </div>");
        } else {
            mv.setViewName("signup");
            mv.addObject("msg", "<div class='alert alert-warning' role='alert'>Register first! 🥱</div>");
        }
        return mv;
    }

    // ! Login URL endopint mapping
    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    // ! Login Button click Handler
    @RequestMapping("/loginHandler")
    public ModelAndView loginHandler(@RequestParam("email") String email, @RequestParam("password") String password,
            HttpServletRequest request) {
        HttpSession httpSession = request.getSession();

        ModelAndView mv = new ModelAndView();
        mv.setViewName("QueType");
        User user = userService.loginHandler(email, password);

        if (user == null) {
            mv.addObject("erro_msg",
                    "<div class='alert alert-warning' role='alert'> invalid email and password 😥 try again </div>");
            mv.setViewName("/login");
        } else {
            httpSession.setAttribute("current-user", user);
            System.out.println("current-user:-" + user);

            if (user.getUser_type().equals("admin")) {
                List<Question> tCount = userService.getTotolUsers();
                httpSession.setAttribute("totalUser", tCount.get(0));
                System.out.println("you are in admin panel");
                httpSession.setAttribute("user_type", user.getUser_type());
                mv.setViewName("admin");
            } else if (user.getUser_type().equals("normal")) {
                List<Question> subList = questionService.getSubList();
                httpSession.setAttribute("user_type", user.getUser_type());
                System.out.println("you are normal user and you are in Question Page");
                httpSession.setAttribute("sublist", subList);
                mv.setViewName("QueType");
            }
        }
        return mv;
    }

    // ! Logout Handler
    @RequestMapping("/logout")
    public ModelAndView logoutHandler(HttpServletRequest request) {
        System.out.println("in logout Handler method");
        HttpSession httpSession = request.getSession();
        ModelAndView mv = new ModelAndView();
        httpSession.removeAttribute("current-user");
        mv.setViewName("login");
        mv.addObject("logout_msg", "<div class='alert alert-success' role='alert'>logged out🥱 see you soon!</div>");
        System.out.println("logged out");
        return mv;
    }

    // ! Start Quize Button Click Handler
    @RequestMapping("startQuiz")
    public ModelAndView startQuiz(@RequestParam("selectedOption") String selectedOption, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        List<Question> questionList = questionService.getQuestion(selectedOption);
        Question queList = questionList.get(0);
        boolean emp = queList == null;
        HttpSession httpSession = request.getSession();

        System.out.println(emp);
        if (emp) {
            mv.addObject("error_message", "no question found!😭");
            mv.setViewName("home");
        } else {
            httpSession.setAttribute("qNumber", 0);
            httpSession.setAttribute(("score"), 0);
            httpSession.setAttribute("queList_session", questionList);

            HashMap<Integer, Answer> hashmap = new HashMap<Integer, Answer>();
            httpSession.setAttribute(("userExamSubmittion"), hashmap);

            mv.addObject("sorted_Question", queList);
            mv.setViewName("question");
        }
        return mv;
    }

    // ! Next Button Click Handler
    @RequestMapping("nextQue")
    public ModelAndView nextQue(HttpServletRequest request) {
        HttpSession httpSession = request.getSession();
        Integer qNumber = (Integer) httpSession.getAttribute("qNumber");
        int nextQue = qNumber + 1;

        List<Question> list = (List<Question>) httpSession.getAttribute("queList_session");

        ModelAndView mv = new ModelAndView();
        mv.setViewName("question");

        if (nextQue < list.size()) {
            Question question = list.get(nextQue);
            mv.addObject("sorted_Question", question);
            httpSession.setAttribute("qNumber", nextQue);
        } else {
            mv.addObject("sorted_Question", list.get(list.size() - 1));
            mv.addObject("alert_msg",
                    "<div class='alert alert-warning alert-dismissible fade show' role='alert'>No more questions 🥲 <button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span> </button> </div>");
        }
        return mv;
    }

    // ! Previous Button Click Handler
    @RequestMapping("previousQue")
    public ModelAndView previousQue(HttpServletRequest request) {
        HttpSession httpSession = request.getSession();
        Integer qNumber = (Integer) httpSession.getAttribute("qNumber");
        int nexQue = qNumber - 1;

        List<Question> list = (List<Question>) httpSession.getAttribute("queList_session");

        ModelAndView mv = new ModelAndView();
        mv.setViewName("question");

        if (nexQue >= 0) {
            Question question = list.get(nexQue);
            mv.addObject("sorted_Question", question);
            httpSession.setAttribute("qNumber", nexQue);
        } else {
            mv.addObject("sorted_Question", list.get(0));
            mv.addObject("alert_msg",
                    "<div class='alert alert-warning alert-dismissible fade show' role='alert'>No more questions 🥲 <button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span> </button> </div>");
        }
        return mv;
    }

    // ! Admin endpint
    @RequestMapping("/admin")
    public String adminPanel() {
        return "admin";
    }

    // ! endQuiz button handler
    @RequestMapping("endQuiz")
    public ModelAndView endQuiz(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        HttpSession httpSession = request.getSession();
        HashMap<Integer, Answer> hashList = (HashMap<Integer, Answer>) httpSession.getAttribute("userExamSubmittion");

        Collection<Answer> userGivenQueList = hashList.values();
        Integer finalScore = 0;
        for (Answer answer : userGivenQueList) {
            if (answer.getOriginalAnswer().equals(answer.getSubmittedAnswer())) {
                finalScore = (Integer) httpSession.getAttribute("score") + 1;
            }
        }
        mv.addObject("finalScore", finalScore);
        mv.addObject("userSumittedAnsQue", userGivenQueList);
        mv.setViewName("result");
        return mv;
    }

    // ! addQuestion handler
    @RequestMapping("addQuestion")
    public String addQuestion() {
        return "addQuestion";
    }

    // ! Add New Question in Database
    @RequestMapping("addNewQuestion")
    public ModelAndView addNewQuestion(@RequestParam("q_question") String q_question,
            @RequestParam("q_option1") String q_option1, @RequestParam("q_option2") String q_option2,
            @RequestParam("q_option3") String q_option3, @RequestParam("q_option4") String q_option4,
            @RequestParam("q_answeser") String q_answeser, @RequestParam("q_subject") String q_subject) {
        System.out.println("from addNewQuestion");
        ModelAndView mv = new ModelAndView();
        questionService.addQuestionHandler(q_question, q_option1, q_option2, q_option3, q_option4, q_answeser,
                q_subject);
        mv.setViewName("admin");
        mv.addObject("msg",
                "<div class='alert alert-success alert-dismissible fade show' role='alert'>New question added successfully🎉 <button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span> </button> </div>");
        return mv;
    }

    // ! Fetch Select Subject Question in Admin Page
    @RequestMapping("fetchQuestion")
    public ModelAndView fetchQuestion(@RequestParam("selectSubject") String selectSubject) {
        ModelAndView mv = new ModelAndView();
        List<Question> list = questionService.getSelectedSubjectQulistionList(selectSubject);
        mv.setViewName("admin");
        mv.addObject("QueList", list);
        System.out.println(list);
        return mv;
    }

    // Radio Button Handler
    @RequestMapping("saveResponse")
    public void saveResponse(Answer answer, HttpServletRequest request) {

        HttpSession httpSession = request.getSession();

        List<Question> list = (List<Question>) httpSession.getAttribute("queList_session");

        for (Question que : list) {
            String i = String.valueOf(answer.getQno()); // TODO : tyype casting Int to String
            if (que.getQ_id().equals(i)) {
                System.out.println();
                answer.setOriginalAnswer(que.getAns());
            }
        }

        HashMap<Integer, Answer> hashList = (HashMap<Integer, Answer>) httpSession.getAttribute("userExamSubmittion");
        hashList.put(answer.getQno(), answer);
        System.out.println(hashList);

    }
}
