<%@page import="com.learn.mycart.entities.User" %>
<%@ page import="com.learn.mycart.dao.CategoryDao" %>
<%@ page import="com.learn.mycart.helper.FactoryProvider" %>
<%@ page import="java.util.List" %>
<%@ page import="com.learn.mycart.entities.Category" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.learn.mycart.helper.Helper" %>
<%
    User user= (User) session.getAttribute("current_user");
    if (user==null){
        session.setAttribute("message","You are not logged in!!");
        response.sendRedirect("login.jsp");
        return;
    }
    else{
        if (user.getUserType().equals("normal")){
            session.setAttribute("message","You are not admin!! plz don't try access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>

<%
    CategoryDao categoryDao=new CategoryDao(FactoryProvider.getFactory());
    List<Category>list=categoryDao.getCategory();

    // Getting Count
    HashMap<String,Long>m=Helper.getCounts(FactoryProvider.getFactory());

%>



<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
    <%@include file="components/common_css_js.jsp"%>
</head>
<style>
    body{
        background: url("img/bg.png");
        background-repeat: no-repeat;
        background-size: cover;

    }
    .admin .card{
         border: 1px solid #673ab7;
    }
    .admin .card:hover{
      background: #e2e2e2;
        cursor: pointer;
    }
</style>
<body>
  <%@include file="components/navbar.jsp"%>
  <div class="container admin">
      <div class="container-fluid mt-3">
          <%@include file="components/message.jsp"%>
      </div>
      <div class="row mt-3">
          <!-- First col-->
          <div class="col-md-4">
              <div class="card">
                  <div class="card-body text-center">
                      <div class="container">
                          <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/users.png" alt="user_icon"/>
                      </div>
                      <h1><%=m.get("userCount")%></h1>
                      <h1 class="text-uppercase text-muted">Users</h1>
                  </div>
              </div>

          </div>
          <!-- Second col-->
          <div class="col-md-4">
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
      <div class="row mt-3">
          <div class="col-md-6">
              <div class="card" data-toggle="modal" data-target="#category-Modal">
                  <div class="card-body text-center">
                      <div class="container">
                          <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/keys.png" alt="user_icon"/>
                      </div>
                      <p class="mt-2">Click here to add new category</p>
                      <h1 class="text-uppercase text-muted">Add Category</h1>
                  </div>
              </div>

          </div>
          <div class="col-md-6">
              <div class="card" data-toggle="modal" data-target="#product-Modal">
                  <div class="card-body text-center">
                      <div class="container">
                          <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/plus.png" alt="user_icon"/>
                      </div>
                      <p class="mt-2">Click here to add new product</p>
                      <h1 class="text-uppercase text-muted">Add Products</h1>
                  </div>
              </div>

          </div>
      </div>
  </div>
  <!-- Add Category Model-->
  <!-- Modal -->
  <div class="modal fade" id="category-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
          <div class="modal-content">
              <div class="modal-header text-white" style="background: #673ab7;">
                  <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                  </button>
              </div>
              <div class="modal-body">
                  <form action="ProductOperationServlet" method="post">
                      <input type="hidden" name="Operation" value="addCategory">
                      <div class="form-group">
                          <input type="text" class="form-control" placeholder="Enter Category Title" name="catTitle" required/>
                      </div>
                      <div class="form-group">
                          <textarea style="height: 200px;" class="form-control" placeholder="Enter Category Description" name="catDesc" required></textarea>
                      </div>
                      <div class="container text-center">
                          <button class="btn btn-outline-success">Add Category</button>
                      </div>
                  </form>
              </div>
              <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
          </div>
      </div>
  </div>

  <!-- Product Model-->

  <div class="modal fade" id="product-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
          <div class="modal-content">
              <div class="modal-header text-white" style="background: #673ab7;">
                  <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                  </button>
              </div>
              <div class="modal-body">
                  <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                      <input type="hidden" name="Operation" value="addProduct"/>
                      <div class="form-group">
                          <input type="text" class="form-control" placeholder="Enter Product Title" name="pName" required/>
                      </div>

                      <div class="form-group">
                          <textarea style="height: 100px;" class="form-control" placeholder="Enter Product Description" name="pDesc" required></textarea>
                      </div>

                      <div class="form-group">
                          <input type="number" class="form-control" placeholder="Enter Product Price" name="pPrice" required/>
                      </div>
                      <div class="form-group">
                          <input type="number" class="form-control" placeholder="Enter Product Discount" name="pDiscount" required/>
                      </div>
                      <div class="form-group">
                          <input type="number" class="form-control" placeholder="Enter Product Quantity" name="pQuantity" required/>
                      </div>



                      <div class="form-group">
                          <label for="select">Product Categories:</label>
                          <select id="select" name="catId" class="form-control">
                              <%
                                  for (Category c:list){

                                %>
                              <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
                              <%
                                  }
                              %>

                          </select>
                      </div>
                      <div class="form-group">
                          <label for="file">Choose Product Image:</label>
                          <br>
                          <input type="file" id="file" placeholder="Enter Product Photo" name="pPic" required/>
                      </div>
                      <div class="container text-center">
                          <button class="btn btn-outline-success">Add Product</button>
                      </div>
                  </form>
              </div>
              <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
          </div>
      </div>
  </div>
<%@include file="components/common_modals.jsp"%>
</body>
</html>
