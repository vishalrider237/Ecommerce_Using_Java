package com.learn.mycart.servlets;

import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RegistrationServlet",value = "/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setContentType("text/html");
        try(PrintWriter out=response.getWriter()) {
            try {
                String userName=request.getParameter("user_name");
                String userEmail=request.getParameter("user_email");
                String userPassword=request.getParameter("user_password");
                String userPhone=request.getParameter("user_phone");
                String userAddress=request.getParameter("user_address");

                // Validation

                if (userName.isEmpty()){
                    out.println("User Name is Empty");
                    return;
                }

                // Creating User Object to Store Data
                User user=new User(userName,userEmail,userPassword,userPhone,"default.jpg",userAddress,"normal");
                Session hibernateSession= FactoryProvider.getFactory().openSession();
                Transaction tx= hibernateSession.beginTransaction();
                int userId=(int)hibernateSession.save(user);

                tx.commit();
               hibernateSession.close();
                HttpSession httpSession= request.getSession();
                httpSession.setAttribute("message","Registration Successful!! UserId is "+userId);
                response.sendRedirect("register.jsp");
                return;
            }catch (Exception e){
                e.printStackTrace();
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("error_message", "E-mail is already register!! Plz use Different E-mail - " + e.getMessage());
                response.sendRedirect("register.jsp");
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
