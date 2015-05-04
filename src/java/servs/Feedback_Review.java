/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servs;

import bean.Feedback;
import bean.Review;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class Feedback_Review extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        String action=request.getParameter("action");

        switch(action)
        {
            case "Submit Feedback":
            {
                try
                        {
                            String name=request.getParameter("fname");
                            String subject=request.getParameter("fsub");
                            String ftext=request.getParameter("ftxt");
                           
                            bean.Feedback f=new Feedback();
                            f.setFusr(name);
                            f.setFsub(subject);
                            f.setFtext(ftext);
                            
                            Configuration cfg=new Configuration();
                            SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
                            Session s=sessionFactory.openSession();
                            Transaction transaction=s.beginTransaction();
                            s.save(f);
                            transaction.commit();
                            s.close();
                            sessionFactory.close();
                            
                            response.getWriter().print("Thankyou for your feedback!");
                            
                        }
        
                        catch(Exception ex)
                        {
                            System.out.println(ex);      
                        }
                break;
            }
            
            case "Submit Review":
            {
                try
                {
                    String rtext=request.getParameter("rtext");
                    int recid=Integer.parseInt(request.getParameter("recid"));
                    String uname=request.getSession(false).getAttribute("wname").toString();
                    int uid=Integer.parseInt(request.getSession(false).getAttribute("wid").toString());
                    
                    System.out.println(rtext);
                    bean.Review r=new Review();
                    r.setRevtext(rtext);
                    r.setRevusrname(uname);
                    r.setRevusr(uid);
                    r.setRecid(recid);
                    Date dateobj = new Date();
                    r.setPostdate(dateobj);
                    r.setVisible(false);
                    
                    
                    Configuration cfg=new Configuration();
                    SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
                    Session s=sessionFactory.openSession();
                    Transaction transaction=s.beginTransaction();
                    s.save(r);
                    transaction.commit();
                    s.close();
                    sessionFactory.close();

                    response.getWriter().print("Thankyou for your review!");

                }

                catch(Exception ex)
                {
                    System.out.println(ex);      
                }
                break;
            }
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
