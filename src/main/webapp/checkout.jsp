<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 3/26/2023
  Time: 7:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    User user= (User) session.getAttribute("current_user");
    if (user==null){
        session.setAttribute("message","You are not logged in,Login First to access checkout page!!!");
        response.sendRedirect("login.jsp");
        return;
    }

%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Checkout</title>
</head>
<%@include file="components/common_css_js.jsp"%>
<style>
    body{
        background: url("img/bg.png");
        background-repeat: no-repeat;
        background-size: cover;

    }
</style>
<body>
<%@include file="components/navbar.jsp"%>
 <div class="container">
     <div class="row mt-5">
         <div class="col-md-6">
             <div class="card">
                 <h3 class="text-center mb-5">Your Selected Items</h3>
                 <div class="card-body">
                     <div class="cart-body">

                     </div>
                 </div>
             </div>
         </div>
         <div class="col-md-6">
             <!-- Form details-->
             <div class="card">
                 <h3 class="text-center mb-5">Your Details For Order</h3>
                 <div class="card-body">
                     <%@include file="components/message.jsp"%>
                     <form action="OrderServlet" method="post">
                         <div class="form-group">
                             <label for="exampleInputEmail1">Email address</label>
                             <input name="Oemail" value="<%=user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" >
                             <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                         </div>
                         <div class="form-group">
                             <label for="name">Your Name</label>
                             <input name="Oname" value="<%=user.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp1" placeholder="Enter Name">
                         </div>
                         <div class="form-group">
                             <label for="phone">Your Phone Number</label>
                             <input name="Ophone" value="<%=user.getUserPhone()%>" type="text" class="form-control" id="phone" aria-describedby="emailHelp1" placeholder="Enter Contact Number" >
                         </div>
                        <div class="form-group">
                         <label for="exampleFormControlTextarea1">Your Shipping Address</label>
                         <textarea name="Oaddress" class="form-control" id="exampleFormControlTextarea1" placeholder="Enter Your Address" rows="3"></textarea>
                 </div>
                         <div class="container text-center">
                             <button type="submit" class="btn btn-outline-success">Order Now</button>
                             <button class="btn btn-outline-primary"><a href="index.jsp">Continue Shopping</a> </button>
                         </div>
                     </form>
                 </div>
             </div>
         </div>
     </div>
 </div>
<%@include file="components/common_modals.jsp"%>
</body>
</html>
