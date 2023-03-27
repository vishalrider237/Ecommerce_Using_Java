package com.learn.mycart.servlets;

import com.learn.mycart.dao.UserDao;
import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet",value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            String email=request.getParameter("email");
            String password=request.getParameter("password");

            // Validations
            if (email==null || password==null){
                out.println("You have missed some field!! plz fill again");
                return;
            }

            // Authentications
           UserDao userDao= new UserDao(FactoryProvider.getFactory());
           User user= userDao.getUserByEmailAndPassword(email,password);
      //      System.out.println(user);
            HttpSession httpSession= request.getSession();
            if (user==null){
                httpSession.setAttribute("message","Invalid details!! Try Again");
                response.sendRedirect("login.jsp");
                return;
            }
            else{
                out.println("<h1>Welcome "+user.getUserName()+"</h1>");
                 // Login
                httpSession.setAttribute("current_user",user);
                // User Login - admin.jsp
                if (user.getUserType().equals("admin")){
                    response.sendRedirect("admin.jsp");
                } else if (user.getUserType().equals("normal")) {
                    //User Login - normal.jsp
                    response.sendRedirect("normal.jsp");

                }
                else{
                    out.println("We have not identified user type");
                }

            }

        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req,resp);
    }
}
