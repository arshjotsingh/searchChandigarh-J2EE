package servs;

import bean.Classified;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
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

public class EditClassifiedServ extends HttpServlet {
 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
    
        String param=request.getParameter("action");
        
        switch(param)
        {
            case "Submit Image":
            {
                int imgid=Integer.parseInt(request.getSession(false).getAttribute("imgid").toString());
                String name=request.getSession(false).getAttribute("wname").toString();
                int classifiedid=Integer.parseInt(request.getSession(false).getAttribute("classifiedid").toString());
                String pathfilename="";
                
                Part part=request.getPart("imgupload");
                InputStream is=part.getInputStream();
                ImageInputStream iis=ImageIO.createImageInputStream(is);
                BufferedImage bimg=ImageIO.read(iis);
                System.out.println(bimg.getWidth());

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

                String path="/home/aa/NetBeansProjects/searchChd/web/ClassifiedPhotos";
                pathfilename=path+File.separator+name+classifiedid+"_"+imgid+".jpg";
                File f=new File(pathfilename);
                ImageIO.write(bimage,"jpeg",f);

                }
                else
                {
                    String path="/home/aa/NetBeansProjects/searchChd/web/ClassifiedPhotos";
                    pathfilename=path+File.separator+name+classifiedid+"_"+imgid+".jpg";
                    File f=new File(pathfilename);
                    ImageIO.write(bimg,"jpeg",f);
                }
                
                try
                {
                    Configuration cfg=new Configuration();
                    SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
                    Session s=sessionFactory.openSession();
                    Transaction transaction=s.beginTransaction();
                    
                    String sql="";
                
                switch(imgid)
                {
                    case 1:
                    {
                        sql="UPDATE bean.Classified"
                            + " SET img1=:path"
                            + " WHERE cid=:id";
                        break;
                    }
                    case 2:
                    {
                        sql="UPDATE bean.Classified"
                            + " SET img2=:path"
                                + " WHERE cid=:id";
                        break;
                    }

                    case 3:
                    {
                        sql="UPDATE bean.Classified"
                            + " SET img3=:path"
                                + " WHERE cid=:id";
                        break;
                    }

                    case 4:
                    {
                        sql="UPDATE bean.Classified"
                            + " SET img4=:path"
                                + " WHERE cid=:id";
                        break;
                    }

                }
                
                    Query query=s.createQuery(sql);
                    query.setParameter("path",pathfilename);
                    query.setParameter("id",classifiedid);
                   
                    int result=query.executeUpdate();
                    
                    if(result>0)
                    {
                        System.out.println("Update successful");
                    }
                    
                    transaction.commit();
                    s.close();
                    
                    request.getSession(false).setAttribute("info", "Your Image is Submitted Successfully");
                    response.sendRedirect("UserPanel/UserPanelSuccess.jsp");   
                    
                }
                
                catch(Exception ex)
                {
                    System.out.println(ex);
                }
                
                break;
            }
            
            //========== On delete img
            
            case "delete":
            {
                int imgid=Integer.parseInt(request.getParameter("q"));
                int classifiedid=Integer.parseInt(request.getParameter("c"));
                try
                {
                    Configuration cfg=new Configuration();
                    SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
                    Session s=sessionFactory.openSession();
                    Transaction transaction=s.beginTransaction();
                    
                    String sql="";
                
                switch(imgid)
                {
                   case 1:
                    {
                        sql="UPDATE bean.Classified"
                            + " SET img1=:path"
                            + " WHERE cid=:id";
                        break;
                    }
                    case 2:
                    {
                        sql="UPDATE bean.Classified"
                            + " SET img2=:path"
                                + " WHERE cid=:id";
                        break;
                    }

                    case 3:
                    {
                        sql="UPDATE bean.Classified"
                            + " SET img3=:path"
                                + " WHERE cid=:id";
                        break;
                    }

                    case 4:
                    {
                        sql="UPDATE bean.Classified"
                            + " SET img4=:path"
                                + " WHERE cid=:id";
                        break;
                    }

                }
                
                    Query query=s.createQuery(sql);
                    query.setParameter("path","");
                    query.setParameter("id",classifiedid);
                   
                    int result=query.executeUpdate();
                    
                    if(result>0)
                    {
                        System.out.println("Delete successful");
                    }
                    
                    transaction.commit();
                    s.close();
                    
                    
                    response.sendRedirect("UserPanel/EditClassified.jsp");   
                    
                }
                
                catch(Exception ex)
                {
                    System.out.println(ex);
                }
                
                break;
            }
            
