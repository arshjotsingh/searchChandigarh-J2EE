/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servs;

import bean.Email;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.imageio.ImageIO;
import javax.imageio.stream.ImageInputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
@MultipartConfig(location="/tmp", fileSizeThreshold=1024*1024, 
    maxFileSize=1024*1024*5, maxRequestSize=1024*1024*5*5)
public class EditRecord extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
       String param=request.getParameter("action");
       
       switch(param)
       {
           case "Update" :
           {
               try
                {
                    //=== to update record table
                    int recordid=Integer.parseInt(request.getParameter("recordid"));
                    String recordname=request.getParameter("recordname");
                    String desc=request.getParameter("desc");
                    String tags=request.getParameter("tags");
                    
                    //=== to update address table
                    int addid=Integer.parseInt(request.getParameter("addid"));
                    String street=request.getParameter("street1");
                    String area=request.getParameter("area");
                    String landmark=request.getParameter("landmark");
                    if(landmark==null)
                    {
                        landmark="";
                    }
                    String city=request.getParameter("city");
                    String state=request.getParameter("state");
                    String country=request.getParameter("country");
                    String zip=request.getParameter("zip");
                    String contact1=request.getParameter("contact1");
                    if(contact1==null)
                    {
                        contact1="";
                    }
                    String contact2=request.getParameter("contact2");
                    if(contact2==null)
                    {
                        contact2="";
                    }
                    String contact3=request.getParameter("contact3");
                    if(contact3==null)
                    {
                        contact3="";
                    }
                    
                    //=== to update Email table
                    String email1=request.getParameter("email1");
                    String emailid1=request.getParameter("emailid1");
                    String email2=request.getParameter("email2");
                    String emailid2=request.getParameter("emailid2");
                    String email3=request.getParameter("email3");
                    String emailid3=request.getParameter("emailid3");
                    String website=request.getParameter("website");
                    
                    String webid=request.getParameter("webid");
                    
                    System.out.println(email1+emailid1);
                    System.out.println(email2+emailid2);
                    System.out.println(email3+emailid3);
                    System.out.println(website+webid);
                    
                    int count=0;

                    if(email1!=null)
                    {
                        count=count+1;
                    }
                    
                    if(email2!=null)
                    {
                        count=count+1;
                    }
                    if(email3!=null)
                    {
                        count=count+1;
                    }
                   
                    
                    System.out.println("THIS IS COUNT"+count);
                    
                    //=== to Start Connection
                    Configuration cfg=new Configuration();
                    SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
                    Session s=sessionFactory.openSession();
                    Transaction transaction=s.beginTransaction();
                    
                    //=== UPDATE RECORD TBL
                    
                    String recsql="UPDATE bean.Record"
                            + " SET recname=:name,"
                            + " description=:descp,"
                            + " tags=:tags "
                            + " WHERE recid=:id";
                    
                    Query q1=s.createQuery(recsql);
                    q1.setParameter("name",recordname);
                    q1.setParameter("descp",desc);
                    q1.setParameter("tags",tags);
                    q1.setParameter("id",recordid);
                    
                    String addsql="UPDATE bean.Address"
                            + " SET street=:street,"
                            + " area=:area,"
                            + " landmark=:landmark,"
                            + " city=:city, "
                            + " state=:state,"
                            + " zipcode=:zipcode,"
                            + " fone1=:fone1,"
                            + " fone2=:fone2,"
                            + " fone3=:fone3 "
                            + " WHERE addid=:id";
                    
                    Query q2=s.createQuery(addsql);
                    q2.setParameter("street",street);
                    q2.setParameter("area",area);
                    q2.setParameter("landmark",landmark);
                    q2.setParameter("city",city);
                    q2.setParameter("state",state);
                    q2.setParameter("zipcode",zip);
                    q2.setParameter("fone1",contact1);
                    q2.setParameter("fone2",contact2);
                    q2.setParameter("fone3",contact3);
                    q2.setParameter("id",addid);
                    
                   
                    
                    if(website!=null)
                    {
                            String emailsql1="UPDATE bean.Email"
                            + " SET emailadd = :emailadd"
                            + " WHERE emailID = :id";
                            Query q3=s.createQuery(emailsql1);
                            q3.setParameter("emailadd",website);
                            q3.setParameter("id",webid);
                            int result=q3.executeUpdate();
                            q3.executeUpdate();
                    }
                    
                    
                    switch(count)
                    {
                        case 1:
                        {
                            String emailsql1="UPDATE bean.Email"
                            + " SET emailadd = :emailadd"
                            + " WHERE emailID = :id";
                            Query q3=s.createQuery(emailsql1);
                            q3.setParameter("emailadd",email1);
                            q3.setParameter("id",emailid1);
                            int result=q3.executeUpdate();
                            break;
                        }
                        case 2:
                        {
                            String emailsql1="UPDATE bean.Email"
                            + " SET emailadd = :emailadd"
                            + " WHERE emailID = :id";
                            Query q3=s.createQuery(emailsql1);
                            q3.setParameter("emailadd",email1);
                            q3.setParameter("id",emailid1);
                            
                             String emailsql2="UPDATE bean.Email"
                            + " SET emailadd = :emailadd"
                            + " WHERE emailID = :id";
                            Query q4=s.createQuery(emailsql2);
                            q4.setParameter("emailadd",email2);
                            q4.setParameter("id",emailid2);
                            
                            q4.executeUpdate();
                            q3.executeUpdate();
                            break;
                        }
                        case 3:
                        {
                            String emailsql3="UPDATE bean.Email"
                            + " SET emailadd = :emailadd"
                            + " WHERE emailID = :id";
                            Query q3=s.createQuery(emailsql3);
                            q3.setParameter("emailadd",email1);
                            q3.setParameter("id",emailid1);
                            
                             String emailsql2="UPDATE bean.Email"
                            + " SET emailadd = :emailadd"
                            + " WHERE emailID = :id";
                            Query q4=s.createQuery(emailsql2);
                            q4.setParameter("emailadd",email2);
                            q4.setParameter("id",emailid2);
                            
                            String emailsql4="UPDATE bean.Email"
                             + " SET emailadd = :emailadd"
                            + " WHERE emailID = :id";
                            Query q5=s.createQuery(emailsql4);
                            q5.setParameter("emailadd",email3);
                            q5.setParameter("id",emailid3);
                            
                            q5.executeUpdate();
                            q4.executeUpdate();
                            q3.executeUpdate();
                            break;
                        }
                    }
                    
                    
                    
                    int result1=q1.executeUpdate();
                    int result2=q2.executeUpdate();
                    if(result1>0 && result2>0)
                    {
                        System.out.println("Update successfuly");
                    }
                    
                    transaction.commit();
                    s.close();
                    
                    //==== if success then redirect to success page
                request.getSession(false).setAttribute("info", "Your Record is Updated Successfully");
                response.sendRedirect("AdminPanel/AdminPanelSuccess.jsp");
                    
                }
               catch(Exception ex)
               {
                   System.out.println("Exception is HERE::::"+ex.getMessage());
               }
               
               break;
           }
           
           case "Update Category" :
           {
               int recordid=Integer.parseInt(request.getSession(false).getAttribute("recid").toString());
               int categoryid=Integer.parseInt(request.getParameter("categorySelect"));
                try
                {
                    Configuration cfg=new Configuration();
                    SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
                    Session s=sessionFactory.openSession();
                    Transaction transaction=s.beginTransaction();
                    String sql="UPDATE bean.Record"
                            + " SET catid=:catid"
                            + " WHERE recid=:id";
                    
                    Query query=s.createQuery(sql);
                    query.setParameter("catid",categoryid);
                    query.setParameter("id",recordid);
                   
                    int result=query.executeUpdate();
                    
                    if(result>0)
                    {
                        System.out.println("Update successful");
                    }
                    
                    transaction.commit();
                    s.close();
                    
                     //==== if success then redirect to success page
                request.getSession(false).setAttribute("info", "Your Record is Updated Successfully");
                response.sendRedirect("AdminPanel/AdminPanelSuccess.jsp");
                }
                catch(Exception ex)
                {
                    System.out.println(ex);
                }
               break;
           }
           
           case "Submit Email/Website" :
           {
               int addid=Integer.parseInt(request.getSession(false).getAttribute("addressid").toString());
               bean.Email e=new Email();
               e.setEmailadd(request.getParameter("email"));
               try
                {
                    Configuration cfg=new Configuration();
                    SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
                    Session s=sessionFactory.openSession();
                    Transaction transaction=s.beginTransaction();
                    
                    
                }
               catch(Exception ex)
                {
                    System.out.println(ex);
                }
               break;
           }
           case "Delete" :
           {
               try
                {
                    Configuration cfg=new Configuration();
                    SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
                    Session s=sessionFactory.openSession();
                    Transaction transaction=s.beginTransaction();
                    int addid=Integer.parseInt(request.getSession(false).getAttribute("addressid").toString());

                    String sql="DELETE FROM bean.Address"
                            + " WHERE addid=:id";
                    
                    Query query=s.createQuery(sql);
                    query.setParameter("id",addid);
                   
                    int result=query.executeUpdate();
                    
                    if(result>0)
                    {
                        System.out.println("Delete successful");
                    }
                    
                    transaction.commit();
                    s.close();
                    
                    //===== Response=====
                    request.getSession(false).setAttribute("info", "Your Record is Deleted Successfully");
                    response.sendRedirect("AdminPanel/AdminPanelSuccess.jsp");
                    
                }
                    catch(Exception ex)
                {
                    System.out.println(ex.getMessage());
                }
               
               break;
           }
           
           case "Submit Image" :
           {
               int recordid=Integer.parseInt(request.getSession(false).getAttribute("recid").toString());
               int addid=Integer.parseInt(request.getSession(false).getAttribute("addressid").toString());
               String path="";
               String pathfilename="";

               
               //=== saving image to RecordPhotos folder
               
               long filesize=request.getPart("recimage").getSize();
                            
                if(filesize>0)
                {
                    Part part=request.getPart("recimage");
                    InputStream is=part.getInputStream();
                    ImageInputStream iis=ImageIO.createImageInputStream(is);
                    BufferedImage bimg=ImageIO.read(iis);

                    Image scaledimg=null;

                    if(bimg.getHeight()>350 ||bimg.getWidth()>500)
                    {
                        System.out.println("Scaled");

                        //===ratio fr 800x600
                        double ratio=1.8;
                        int newwidth=(int) (bimg.getWidth()/ratio);
                        int newheight=(int)(bimg.getHeight()/ratio);

                         //=== This function returns an Image object of desired size or ratio
                        scaledimg=bimg.getScaledInstance(newwidth,newheight, Image.SCALE_SMOOTH);

                        //=== draw Image into Buffered Image=
                        BufferedImage bimage = new BufferedImage(scaledimg.getWidth(null), scaledimg.getHeight(null), BufferedImage.TYPE_INT_RGB);
                        Graphics2D g2d=bimage.createGraphics();
                        g2d.drawImage(scaledimg, 0, 0,null);
                        g2d.dispose();

                        //=== saving image to folder
                        path="/home/aa/NetBeansProjects/searchChd/web/RecordPhotos";
                        pathfilename=path+File.separator+"img_"+recordid+".jpg";
                        File f=new File(pathfilename);
                        ImageIO.write(bimage,"jpeg",f);
                    }
                    else
                    {
                        //=== saving image to folder
                        path="/home/aa/NetBeansProjects/searchChd/web/RecordPhotos";
                        pathfilename=path+File.separator+"img_"+recordid+".jpg";
                        File f=new File(pathfilename);
                        ImageIO.write(bimg,"jpeg",f);
                    }
                }
               
                //==== save imagepath to Address Table
               
                try
                {
                    Configuration cfg=new Configuration();
                    SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
                    Session s=sessionFactory.openSession();
                    Transaction transaction=s.beginTransaction();
                    String sql="UPDATE bean.Address"
                            + " SET imagepath=:imgpath"
                            + " WHERE addid=:id";
                    
                    Query query=s.createQuery(sql);
                    query.setParameter("imgpath",pathfilename);
                    query.setParameter("id",addid);
                   
                    int result=query.executeUpdate();
                    
                    if(result>0)
                    {
                        System.out.println("Update successful");
                    }
                    
                    transaction.commit();
                    s.close();
                    
                     //==== if success then redirect to success page
                    request.getSession(false).setAttribute("info", "Your Image is Updated Successfully");
                    response.sendRedirect("AdminPanel/AdminPanelSuccess.jsp");
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
