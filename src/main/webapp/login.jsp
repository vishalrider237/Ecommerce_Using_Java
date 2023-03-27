<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 3/22/2023
  Time: 9:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Login</title>
    <%@include file="components/common_css_js.jsp"%>
    <style>
        body{
            background: url("img/bg.png");
            background-repeat: no-repeat;
            background-size: cover;

        }
    </style>
</head>
<body>
<%@include file="components/navbar.jsp"%>

   <div class="container">
       <div class="row">
           <div class="col-md-6 offset-md-3">
           <div class="card mt-3">
               <div class="card-header text-white" style="background: #4a148c">
                 <h3>Login Here!!</h3>
               </div>
               <div class="card-body">
                   <%@include file="components/message.jsp"%>
                   <div class="container text-center">
                       <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/add-friend.png" alt="user_icon"/>
                   </div>
                   <form action="LoginServlet" method="post">
                       <div class="form-group">
                           <label for="exampleInputEmail1">Email address</label>
                           <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                       </div>
                       <div class="form-group">
                           <label for="exampleInputPassword1">Password</label>
                           <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                       </div>
                       <a href="register.jsp" class="text-center d-block mb-2">If not register click here!!</a>
                       <div class="container text-center">
                           <button type="submit" class="btn btn-primary border-0" >Submit</button>
                           <button type="reset" class="btn btn-primary border-0" >Reset</button>
                       </div>
                   </form>
               </div>
               <div class="card-footer">
                   @Copyright created by Vishal Pandey
               </div>

           </div>
           </div>
       </div>
   </div>
</body>
</html>