            //=================== on Edit Category=============
            
            case "Update Category":
            {
                int classifiedid=Integer.parseInt(request.getSession(false).getAttribute("classifiedid").toString());
                int categoryid=Integer.parseInt(request.getParameter("categorySelect"));
                try
                {
                    Configuration cfg=new Configuration();
                    SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
                    Session s=sessionFactory.openSession();
                    Transaction transaction=s.beginTransaction();
                    String sql="UPDATE bean.Classified"
                            + " SET catid=:catid"
                            + " WHERE cid=:id";
                    
                    Query query=s.createQuery(sql);
                    query.setParameter("catid",categoryid);
                    query.setParameter("id",classifiedid);
                   
                    int result=query.executeUpdate();
                    
                    if(result>0)
                    {
                        System.out.println("Update successful");
                    }
                    
                    transaction.commit();
                    s.close();
                    
                    request.getSession(false).setAttribute("info", "Your Category is updated Successfully");
                    response.sendRedirect("UserPanel/UserPanelSuccess.jsp");
                }
                catch(Exception ex)
                {
                    System.out.println(ex);
                }
                break;
            }
            
            //========= If Preview Button is Clicked ==============
            case "Preview Classified" :
            {
                String imgpath1="";
                String imgpath2="";
                String imgpath3="";
                String imgpath4="";
                PrintWriter out = response.getWriter();
                
                String title=request.getParameter("title");
                String desc=request.getParameter("desc");
                 String cname=request.getParameter("name");
                    String cno=request.getParameter("contactno");
                
                
                out.print("<html><head>"
                            + "<script>"
                            + "function changeImage(str)\n" +
"            {\n" +
"                document.getElementById(\"imglarge\").src=str;\n" +
"            }"
                            + " function goBack() {" +
                            "    window.history.back()\n" +
                                "}" +
                                "</script></head>"
                            + "<body style='margin:50px 50px 50px 50px'>"
                            + "<form action=''");
                out.print("<p>Title:<a href='#'>"+title+"</a><br> </p>");
                
                    
                
                try
                {
                    Configuration cfg=new Configuration();
                    SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
                    Session s=sessionFactory.openSession();
                    Transaction transaction=s.beginTransaction();
                    int classifiedid=Integer.parseInt(request.getSession(false).getAttribute("classifiedid").toString());
                    String sql="FROM bean.Classified where cid=:id";
                    Query query=s.createQuery(sql);
                    query.setParameter("id", classifiedid);
                    List list=query.list();
                    Iterator itr=list.iterator();

                    if(itr.hasNext())
                    {
                        bean.Classified obj=(bean.Classified)itr.next();
                    
                        if(!obj.getImg1().isEmpty())
                        {
                            imgpath1=obj.getImg1();
                            String[] paths=imgpath1.split("web/");
                            imgpath1=paths[1];
                            out.print("<a href='"+imgpath1+"'><img style='margin-bottom:10px' id='imglarge' height='350' src='"+imgpath1+"' alt='image1'></img></a><br>");
                            out.print("<a href='"+imgpath1+"'><img style='margin-right:5px' onmouseover='changeImage(this.src)' width='190' height='150' alt='image' src='"+imgpath1+"' alt='image1'></img></a>");
                            
                        }
                        if(!obj.getImg2().isEmpty())
                        {
                            imgpath2=obj.getImg2();
                            String[] paths=imgpath2.split("web/");
                            imgpath2=paths[1];
                            out.print("<a href='"+imgpath2+"'><img style='margin-right:5px'src='"+imgpath2+"' onmouseover='changeImage(this.src)' width='190' height='150' alt='image'  ></img></a>");
                        }
                        if(!obj.getImg3().isEmpty())
                        {
                            imgpath3=obj.getImg3();
                            String[] paths=imgpath3.split("web/");
                            imgpath3=paths[1];
                            out.print("<a href='"+imgpath3+"'><img style='margin-right:5px' src='"+imgpath3+"' onmouseover='changeImage(this.src)' width='190' height='150' alt='image'  ></img></a>");
                        }
                        if(!obj.getImg4().isEmpty())
                        {
                            imgpath4=obj.getImg4();
                            String[] paths=imgpath4.split("web/");
                            imgpath4=paths[1];
                            out.print("<a href='"+imgpath4+"'><img src='"+imgpath4+"' style='margin-right:5px' onmouseover='changeImage(this.src)' width='190' height='150' alt='image'  ></img></a><br>");
                        }
                    
                    }

                    s.close();
                }
                catch(Exception ex)
                {
                    System.out.println(ex.getMessage());
                }
                
                out.print("<p>Description: <br><br>"+desc+"</p>"
                            + "<p>Contact: "+cname+"&nbsp;&nbsp;&nbsp;"+cno+"</p>"
                            + "<input type='button' onclick='goBack();' value='Go Back'>");
                    out.print("</body></html>");
                       
                    out.print("</body></html>");

                   
            }
                
