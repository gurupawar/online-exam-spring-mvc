<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>miniPixxa</title>
    <%@include file="../component/style.jsp" %>
  </head>
  <body>
    <%@include file="../component/navbar.jsp" %>
     <div class="row mt-5">
      <div class="col-md-4 offset-md-4">
        <h3 class="text-center mb-5">Sign up here</h3>
        <div class="card">
          ${msg}
          <div class="card-body">
        <form action="registerUser" method="post">
          <div class="form-group">
            <label for="exampleInputEmail1">Name</label>
            <input
            type="text"
            name="username"
            class="form-control"
            +
            placeholder="Jonh Duo"
            required
            />
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Email address</label>
            <input
            type="email"
            name="email"
            class="form-control"
            aria-describedby="emailHelp"
            placeholder="Enter email"
            required
            />
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Password</label>
            <input
            type="password"
            name="password"
            class="form-control"
            placeholder="*******"
            required
            />
          </div>
          <div class="container text-center">
            <button class="btn btn-primary mb-2">Create Account</button> <br>
            <a href="login" class="btn-sm">Already have an account? Log in</a>
          </div>
        </div>
      </form>
    </div>
  </div>
    </div>

  </body>
</html>
