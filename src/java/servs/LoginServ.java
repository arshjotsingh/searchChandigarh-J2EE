
package servs;

import bean.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class LoginServ extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       
     
       PrintWriter out=response.getWriter();
       
       
        try
        {
            String username= request.getParameter("username");
            String password=request.getParameter("password");

            Configuration cfg=new Configuration().configure("hibernate.cfg.xml");
            SessionFactory factory = cfg.buildSessionFactory();
            Session s = factory.openSession();
            Transaction tx = s.beginTransaction();

            String sql="From bean.User where uname=:name and upass=:pwd";

            Query q=s.createQuery(sql);
            q.setParameter("name", username);
            q.setParameter("pwd", password);

            List li=q.list();
            Iterator it=li.iterator();
            boolean flag=it.hasNext();
            if(flag==true)
            {
                HttpSession session=request.getSession(true);
                bean.User u=(bean.User)it.next();
                System.out.println(u.getUname()+" "+u.getUpass());
                session.setAttribute("wname", u.getUname());
                session.setAttribute("wid", u.getUid());
                
                if(u.getUname().equals("arsh"))
                {
                    response.sendRedirect("AdminPanel/AdminPanel.jsp");
                }
                else
                {
                    response.sendRedirect("UserPanel/UserPanelWelcome.jsp");
                }
                

            }
            else if(flag==false)
            {
                
                response.sendRedirect("LoginPage.jsp?d=8472");
            }
            tx.commit();
            s.close();
        }
        catch(Exception ex)
        {
            System.out.println("ERROR COMES HERE:"+ex);
            response.sendRedirect("LoginPage.jsp?d=8472");
            
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
