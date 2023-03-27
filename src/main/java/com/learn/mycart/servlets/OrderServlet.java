package com.learn.mycart.servlets;

import com.learn.mycart.dao.OrderDao;
import com.learn.mycart.entities.Order;
import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "OrderServlet",value = "/OrderServlet")
public class OrderServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            OrderDao orderDao=new OrderDao(FactoryProvider.getFactory());
            Order order=new Order();
            order.setEmail(request.getParameter("Oemail"));
            order.setName(request.getParameter("Oname"));
            order.setPhoneNumber(request.getParameter("Ophone"));
            order.setShipAddress(request.getParameter("Oaddress"));
            orderDao.saveOrderProduct(order);
            HttpSession httpSession= request.getSession();
            httpSession.setAttribute("message","Order Successful!!");
            response.sendRedirect("checkout.jsp");


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
