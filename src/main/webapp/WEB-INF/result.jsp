<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page import="com.guru.onlineexam.entity.Question"%>
<%@include file="../component/style.jsp"%>
<link rel="stylesheet" href="../css/main.css">

<%@include file="../component/navbar.jsp"%>
<div class="row mt-5">
	<div class="container">
		<div class="card bg-light">
            <div class="card-body">
                <h1>Your score is ${finalScore}</h1>
                ${userSumittedAnsQue}

                <table class="table table-bordered">
  <thead>
    <tr>
      <th scope="col">Q No.</th>
      <th scope="col">Question</th>
      <th scope="col">Given Answer</th>
      <th scope="col">Correct Answer</th>
    </tr>
  </thead>
  <tbody>
  <%
  Collection<Question> list =(Collection<Question>)  request.getAttribute("userSumittedAnsQue");
    %>


             </tbody>
            </table>
            </div>
        </div>
    </div>
</div>