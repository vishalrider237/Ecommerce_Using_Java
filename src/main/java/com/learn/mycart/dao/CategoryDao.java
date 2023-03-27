package com.learn.mycart.dao;

import com.learn.mycart.entities.Category;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class CategoryDao {
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }

    // Saves the Category to DB
    public int SaveCategory(Category cat){
        Session session=this.factory.openSession();
        Transaction tx= session.beginTransaction();
       int catId= (int) session.save(cat);
        tx.commit();
        session.close();
        return catId;

    }
    public List<Category> getCategory(){
        Session session=this.factory.openSession();
        Query query=session.createQuery("from Category");
        List<Category>list=query.list();
        return list;
    }
    public Category getCategoryById(int cid){
        Category cat=null;
        try {
            Session session=this.factory.openSession();
             cat=session.get(Category.class,cid);
            session.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return cat;
    }
}
