<%@page import="com.learn.mycart.entities.User" %>
<%@ page import="com.learn.mycart.dao.CategoryDao" %>
<%@ page import="com.learn.mycart.entities.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.learn.mycart.helper.Helper" %>
<%@ page import="com.learn.mycart.helper.FactoryProvider" %>
<%
    User user= (User) session.getAttribute("current_user");
    if (user==null){
        session.setAttribute("message","You are not logged in!!");
        response.sendRedirect("login.jsp");
        return;
    }
    else{
        if (user.getUserType().equals("admin")){
            session.setAttribute("message","You are not normal user!! this page is only for normal users");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>



<%
    CategoryDao categoryDao=new CategoryDao(FactoryProvider.getFactory());
    List<Category> list=categoryDao.getCategory();

    // Getting Count
    HashMap<String,Long> m= Helper.getCounts(FactoryProvider.getFactory());

%>




<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Normal</title>
    <%@include file="components/common_css_js.jsp"%>

</head>
<style>
    .normal .card{
        border: 1px solid #673ab7;
    }
    .normal .card:hover{
        background: #e2e2e2;
        cursor: pointer;
    }
    body{
        background: url("img/bg.png");
        background-repeat: no-repeat;
        background-size: cover;

    }
</style>
<body>
<%@include file="components/navbar.jsp"%>
<div class="container normal">
    <div class="row mt-5">
        <div class="col-md-5">
            <div class="card">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/list.png" alt="user_icon"/>
                    </div>

                    <h1><%=list.size()%></h1>
                    <h1 class="text-uppercase text-muted">Categories</h1>
                </div>
            </div>

        </div>
        <!-- Third col-->
        <div class="col-md-4">
            <div class="card">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/product.png" alt="user_icon"/>
                    </div>
                    <h1><%=m.get("productCount")%></h1>
                    <h1 class="text-uppercase text-muted">Products</h1>
                </div>
            </div>

        </div>
    </div>
    </div>
</div>
</body>
<%@include file="components/common_modals.jsp"%>
</html>
