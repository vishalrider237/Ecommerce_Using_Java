package com.learn.mycart.dao;

import com.learn.mycart.entities.Order;
import com.learn.mycart.entities.Product;
import com.learn.mycart.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import javax.servlet.http.HttpSession;
import java.util.List;

public class OrderDao {
    private SessionFactory factory;

    public OrderDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveOrderProduct(Order order){
        boolean f=false;
        try {
            Session session=this.factory.openSession();
            Transaction tx= session.beginTransaction();

            session.save(order);
            tx.commit();

            session.close();
            f=true;

        }catch (Exception e){
            e.printStackTrace();
            f=false;
        }
        return f;
    }
}
