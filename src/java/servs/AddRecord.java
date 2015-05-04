/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servs;

import bean.Record;
import java.io.IOException;
import java.io.PrintWriter;
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

public class AddRecord extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println(request.getQueryString());
        String action=request.getParameter("qry");
        switch(action)
        {
            case "ajx":
            {
                try
                {
                    String str=request.getParameter("q")+"%";
                    PrintWriter out=response.getWriter();

                    Configuration cfg=new Configuration().configure("hibernate.cfg.xml");
                    SessionFactory factory = cfg.buildSessionFactory();
                    Session s = factory.openSession();
                    Transaction tx = s.beginTransaction();

                    String sql="From bean.Record where recname like :name";
                    Query q=s.createQuery(sql);
                    q.setParameter("name", str);
                    List list=q.list();
                    Iterator it=list.iterator();
                    out.print("<datalist>");
                    while(it.hasNext())
                    {
                        bean.Record obj=(bean.Record)it.next();
                        String b="'"+obj.getRecname()+"'";
                        out.print("<option value="+b+">"+obj.getRecname()+"</option>");
                    }
                    out.print("</datalist>");
                    tx.commit();
                    s.close();
                    factory.close();

                }
                catch(Exception ex)
                {
                    System.out.println("ERROR STARTS FROM HERE:"+ex); 
                }
                
                break;
            }
            
            case "Submit" :
            {
                int catid=Integer.parseInt(request.getParameter("categorySelect"));
                String recname=request.getParameter("recordname");
                String desc=request.getParameter("desc");
                String tags=request.getParameter("tags");

                bean.Record r=new Record();
                r.setCatid(catid);
                r.setDesc(desc);
                r.setRecname(recname);
                r.setTags(tags);
                
                Configuration cfg=new Configuration().configure("hibernate.cfg.xml");
                SessionFactory factory = cfg.buildSessionFactory();
                Session s = factory.openSession();
                Transaction tx = s.beginTransaction();
                s.save(r);
                tx.commit();
                factory.close();
                
                //==== if success then redirect to success page
                request.getSession(false).setAttribute("info", "Your Record is Added Successfully");
                response.sendRedirect("AdminPanel/AdminPanelSuccess.jsp");
                
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
