
package servs;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
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

public class PostInfo extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        PrintWriter out=response.getWriter();
            
                String action=request.getParameter("action");
                
                System.out.println("STRING PARAMETER::"+action);
                
                switch(action)
                {
                    case "getRecord":
                        try
                        {
                            System.out.println("inside frm1");
                            
                            int  q = Integer.parseInt(request.getParameter("q"));
                            
                            Configuration cfg=new Configuration();
                            SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
                            Session s=sessionFactory.openSession();
                            Transaction transaction=s.beginTransaction();

                            String sql="FROM bean.Record "
                                    + "WHERE catid=:id";
                            Query query=s.createQuery(sql);
                            query.setParameter("id", q);
                            List list=query.list();
                            Iterator itr=list.iterator();
                            
                            out.print("<select required>");
                            out.print("<option selected value=''>--Select Record--</option>");
                            while(itr.hasNext())
                            {
                                bean.Record obj=(bean.Record)itr.next();
                                out.println("<option value="+obj.getRecid()+">"+obj.getRecname()+"</option>");
                            }
                            transaction.commit();
                            s.close();
                            sessionFactory.close();
                        }
        
                        catch(Exception ex)
                        {
                            System.out.println(ex);      
                        }
                    break;
                        
                    case "Add Record":
                    {
                        
                        try
                        {
                            Integer categoryid=Integer.parseInt(request.getParameter("categorySelect"));
                            Integer recid=Integer.parseInt(request.getParameter("recordid"));
                            String street1=request.getParameter("street1");
                            String street2=request.getParameter("street2");
                            String landmark=request.getParameter("landmark");
                            String city=request.getParameter("city");
                            String state=request.getParameter("state");
                            String country=request.getParameter("country");
                            String zip=request.getParameter("zip");
                            String contact1=request.getParameter("contact1");
                            String contact2=request.getParameter("contact2");
                            String contact3=request.getParameter("contact3");
                            String email1=request.getParameter("email1");
                            String email2=request.getParameter("email2");
                            String email3=request.getParameter("email3");
                            String website=request.getParameter("website");
                            String path="";
                            String pathfilename="";    
                            
                            System.out.println(categoryid);
                            System.out.println(recid);
                            System.out.println(street1);
                            System.out.println(street2);
                            System.out.println(landmark);
                            System.out.println(city);
                            System.out.println(state);
                            System.out.println(country);
                            System.out.println(zip);
                            System.out.println(contact1);
                            System.out.println(contact2);
                            System.out.println(contact3);
                            System.out.println(email1);
                            System.out.println(email2);
                            System.out.println(email3);
                            System.out.println(website);
                            
                            //== get image from form if available
                            
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
                                    pathfilename=path+File.separator+"img_"+recid+".jpg";
                                    File f=new File(pathfilename);
                                    ImageIO.write(bimage,"jpeg",f);
                                }
                                else
                                {
                                    //=== saving image to folder
                                    path="/home/aa/NetBeansProjects/searchChd/web/RecordPhotos";
                                    pathfilename=path+File.separator+"img_"+recid+".jpg";
                                    File f=new File(pathfilename);
                                    ImageIO.write(bimg,"jpeg",f);
                                }
                            }
                            
                           
                            
                            
                            //=== Adding address data in table 
                            
                            bean.Address a=new bean.Address();
                            a.setRecid(recid);
                            a.setStreet(street1);
                            a.setArea(street2);
                            a.setCity(city);
                            a.setLandmark(landmark);
                            a.setState(state);
                            a.setCountry(country);
                            a.setZipcode(zip);
                            a.setImgpath(pathfilename);
                            
                            
                            // ===  check so that null entries are not inserted into PHONE table
                            
                            if(contact1.length()>0)
                            {
                                a.setFone1(contact1);
                            }
                            
                            if(contact2.length()>0)
                            {
                                a.setFone2(contact2);
                            }
                            
                            if(contact3.length()>0)
                            {
                                a.setFone3(contact3);
                            }                            
                            
                            
                            //== for one to many.. adding EMAIL DATA to hashset in table
                            
                            Set emailset=new HashSet();
                            
                            // ===  check so that null entries are not inserted into email table
                            
                            if(email1.length()>0)
                            {
                                bean.Email e1=new bean.Email();
                                e1.setEmailadd(email1);
                                e1.setAddress(a);
                                emailset.add(e1);
                            }
                            
                            if(email2.length()>0)
                            {
                                bean.Email e2=new bean.Email();
                                e2.setEmailadd(email2);
                                e2.setAddress(a);
                                emailset.add(e2);
                                
                            }
                            
                            if(email3.length()>0)
                            {
                                bean.Email e3=new bean.Email();
                                e3.setEmailadd(email3);
                                e3.setAddress(a);
                                emailset.add(e3);
                            }
                            
                            if(website.length()>0)
                            {
                                bean.Email e4=new bean.Email();
                                e4.setEmailadd(website);
                                e4.setAddress(a);
                                emailset.add(e4);
                                
                            }
                            
                            //== Adding EMAILSET to ADDRESS class SET
                            
                            if(emailset.isEmpty()==false)
                            {
                                a.setEmail(emailset);
                            }
                            
                            
                            
                            //=== Connecting via hibernate
                            
                            Configuration cfg=new Configuration();
                            SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
                            Session s=sessionFactory.openSession();
                            Transaction transaction=s.beginTransaction();
                           
                            s.save(a);

                            transaction.commit();
                            sessionFactory.close();
                            
                            //==== if success then redirect to success page
                            request.getSession(false).setAttribute("info", "Your Info is Added Successfully");
                            response.sendRedirect("AdminPanel/AdminPanelSuccess.jsp");
                
                            
                        }
                        catch(Exception ex)
                        {
                            System.out.println(ex.getMessage());
                        }
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
