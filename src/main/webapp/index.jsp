<%@ page import="com.learn.mycart.helper.FactoryProvider" %>
<%@ page import="com.learn.mycart.dao.ProductDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.learn.mycart.entities.Product" %>
<%@ page import="com.learn.mycart.dao.CategoryDao" %>
<%@ page import="com.learn.mycart.entities.Category" %>
<%@ page import="com.learn.mycart.helper.Helper" %>
<html>
<head>
    <title>Ecommerce-Home</title>
    <style>
        .list-group-item.active{
            background: #673ab7!important;
            border-color: #673ab7!important;
        }
        .discount-label{
            font-size: 12px!important;
            font-style: italic!important;
        }
        .product-card:hover{
            background: #e2e2e2;
            cursor: pointer;
        }
        body{
            background: url("img/bg.png");
            background-repeat: no-repeat;
            background-size: cover;


        }

    </style>
    <%@include file="components/common_css_js.jsp"%>
</head>
<body>
<%@include file="components/navbar.jsp"%>
<div class="container-fluid">
  <div class="row mt-3 mx-2">
      <%
          String cat=request.getParameter("category");
      //    out.println(cat);
          ProductDao productDao=new ProductDao(FactoryProvider.getFactory());
          List<Product>list=null;
          if (cat==null || cat.trim().equals("all")){
              list = productDao.getAllProducts();
          }

          else {
                  int cid = Integer.parseInt(cat.trim());
                  list = productDao.getAllProductsById(cid);
              }

          CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
          List<Category>list1=cdao.getCategory();
      %>
      <!-- Show Categories-->
      <div class="col-md-2">
          <div class="list-group mt-4">
              <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                  All Products
              </a>
              <%
                  for (Category c:list1){
              %>
              <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>

              <%
              }
          %>
          </div>
      </div>

      <!-- Show Products-->
      <div class="col-md-10">
       <div class="row mt-4">
           <div class="col-md-12">
               <div class="card-columns">
                   <!-- Traversing Product-->
                   <%
                       for (Product p:list){
                   %>
                   <div class="card product-card">
                       <div class="container text-center">
                           <img class="card-img-top m-2" style="max-height: 170px; max-width: 100%; width: auto;" src="img/products/<%=p.getpPhoto()%>" alt="Card image cap">
                       </div>
                       <div class="card-body">
                           <h5 class="card-title">
                               <%=p.getpName()%>
                           </h5>
                           <p class="card-text">
                               <%=Helper.get10Words(p.getpDesc())%>
                           </p>
                       </div>
                       <div class="card-footer text-center">
                           <button class="btn text-white" style="background: #673ab7;" onclick="add_to_cart(<%=p.getpId()%>,'<%=p.getpName()%>',<%=p.getPriceAfterAppliyingDiscount()%>)">Add To Cart</button>
                           <button class="btn btn-outline-success">&#8377 <%=p.getPriceAfterAppliyingDiscount()%>/-<span class="text-secondary discount-label">&#8377;<%=p.getpPrice()%> ,<%=p.getpDisc()%> Off</span></button>
                       </div>
                   </div>

                   <% }
                     if (list.size()==0){
                         out.println("<h3>No Items in this Category!!</h3>");
                     }

                   %>
               </div>
           </div>
       </div>
      </div>
  </div>
</div>
 <%@include file="components/common_modals.jsp"%>
</body>
</html>
