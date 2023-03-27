<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 3/22/2023
  Time: 5:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New User</title>
    <style>
        body{
            background: url("img/bg.png");
            background-repeat: no-repeat;
            background-size: cover;

        }
    </style>
</head>
<%@include file="components/common_css_js.jsp"%>
<body>
<%@include file="components/navbar.jsp"%>
 <div class="container-fluid">
     <div class="row mt-3">
         <div class="col-md-4 offset-md-4">
             <div class="card">
                 <%@include file="components/message.jsp"%>
                 <div class="card-body px-5">
                     <h3 class="text-center my-3">Sign Up here!!!</h3>
                     <form action="RegistrationServlet" method="post">
                         <div class="form-group">
                             <label for="name">User Name</label>
                             <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter Here" aria-describedby="emailHelp" placeholder="Enter email">
                         </div>
                         <div class="form-group">
                             <label for="email">User Email</label>
                             <input name="user_email" type="email" class="form-control" id="email" placeholder="Enter Here" aria-describedby="emailHelp" placeholder="Enter email">
                         </div>
                         <div class="form-group">
                             <label for="password">User Password</label>
                             <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter Here" aria-describedby="emailHelp" placeholder="Enter email">
                         </div>
                         <div class="form-group">
                             <label for="phone">User Phone-No</label>
                             <input name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter Here" aria-describedby="emailHelp" placeholder="Enter email">
                         </div>
                         <div class="form-group">
                             <label for="address">User Address</label>
                             <textarea name="user_address" style="height: 100px;" id="address" class="form-control" placeholder="Enter Your Address"></textarea>
                         </div>
                         <div class="container text-center">
                             <button class="btn btn-outline-success" type="submit">Register</button>
                             <button class="btn btn-outline-warning" type="reset">Reset</button>

                         </div>
                     </form>
                 </div>
             </div>

         </div>
     </div>
 </div>
</body>
</html>
