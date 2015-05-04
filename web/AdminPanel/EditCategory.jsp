<%-- 
    Document   : EditCategory
    Created on : Sep 26, 2014, 2:13:56 PM
    Author     : aa
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Category </title>
        <style>
            table.hovertable 
            {
                
	font-family: verdana,arial,sans-serif;
	font-size:12px;
	color:#333333;
	border-width: 1px;
	border-color: #696969;
        /*border-style: groove;*/
}   
table.hovertable th {
	/*background-color:#FFA500;*/
	border-width: 1px;
	padding: 8px;
/*	border-style: solid;
	border-color: #696969;*/
}
table.hovertable tr {
	background-color:#FAFAFA;
}
table.hovertable td {
/*	border-width: 1px;
	padding: 8px;
	border-style: solid;*/
	/*border-color: #696969;*/
}
        </style>
    </head>
    <body>
        <jsp:include page="AdminPanelWelcome.jsp"></jsp:include>
        <div id="content" style="min-height:400px; border-radius:15px">
            <form name="form_editCategory" action="EditCategoryForm.jsp" method="get">
            <center>
            <table class="hovertable" cellpadding="10" cellspacing="10" style="margin:20px 20px 20px 20px">
          
            <tr>
                <th colspan="4" style="font-family:Serif; font-size:26px;  ">
                    Edit Category
                </th>
            </tr>
            <tr>
                <td>
                    Category ID
                </td>
                <td>
                    Category Name
                </td>
                <td>
                    Description
                </td>
                <td>
                    
                </td>
            </tr>
            <tr>
        <%
            try
            {
            
                Configuration cfg=new Configuration();
                SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
                Session s=sessionFactory.openSession();
                Transaction transaction=s.beginTransaction();
                
                String sql="FROM bean.Category";
                Query query=s.createQuery(sql);
                List list=query.list();
                Iterator itr=list.iterator();
                
                while(itr.hasNext())
                {
                    %>
                <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#FFF';">
               
                    <%
                    bean.Category obj=(bean.Category)itr.next();
                    %>
                    <td>
                        <%=obj.getCatid()%>
                    </td>
                    <td>
                        <%=obj.getCatname()%>
                    </td>
                    <td>
                        <%=obj.getDesc()%>
                    </td>
                    <td>
                        <!--<a href="EditCategoryForm.jsp" ></a>-->
                        <input type="submit" name="<%=obj.getCatid()%>" value="Edit/Delete"> 
                    </td>
                        </tr>
                    <%
                }
                
                s.close();
            }
                  
            catch(Exception ex)
            {
                  System.out.println(ex);
            }
        %>
            </tr>
            
            </table>       
            </center>
            </form>
        </div> 
             <jsp:include page="FooterAdmin.html"/>
    </body>
</html>
