<%@ page import="com.learn.mycart.entities.User" %>
<%@ page import="com.learn.mycart.dao.CategoryDao" %>
<%@ page import="com.learn.mycart.helper.FactoryProvider" %>
<%@ page import="com.learn.mycart.entities.Category" %>
<%@ page import="java.util.List" %>
<%
User user1= (User) session.getAttribute("current_user");
%>
<%
    CategoryDao cdao1=new CategoryDao(FactoryProvider.getFactory());
    List<Category> list2=cdao1.getCategory();
%>

<nav class="navbar navbar-expand-lg navbar-dark  custom-bg" style="background: #4a148c!important;">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">MyCart</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Categories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <%
                            for (Category c:list2){
                        %>
                        <a href="index.jsp?category=<%=c.getCategoryId()%>" class="dropdown-item"><%=c.getCategoryTitle()%></a>

                        <%
                            }
                        %>
                    <!--    <a class="dropdown-item" href="#">Laptop</a>
                        <a class="dropdown-item" href="#">Mobile Phone</a>
                        <div class="dropdown-divider"></div
                        <a class="dropdown-item" href="#">Cloths</a>
                        <a class="dropdown-item" href="#">Electronics</a>-->
                    </div>
                </li>

            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart">
                  <i class="fa fa-cart-plus" style="font-size: 30px;"><span class="ml-1 cart-items" style="font-size: 15px;">(0)</span></i></a>
                </li>
            <%
                if (user1==null){
                    %>

                <li class="nav-item active">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="register.jsp">Register</a>
                </li>
                <%
                }else{
                    %>

                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="<%=user1.getUserType().equals("admin")?"admin.jsp":"normal.jsp"%>"><%=user1.getUserName()%></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="LogoutServlet">Logout</a>
                    </li>
                    <%

                }
            %>

            </ul>
        </div>
    </div>
</nav>