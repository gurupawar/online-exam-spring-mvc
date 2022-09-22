<%@page import="java.util.List"%>
<%@page import="com.guru.onlineexam.entity.Question"%>
<%
        List<Question> list =(List<Question>)  request.getAttribute("QueList");
%>
<div class="container">
    <form action="fetchQuestion" method="post" class="text-center">
        <div class="form-group mt-5" style="min-width:300px; display:inline-block;">
            <select name="selectSubject" class="form-control" id="exampleFormControlSelect1">
                <option value="java">Java</option>
                <option value="gk">General Knowledge</option>
                <option value="math">Math</option>
            </select>
        </div>
        <button class="btn-dark rounded py-1 ml-2" style="cursor:pointer;">Fetch Data</div>
    </form>
</div>
<div class="container">
<table class="table table-bordered mt-5">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Q. No</th>
      <th scope="col">Question</th>
      <th scope="col">Option 1</th>
      <th scope="col">Option 2</th>
      <th scope="col">Option 4</th>
      <th scope="col">Option 4</th>
      <th scope="col">Answer</th>
      <th scope="col">Subject</th>
    </tr>
  </thead>
  <tbody>
    <%
    if(list != null){
        for(Question l : list){
    %>
     <tr>
      <th scope="row"><%=l.getQ_id() %></th>
      <td><%=l.getQuestion() %></td>
      <td><%=l.getOpt1() %></td>
      <td><%=l.getOpt2() %></td>
      <td><%=l.getOpt3() %></td>
      <td><%=l.getOpt4() %></td>
      <td><%=l.getAns() %></td>
      <td><%=l.getQue_subject() %></td>
      </tr>
      <%
        }
       }
      %>
  </tbody>
</table>
</div>
