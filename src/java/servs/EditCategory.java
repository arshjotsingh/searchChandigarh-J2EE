package servs;

import java.io.IOException;
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

public class EditCategory extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       
        
        String action=request.getParameter("action");
        
        switch(action){
            
            case "Update":
            {
                int catid=Integer.parseInt(request.getParameter("categoryid"));
                String catname=request.getParameter("categoryname").toString();
                String desc=request.getParameter("desc").toString();
                
              
                
                try
                {
                    Configuration cfg=new Configuration();
                    SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
                    Session s=sessionFactory.openSession();
                    Transaction transaction=s.beginTransaction();
                    
                    String sql="UPDATE bean.Category"
                            + " SET catname=:name,"
                            + "categorydescription=:descp "
                            + "WHERE catid=:id";
                    
                   
                    Query query=s.createQuery(sql);
                    query.setParameter("name",catname);
                    query.setParameter("descp",desc);
                    
                    query.setParameter("id",catid);
                    
                   
                    int result=query.executeUpdate();
                    
                    if(result>0)
                    {
                        System.out.println("Update successfull");
                    }
                    
                    transaction.commit();
                    s.close();
                    
                    
                }
                
                catch(Exception ex)
                {
                    System.out.println(ex);
                }
                finally 
                {
                    response.sendRedirect("/searchChd/AdminPanel/EditCategory.jsp");
                }
                
                break;
            }
            
            case "Delete":
            {
                System.out.println("In delete");
                
                int catid=Integer.parseInt(request.getParameter("cid"));
                System.out.println("Category ID"+catid);
                try
                {
                    Configuration cfg=new Configuration();
                    SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
                    Session s=sessionFactory.openSession();
                    Transaction transaction=s.beginTransaction();
                    
                    String sql="DELETE from bean.Category "
                            + "WHERE catid=:id";
                    
                    Query query=s.createQuery(sql);
                    query.setParameter("id",catid);
                    int result=query.executeUpdate();
                    
                    if(result>0)
                    {
                        System.out.println("Delete successfull");
                    }
                    
                    transaction.commit();
                    s.close();
                    
                    
                }
                
                catch(Exception ex)
                {
                    System.out.println(ex);
                }
                finally 
                {
                    response.sendRedirect("/searchChd/AdminPanel/EditCategory.jsp");
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
