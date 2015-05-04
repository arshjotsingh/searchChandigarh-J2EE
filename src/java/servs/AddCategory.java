/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servs;

import bean.Category;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author aa
 */
public class AddCategory extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        
        try
        {
         
            String catname=request.getParameter("categoryname");
            String desc=request.getParameter("desc");
            
            bean.Category c=new Category();
            c.setCatname(catname);
            c.setDesc(desc);
            
            Configuration cfg=new Configuration().configure("hibernate.cfg.xml");
            SessionFactory factory = cfg.buildSessionFactory();
            Session s = factory.openSession();
            Transaction tx = s.beginTransaction();
            s.save(c);
            tx.commit();
            request.getSession(true).setAttribute("msg", "msg");
            s.close();
            factory.close();
            //==== if success then redirect to success page
                request.getSession(false).setAttribute("info", "Your Record is Added Successfully");
                response.sendRedirect("AdminPanel/AdminPanelSuccess.jsp");
            
        }
        catch(Exception ex)
        {
            System.out.println("ERROR STARTS FROM HERE:"+ex); 
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
