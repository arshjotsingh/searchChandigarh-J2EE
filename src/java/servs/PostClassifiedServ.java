package servs;

import bean.Classified;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Date;
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
public class PostClassifiedServ extends HttpServlet 
{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        String action=request.getParameter("Submit");
        
        switch(action)
        {
               //========= If Preview Button is Clicked ==============
            case "Preview" :
            {
                String name=request.getSession(false).getAttribute("wname").toString();
                response.setContentType("text/html;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) 
                {
                    String ctitle=request.getParameter("title");
                    String cdesc=request.getParameter("desc");
                    String cname=request.getParameter("name");
                    String cno=request.getParameter("contactno");
                    
                    int cnt=0;

                    for(int i=1; i<=4;i++)
                    {
                        
                      long filesize=request.getPart("img"+i).getSize();
                      
                        if(filesize<1)
                        {
                            System.out.println("continued");
                            continue;
                            
                        }
                       else
                        {
                            //== increment a counter for no. of images
                            cnt++;
                            System.out.println(cnt);
                            Part part=request.getPart("img"+i);
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
                              
                            String path="/home/aa/NetBeansProjects/searchChd/web/ClassifiedPhotos/temp";
                            String pathfilename=path+File.separator+name+cnt+".jpg";
                            File f=new File(pathfilename);
                            ImageIO.write(bimage,"jpeg",f);
                            }
                            else
                            {
                                String path="/home/aa/NetBeansProjects/searchChd/web/ClassifiedPhotos/temp";
                                String pathfilename=path+File.separator+name+cnt+".jpg";
                                File f=new File(pathfilename);
                                ImageIO.write(bimg,"jpeg",f);
                            }
                           
                            
                        }
                    }
                    
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
                    out.print("<p>Title:<a href='#'>"+ctitle+"</a><br> </p>");
                    out.print("<form action='PostClassifiedServ' method='get'>");
                    
                    if(cnt>0)
                    {
                        out.print("<a href='ClassifiedPhotos/temp/"+name+"1.jpg'><img style='margin-bottom:10px;'id='imglarge' src='ClassifiedPhotos/temp/"+name+"1.jpg' height='300' alt='image1'></img></a><br>");
    
                        for(int j=1;j<=cnt;j++)
                        {
                            out.print("<a href='ClassifiedPhotos/temp/"+name+j+".jpg'><img style='margin-right:5px;'src='ClassifiedPhotos/temp/"+name+j+".jpg' width='100'onmouseover='changeImage(this.src)'  height='100' alt='image'  ></img></a>");
                        }
                    }
                    out.print("<p>"+cdesc+"</p>"
                            + "<p>"+cname+"&nbsp;&nbsp;&nbsp;"+cno+"</p>"
                            + "<input type='button' onclick='goBack();' value='Go Back'>");
                    out.print("</body></html>");
                }
                
                break;
            }
    
            //========= If Submit Button is Clicked ==============
            
            
            case "Submit"  :
            {
                PrintWriter out=response.getWriter();
                boolean flag;
                int lastclassid=0;
                
                String name=request.getSession(false).getAttribute("wname").toString();
                int userid=Integer.parseInt(request.getSession(false).getAttribute("wid").toString());

                int catid=Integer.parseInt(request.getParameter("categorySelect"));
                String ctitle=request.getParameter("title");
                String cdesc=request.getParameter("desc");
                String cname=request.getParameter("name");
                    String cno=request.getParameter("contactno");


                
                //=========== Get Last Record ID============
                try
                {

                    Configuration cfg=new Configuration().configure("hibernate.cfg.xml");
                    SessionFactory factory = cfg.buildSessionFactory();
                    Session s = factory.openSession();
                    Transaction tx = s.beginTransaction();
                    String sql="From bean.Classified order by cid desc";
                    Query q=s.createQuery(sql);
                    q.setMaxResults(1);
                    List list=q.list();
                    Iterator itr=list.iterator();
                    
                    if(itr.hasNext())
                    {
                        bean.Classified obj=(bean.Classified)itr.next();
                        lastclassid=obj.getCid();
                        lastclassid=lastclassid+1;
                    }
                                      
                    tx.commit();
                    s.close();
                    factory.close();
                } 

                catch(Exception ex)
                {
                    System.out.println(ex.getMessage());
                }
                
                //===============Set Classified Object=========================

                bean.Classified classified=new Classified();
                classified.setCid(lastclassid);
                classified.setCatid(catid);
                classified.setTitle(ctitle);
                classified.setDesc(cdesc);
                classified.setUserid(userid);
                Date dateobj = new Date();
                classified.setPostdate(dateobj);
                classified.setUname(cname);
                classified.setUcontact(cno);
                
                //==== Write Image to Classified Folder
                
                int cnt=0;

                for(int i=1; i<=4;i++)
                {
                    long filesize=request.getPart("img"+i).getSize();

                    if(filesize<1)
                    {
                        continue;
                    }
                    else
                    {
                        //== increment a counter for no. of images
                        cnt++;

                        Part part=request.getPart("img"+i);
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

                            String path="/home/aa/NetBeansProjects/searchChd/web/ClassifiedPhotos";
                            String pathfilename=path+File.separator+name+lastclassid+"_"+cnt+".jpg";
                            File f=new File(pathfilename);
                            ImageIO.write(bimage,"jpeg",f);

                            switch (cnt)
                            {
                                case 1:classified.setImg1(pathfilename);
                                        break;
                                case 2:classified.setImg2(pathfilename);
                                        break;
                                case 3:classified.setImg3(pathfilename);
                                        break;
                                case 4:classified.setImg4(pathfilename);
                                        break;
                            }

                        }
                            
                        else
                        {
                            System.out.println("inside scale:::::::::::");
                            String path="/home/aa/NetBeansProjects/searchChd/web/ClassifiedPhotos";
                            String pathfilename=path+File.separator+name+lastclassid+"_"+cnt+".jpg";
                            File f=new File(pathfilename);
                            ImageIO.write(bimg,"jpeg",f);
                            switch (cnt)
                            {
                                case 1:classified.setImg1(pathfilename);
                                        break;
                                case 2:classified.setImg2(pathfilename);
                                        break;
                                case 3:classified.setImg3(pathfilename);
                                        break;
                                case 4:classified.setImg4(pathfilename);
                                        break;
                            }
                        }
                    }
                }
                            
                            //===== Save Classified Object to Database

                try
                {
                    Configuration cfg=new Configuration().configure("hibernate.cfg.xml");
                    SessionFactory factory = cfg.buildSessionFactory();
                    Session s = factory.openSession();
                    Transaction tx = s.beginTransaction();
                    s.save(classified);
                    tx.commit();
                    s.close();
                    factory.close();

                    //=======================Pass Session variable if Success===============================
                    request.getSession(false).setAttribute("info", "Your Classified is Posted Successfully");
                    response.sendRedirect("UserPanel/UserPanelSuccess.jsp");

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
