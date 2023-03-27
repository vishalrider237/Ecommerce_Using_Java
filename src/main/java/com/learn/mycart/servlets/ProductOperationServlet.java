package com.learn.mycart.servlets;

import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.dao.ProductDao;
import com.learn.mycart.entities.Category;
import com.learn.mycart.entities.Product;
import com.learn.mycart.helper.FactoryProvider;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;

@WebServlet(name = "ProductOperationServlet",value = "/ProductOperationServlet")
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            String op=request.getParameter("Operation");
            if (op.trim().equals("addCategory")){
                //Fetching Categories Data
                String title=request.getParameter("catTitle");
                  String description=request.getParameter("catDesc");
                Category category=new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);

                // Category Database save
                CategoryDao categoryDao=new CategoryDao(FactoryProvider.getFactory());
               int catId= categoryDao.SaveCategory(category);
             //  out.println("Category Saved");
                HttpSession httpSession= request.getSession();
                httpSession.setAttribute("message","Category Added Successfully!: "+catId);
                response.sendRedirect("admin.jsp");
                return;


            } else if (op.trim().equals("addProduct")) {

                String pName=request.getParameter("pName");
                String pDesc=request.getParameter("pDesc");
                int pPrice= Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount= Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity= Integer.parseInt(request.getParameter("pQuantity"));
                int catId= Integer.parseInt(request.getParameter("catId"));
                Part part= request.getPart("pPic");

                Product p=new Product();
                p.setpName(pName);
                p.setpDesc(pDesc);
                p.setpPrice(pPrice);
                p.setpDisc(pDiscount);
                p.setpQuantity(pQuantity);
                p.setpPhoto(part.getSubmittedFileName());

                // Get Category By Id
               CategoryDao categoryDao=new CategoryDao(FactoryProvider.getFactory());
               Category cid=categoryDao.getCategoryById(catId);
               p.setCategory(cid);
             // Product  save To Db
                ProductDao productDao=new ProductDao(FactoryProvider.getFactory());
                productDao.saveProduct(p);

                // Pic Upload in a folder
                // Find Path to Upload Photo
                String path=request.getRealPath("img")+ File.separator+"products"+File.separator+part.getSubmittedFileName();
              //  System.out.println(path);

             // Uploading Code...
                try {
                    FileOutputStream fos=new FileOutputStream(path);
                    InputStream fis=part.getInputStream();
                    // Reading Data
                    byte [] data=new byte[fis.available()];
                    fis.read(data);
                    // Writing Data
                    fos.write(data);
                    fos.close();
                }catch (Exception e){
                    e.printStackTrace();
                }

             //   out.println("Product Save Success");
                HttpSession httpSession= request.getSession();
                httpSession.setAttribute("message","Product Added Successfully!:");
                response.sendRedirect("admin.jsp");
                return;

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
