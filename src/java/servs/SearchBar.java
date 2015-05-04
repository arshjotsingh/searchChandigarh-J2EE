/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servs;

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

public class SearchBar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        try
        {
         
           
            String str=request.getParameter("q");
            String cat=request.getParameter("c");
            String area=request.getParameter("a");
            
            
            PrintWriter out=response.getWriter();
           
            Configuration cfg=new Configuration().configure("hibernate.cfg.xml");
            SessionFactory factory = cfg.buildSessionFactory();
            Session s = factory.openSession();
            Transaction tx = s.beginTransaction();
            
            String sql="From bean.Record";
            Query q=s.createQuery(sql);
            
                if(!cat.isEmpty() && area.isEmpty())
                {
                    String strnew="%"+str+"%";
                    int catid=Integer.parseInt(cat);
                     sql="Select recname From bean.Record where recname like :name and catid=:catid";
                    q=s.createQuery(sql);
                    q.setParameter("name", strnew);
                    q.setParameter("catid", catid);
                }
                
                else if(!area.isEmpty() && cat.isEmpty())
                    
                {
                    String areanew="%"+area+"%";
                    sql="Select distinct r.recname"
                            + " From bean.Record r,bean.Address a"
                           + " where r.recid=a.recid"
                           + " and a.area like :name";
                        q=s.createQuery(sql);
                        q.setParameter("name", areanew);
                }
                
                else if(!area.isEmpty() && !cat.isEmpty())
                {
                    String areanew="%"+area+"%";
                    int catid=Integer.parseInt(cat);
                    System.out.println(catid);
                    sql="Select distinct r.recname"
                            + " From bean.Record r,bean.Address a"
                           + " where r.recid=a.recid"
                           + " and r.catid =:catid"
                            + " and a.area like :name";
                        q=s.createQuery(sql);
                        q.setParameter("catid", catid);
                        q.setParameter("name", areanew);
                }
                else
                {
                    sql="Select recname From bean.Record";
                    q=s.createQuery(sql);
                }

                List list=q.list();
                Iterator it=list.iterator();
                out.print("<datalist>");
                out.print("<option>---RECORDS---</option>");
                while(it.hasNext())
                {
                    Object rcname=it.next();
                    out.print("<option value='"+rcname+"'>"+rcname+"</option>");
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
