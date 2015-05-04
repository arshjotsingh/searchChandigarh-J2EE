<%-- 
    Document   : EditCategoryForm
    Created on : Oct 14, 2014, 1:54:22 PM
    Author     : aa
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%
String str=request.getQueryString();
String[] parts=str.split("=");
    String cid=parts[0];
    String cname=null;
    String cdesc=null;
    
     try
            {
            
                Configuration cfg=new Configuration();
                SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
                Session s=sessionFactory.openSession();
                Transaction transaction=s.beginTransaction();
                
                String sql="FROM bean.Category where catid=:id";
                Query query=s.createQuery(sql);
                int i=Integer.parseInt(cid);
                query.setParameter("id", i);
                List list=query.list();
                Iterator itr=list.iterator();
                
                if(itr.hasNext())
                {
                    bean.Category obj=(bean.Category)itr.next();
                    cname=obj.getCatname();
                    cdesc=obj.getDesc();
                }
               
                s.close();
                
            }
     catch(Exception ex)
     {
         System.out.println(ex.getMessage());
     }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Category Form</title>
    </head>
    
    <body>
<jsp:include page="AdminPanelWelcome.jsp"></jsp:include>
        <div id="content" style="min-height:400px; border-radius:15px">
            <form name="frm_EditCategoryform" action="/searchChd/EditCategory" method="post">
                <input type="hidden" name="hiddenval" value="update_category">
                <center>
                    <table border="0"cellpadding="10" cellspacing="10" style="margin:20px 20px 20px 20px">
                        <tr>
                            <th colspan="4" style="font-family:Serif; font-size:26px;  ">
                                 Edit Category Form
                            </th>
                        </tr>
                        <tr>
                            <td>
                                Category ID	
                            </td>
                            <td>
                                <input type="text" name="categoryid" value="<%=cid%>"required readonly="true" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Category Name	
                            </td>
                            <td>
                                <input type="text" name="categoryname" value="<%=cname%>"required/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Description
                            </td>
                            <td>
                                <textarea name="desc" required><%=cdesc%></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                            <center>
                              
                                <input name="action" type="submit" value="Update" />
                                <input type="reset" value="Clear" />
                                <input name="action" type="submit"  value="Delete"/>
                                
                            </center>
                            </td>
                        </tr>
                     </table>
                </center>
        </div>
                             <jsp:include page="FooterAdmin.html"/>
    </body>
</html>
