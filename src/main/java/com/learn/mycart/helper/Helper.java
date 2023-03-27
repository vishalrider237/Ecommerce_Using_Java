package com.learn.mycart.helper;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import java.util.HashMap;

public class Helper {
    public static String get10Words(String desc){
        String str[]=desc.split(" ");
        if (str.length>10){
            String res="";
            for (int i=0;i< 10;i++){
                res+=str[i]+" ";
            }
            return (res+"...");

        }else{
            return desc +"...";
        }
    }
    public static HashMap<String,Long> getCounts(SessionFactory factory){
        Session session= factory.openSession();
        String q1="Select count(*) from User";
        String q2="Select count(*) from Product";
        Query query= session.createQuery(q1);
        Query query1=session.createQuery(q2);
        Long userCount= (Long) query.list().get(0);
        Long productCount= (Long) query1.list().get(0);
        HashMap<String,Long>map=new HashMap<>();
        map.put("userCount",userCount);
        map.put("productCount",productCount);
        session.close();
     return map;
    }
}
