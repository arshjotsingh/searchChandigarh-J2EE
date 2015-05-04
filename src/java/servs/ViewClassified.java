/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servs;

import static com.sun.xml.fastinfoset.alphabet.BuiltInRestrictedAlphabets.table;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
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

public class ViewClassified extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        try
                {
                    PrintWriter out=response.getWriter();
                    
                    int catid=Integer.parseInt(request.getParameter("c"));
                    boolean imgcheck=Boolean.valueOf(request.getParameter("i"));
                    
       
                    Configuration cfg=new Configuration().configure("hibernate.cfg.xml");
                    SessionFactory factory = cfg.buildSessionFactory();
                    Session s = factory.openSession();
                    Transaction tx = s.beginTransaction();
                    
                    Query query;
                    if(catid>0 && imgcheck==false)
                    {
                    
                        String sql1="Select c.title, c.postdate,c.cid"
                                     + " From bean.Classified c"
                                      + " where c.catid=:id"
                                      + " order by c.postdate desc";

                         query= s.createQuery(sql1);
                        query.setParameter("id", catid);
                        
                    }
                    
                    else if(catid==0 && imgcheck==false)
                    {
                        String sql1="Select c.title, c.postdate,c.cid"
                                     + " From bean.Classified c"
                                      + " order by c.postdate desc";

                         query= s.createQuery(sql1);
                    }
                   
                    else if(catid>0 && imgcheck==true)
                    {
                        String sql1="Select c.title, c.postdate,c.cid"
                                     + " From bean.Classified c"
                                + " where c.img1 is NOT NULL and "
                                + " c.catid=:id"
                                      + " order by c.postdate desc";

                         query= s.createQuery(sql1);
                         query.setParameter("id", catid);
                    }
                    else
                    {
                         String sql1="Select c.title, c.postdate,c.cid"
                                     + " From bean.Classified c"
                                + " where c.img1 is NOT NULL"
                                      + " order by c.postdate desc";

                         query= s.createQuery(sql1);
                    }
                            
                            
                        
                        List<Object[]> list=query.list();
                        Iterator itr=list.iterator();

                        String temp="";
                        String temptday="";

                        if(itr.hasNext())
                        {
                            out.print("<div>");
                            while(itr.hasNext())
                            {
                                Object[] obj=(Object[])itr.next();

                                Date todaydate=new Date();
                                Date clsdate=(Date)obj[1];
                                String cdate=clsdate.getDate()+clsdate.getMonth()+clsdate.getYear()+"";
                                String rdate=todaydate.getDate()+todaydate.getMonth()+todaydate.getYear()+"";

                                if(cdate.equals(rdate))
                                {
                                    if(cdate.equals(temptday))
                                    {

                                    }
                                    else
                                    {
                                        out.print("<table id='tbl' style='border: #ccc 1px solid;'><tr><td style='border-bottom: #ccc 1px solid;'>");
                                        out.print("Posted Today");
                                        out.print("</td></tr>");

                                    }

                                            out.print("<tr><td><a href='ViewClassified.jsp?q="+obj[2].toString()+"'>"+obj[0].toString()+"</a></td></tr>");
                                    temptday=cdate;
                                }
                                else
                                {

                                String[] parts=new String[1];

                                parts=obj[1].toString().split(" ");

                                    if(parts[0].equals(temp))
                                    {

                                    }
                                else
                                    {
                                        out.print("</table><table id='tbl'  style='border: #ccc 1px solid;'><tr><td style='border-bottom: #ccc 1px solid;'>");
                                        out.print("Posted on : "+parts[0]);
                                        out.print("</td></tr>");
                                    }


                                            out.print("<tr><td ><a href='ViewClassified.jsp?q="+obj[2].toString()+"'>"+obj[0].toString()+"</a></td></tr>");

                                 temp=parts[0];
                                }
                            }
                          out.print("</table>");
                        }
                        out.print("</div>");

                        tx.commit();
                        s.close();
                        factory.close();


                } 

                catch(Exception ex)
                {
                    System.out.println(ex.getMessage());
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