            break;

            case "Submit Classified" :
            {
                try
                {
                    String title=request.getParameter("title");
                    System.out.println(title);
                    String desc=request.getParameter("desc");
                    System.out.println(desc);
                    String cname=request.getParameter("name");
                    System.out.println(cname);
                    String cno=request.getParameter("contactno");
                    System.out.println(cno);
                    
                    Configuration cfg=new Configuration();
                    SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
                    Session s=sessionFactory.openSession();
                    Transaction transaction=s.beginTransaction();
                    int classifiedid=Integer.parseInt(request.getSession(false).getAttribute("classifiedid").toString());

                    String sql="UPDATE bean.Classified"
                            + " SET title=:title, classifieddesc=:desc, uname=:name, ucontactno=:no"
                            + " WHERE cid=:id";
                    
                    Query query=s.createQuery(sql);
                    query.setParameter("id",classifiedid);
                    query.setParameter("desc", desc);
                    query.setParameter("title", title);
                    query.setParameter("name", cname);
                    query.setParameter("no", cno);
                    
                   
                    int result=query.executeUpdate();
                    
                    if(result>0)
                    {
                        System.out.println("Update successful");
                    }
                    
                    transaction.commit();
                    s.close();
                
                    request.getSession(false).setAttribute("info", "Your Classified is Submitted Successfully");
                    response.sendRedirect("UserPanel/UserPanelSuccess.jsp");   
                    
                }
                    catch(Exception ex)
                {
                    System.out.println(ex.getMessage());
                }
                
                break;
            }
            
            case "Delete Classified" :
            {
                 try
                {
                    Configuration cfg=new Configuration();
                    SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
                    Session s=sessionFactory.openSession();
                    Transaction transaction=s.beginTransaction();
                    int classifiedid=Integer.parseInt(request.getSession(false).getAttribute("classifiedid").toString());

                    String sql="DELETE FROM bean.Classified"
                            + " WHERE cid=:id";
                    
                    Query query=s.createQuery(sql);
                    query.setParameter("id",classifiedid);
                   
                    int result=query.executeUpdate();
                    
                    if(result>0)
                    {
                        System.out.println("Delete successful");
                    }
                    
                    transaction.commit();
                    s.close();
                    
                    //===== Response=====
                    request.getSession(false).setAttribute("info", "Your Classified is Deleted Successfully");
                    response.sendRedirect("UserPanel/UserPanelSuccess.jsp");

//                    response.sendRedirect("UserPanel/EditClassified.jsp");
                    
                }
                    catch(Exception ex)
                {
                    System.out.println(ex.getMessage());
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
