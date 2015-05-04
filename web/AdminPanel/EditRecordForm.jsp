<%-- 
    Document   : EditRecordForm
    Created on : Oct 16, 2014, 2:07:37 PM
    Author     : aa
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="false" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Record Form</title>
        <style>
            td{
                padding:5px 0px 5px 5px;
            }
        </style>
            
    </head>
    <body>
         <form name="frm_DeleteCategory" action="/searchChd/EditRecord" method="post"></form>
        <jsp:include page="AdminPanelWelcome.jsp"></jsp:include>
        <div id="content" style="min-height:400px; border-radius:15px; " >
            <form name="frm_EditRecordform" action="/searchChd/EditRecord" method="post">
                <input type="hidden" name="hiddenval" value="update_record">
                
                <table border="0"cellpadding="10" cellspacing="10" style="float:left; margin:30px;width: 900px">
                    <tr>
                        <th colspan="4" style="font-family:Serif; font-size:26px;  ">
                            Edit Record Form
                        </th>
                    </tr>
                </table>
                
                <!--Fetch data for Table-->
                
                <%
                    
                    
            Configuration cfg=new Configuration();
            SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
            Session s=sessionFactory.openSession();
            Transaction transaction=s.beginTransaction();
            
            
              %>
                
                <table border="0"cellpadding="8" cellspacing="8"  style="float:left;margin-left: 40px ;width: 400px">
                    <tr>
                        <th style="font-family:Serif; font-size:18px;">
                            Record Info
                        </th>
                    </tr>
                    
                    <%
                        int recordid=0;
                        int recordcatid=0;
                        String recordname="";
                        String recorddesc="";
                        String recordtags="";
                        String website="";
                        String[] arr= new String[3];
                        String street="";
                        String area="";
                        String landmark="";
                        String city="";
                        String state="";
                        String country="";
                        String zip="";
                        String fone1="";
                        String fone2="";
                        String fone3="";
                        String imgpath="";
            
                    try
                    {
                        //=== get record id from query string
                        
                        int recid=Integer.parseInt(request.getParameter("q"));
                        
                      String sql="From bean.Record where recid=:id";
                      Query query=s.createQuery(sql);
                      query.setParameter("id",recid);
                    List list = query.list();
                        
                      Iterator itr=list.iterator();
                      
                      if(itr.hasNext())
                      {
                          bean.Record obj=(bean.Record)itr.next();
                          
                          recordid=obj.getRecid();
                          //== Session variable for recordid for posting
                          request.getSession(false).setAttribute("recid", recordid);
                          
                          recordname=obj.getRecname();
                          recorddesc=obj.getDesc();
                          recordtags=obj.getTags();
                          recordcatid=obj.getCatid();
                      }
                      
                      System.out.println(recorddesc);
                      System.out.println(recordtags);
                    }
                    catch(Exception ex)
                    {
                        System.out.println(ex.getMessage());
                    }
                        %>
                    <tr>
                        <td>
                            Category ID	
                        </td>
                        <td>
                            <input type="text" name="catid" value="<%=recordcatid%>" required readonly="true" /><br>
                            <a href="EditRecordFrm_Category.jsp?q=<%=recordcatid%>" style="color:blue; text-decoration: none">Edit Record Category</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Record ID	
                        </td>
                        <td>
                            <input type="text" name="recordid" value="<%=recordid%>" required readonly="true" />
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            Record Name	
                        </td>
                        <td>
                            <input type="text" name="recordname" value="<%=recordname%>"required/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Description
                        </td>
                        <td>
                            <textarea name="desc" required><%=recorddesc%></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Tags
                        </td>
                        <td>
                            <textarea name="tags" required><%=recordtags%></textarea>
                        </td>
                    </tr>
                    <%
                    try
                    {
                        //=== get address id from query string
                        
                        int addid=Integer.parseInt(request.getParameter("p"));
                        
                        %>
                        
                        <!--Create a Hidden Field to pass Address ID to Servlet-->
                        <input type="hidden" name="addid" value="<%=addid%>"/>
                        
                    <tr>
                        <th style="font-family:Serif; font-size:18px;">
                           E-Contact
                        </th>
                    </tr>
                   
                        
                        
                        <%
                        
                      String sql="From bean.Address a inner join fetch a.email e where a.addid=:id";
                      Query query=s.createQuery(sql);
                      query.setParameter("id",addid);
                     List list = query.list();
                        
                      Iterator itr=list.iterator();
                      if(itr.hasNext())
                      {
                              bean.Address obj=(bean.Address)itr.next();

                              //=== Setting session variable for address id 
                              request.getSession(false).setAttribute("addressid",obj.getAddid() );
                              
                              street=obj.getStreet();
                              area=obj.getArea();
                              landmark=obj.getLandmark();
                              city=obj.getCity();
                              state=obj.getState();
                              country=obj.getCountry();
                              zip=obj.getZipcode();
                              fone1=obj.getFone1();
                              fone2=obj.getFone2();
                              fone3=obj.getFone3();
                              if(obj.getImgpath()!=null)
                                {
                                    imgpath=obj.getImgpath();
                                    String[] paths=imgpath.split("web/");
                                    imgpath="../"+paths[1];
                                    System.out.println(imgpath);
                                }
                              else
                              {
                                  imgpath="../RecordPhotos/NoImage.png";
                              }
                              
                              Set em=obj.getEmail();
                              Iterator it=em.iterator();
                             if(it.hasNext())
                             {
                                 int cnt=1;
                                
                                while(it.hasNext())
                                {
                                    bean.Email email=(bean.Email)it.next();
                                    String str=email.getEmailadd();
                                    int emailid=email.getEmailid();
                                    %>
                                    <%
                                    if(str.startsWith("www"))
                                    {
                                        website=str;
                                        %>
                            <tr>
                                <td>Web Site</td>
                                <td><input name="website" value="<%=website%>"type="text" ></td>
                                 <input type="hidden" name="webid" value="<%=emailid%>"/>
                            </tr>
                                        <%
                                    }
                                    
                                    if(str.contains("@"))
                                    {
                                        %>
                                        
                    <tr>
                        <td>
                            Email <%=cnt%>
                        </td>
                        <td>
                            <input name="email<%=cnt%>" value="<%=str%>" type="text" >
                            <input type="hidden" name="emailid<%=cnt%>" value="<%=emailid%>"/>
                        </td>
                    </tr>
                                         <%
                                        cnt++;
                                    }
                                    
                                }
                             }
                          }
                    }
                    catch(Exception ex)
                    {
                        System.out.println(ex.getMessage());
                    }
                        %>
                    
                        <td>
                            
                        </td>
                        <td>
                            <a href="" style="color:blue; text-decoration: none">Add new Email/Website</a>
                        </td>
                    
                    
                    
                </table>
                 
                <table border="0"cellpadding="8" cellspacing="8" style="float: left;margin-left:50px;margin-right:50px ;width: 400px">
                    <tr>   
                    <th style="font-family:Serif; font-size:18px;">
                        Address
                    </th>
                    </tr>
                    <tr>
                        <td>
                            Street 1
                        </td>
                        <td>
                            <input name="street1" value="<%=street%>" type="text" required>
                        </td>
                    </tr>
                     <tr>
                        <td>Area</td>
                        <td><input name="area" value="<%=area%>"type="text" ></td>
                    </tr>
                    <tr>
                        <td>Landmark</td>
                        <td><input name="landmark" value="<%=landmark%>"type="text">(optional)</td>
                    </tr>
                    <tr>
                        <td>City</td>
                        <td><input name="city" type="text" value="<%=city%>"required></td>
                    </tr>
                     <tr>
                        <td>State</td>
                        <td><input name="state" type="text" value="<%=state%>"required></td>
                    </tr>
                    <tr>
                        <td>Country</td>
                        <td>
                            <select name="country">
                                <option value="India">India</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Zip Code</td>
                        <td><input name="zip" type="text" value="<%=zip%>"required></td>
                    </tr>
                    <tr>
                        <th style="font-family:Serif; font-size:18px;">Contact No</th>
                    </tr>

                    <tr>
                        <td>Phone 1</td>
                        <td><input name="contact1" type="text" value="<%=fone1%>" required></td>
                    <tr>
                        <td>Phone 2</td>
                        <td><input name="contact2" type="text" value="<%=fone2%>" required></td>
                    </tr>    
                    <tr>    
                        <td>Phone 3</td>
                          <td><input name="contact3" type="text"value="<%=fone3%>" ></td>
                    </tr>
                    
                    
                </table>
                    
                   <table border="0"cellpadding="10" cellspacing="10" style="float:left; margin-left:100px;margin-top:30px;width: 300px;">
                    <tr>
                        <td style="font-family:Serif; font-size:18px; font-weight: bold">
                            Image
                        </td>
                        <td style="padding-left: 100px">
                            <a href="<%=imgpath%>"><img src="<%=imgpath%>" height="260" width="400"/></a>
                        </td>
                        <td>
                            <a href="EditRecordFrm_Image.jsp">Edit/Delete</a>
                        </td>
                    </tr>
                    </table>
                
                <table border="0"cellpadding="10" cellspacing="10" style="float:left; margin:0;width: 900px;">
                    
                    <tr>
                        <td>
                            <center>
                            <input name="action" type="submit" value="Update" />
                                <input type="reset" value="Clear" />
                                <input name="action" type="submit"  value="Delete"/>
                            </center>
                                
                        </td>
                    </tr>
                </table>
            </form>
        </div>
                         <jsp:include page="FooterAdmin.html"/>
    </body>
</html>
