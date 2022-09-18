<%@page import="com.guru.onlineexam.entity.User"%>
<%
User user1 =(User) session.getAttribute("current-user");

%>

<nav
  class="navbar navbar-expand-lg navbar-dark bg-primary justify-content-between"
>
  <a class="navbar-brand" href="home">OnlineExam</a>
  <button
    class="navbar-toggler"
    type="button"
    data-toggle="collapse"
    data-target="#navbarSupportedContent"
    aria-controls="navbarSupportedContent"
    aria-expanded="false"
    aria-label="Toggle navigation"
  >
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="home"
          >Home <span class="sr-only">(current)</span></a
        >
      </li>
      <li class="nav-item dropdown">
        <a
          class="nav-link dropdown-toggle"
          href="#"
          id="navbarDropdown"
          role="button"
          data-toggle="dropdown"
          aria-haspopup="true"
          aria-expanded="false"
        >
          Category
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <ul class="navbar-nav mr-auto">
        <%
          if(user1 == null){
          %>
            <li class="nav-item">
               <a class="nav-link" href="login">Login</a>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="signup">Register</a>
            </li>
          <%
          }else {
            %>
            <li class="nav-item">
               <a class="nav-link" href="#!"><%= user1.getName() %></a>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="logout">Logout</a>
            </li>
            <%
          }
        %>
      </ul>
    </form>
  </div>
</nav>
