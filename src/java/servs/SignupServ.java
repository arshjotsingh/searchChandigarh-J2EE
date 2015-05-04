
package servs;

import bean.User;
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
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

@MultipartConfig(location="/tmp", fileSizeThreshold=1024*1024, 
    maxFileSize=1024*1024*5, maxRequestSize=1024*1024*5*5)
public class SignupServ extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        out.println("<html><head></head><body> Welcome");
        
        try
        {
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String firstname=request.getParameter("firstname");
        String lastname=request.getParameter("lastname");
        String dob=request.getParameter("dob_day")+"/"+request.getParameter("dob_month")+"/"+request.getParameter("dob_year");
        String gender=request.getParameter("gender");
        String email=request.getParameter("email");
        String address=request.getParameter("address");
        String city=request.getParameter("city");
        String country=request.getParameter("country");
        String state=request.getParameter("state");
        
        Part part=request.getPart("userimage");
        String pathfilename="";
        if(part.getSize()>0)
        {
            InputStream is=part.getInputStream();
            ImageInputStream iis=ImageIO.createImageInputStream(is);
            BufferedImage bimg=ImageIO.read(iis);
            String path="/home/aa/NetBeansProjects/searchChd/web/UserPhotos";
            pathfilename=path+File.separator+username+".jpg";
            File f=new File(pathfilename);
            ImageIO.write(bimg,"jpeg",f);
        }
        
          
        bean.User user=new User();
        user.setUname(username);
        user.setUpass(password);
        user.setDOB(dob);
        user.setGender(gender);
        user.setFname(firstname);
        user.setLname(lastname);
        user.setEmail(email);
        user.setStreet(address);
        user.setCity(city);
        user.setState(state);
        user.setCountry(country);
        user.setPhotopath(pathfilename);
     
        
        
        Configuration cfg=new Configuration().configure("hibernate.cfg.xml");
        SessionFactory factory = cfg.buildSessionFactory();
        Session s = factory.openSession();
        Transaction tx = s.beginTransaction();
        s.save(user);
        tx.commit();
        s.close();
        factory.close();
      } 
       
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
        }
        finally{
                    
            response.sendRedirect("index.jsp");

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
