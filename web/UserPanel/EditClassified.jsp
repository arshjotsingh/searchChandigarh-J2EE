<%-- 
    Document   : EditClassified
    Created on : Oct 28, 2014, 3:03:33 PM
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Classified</title>
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
         <jsp:include page="UserPanel.jsp"></jsp:include>
         <div id="content" style="min-height:400px; border-radius:15px">
            <form name="form_editClassified" action="EditClassifiedForm.jsp" method="get">
            <center>
               <table class="hovertable" cellpadding="10" cellspacing="10" style="margin:20px 20px 20px 20px"> 
            <tr>
                <th colspan="4" style="font-family:Serif; font-size:26px;  ">
                    Edit Classified
                </th>
            </tr>
               </table>
            <table class="hovertable" cellpadding="10" cellspacing="10" style="margin:20px 20px 20px 20px">
          
            
            
            <tr>
                <td>
               <b>     Classified ID
                </td>
                <td>
                <b>    Classified Title
                </td>
                <td>
               <b>     Description
                </td>
                <td>
              <b>      Paid
                </td>
                <td>
              <b>      Post Date
                </td>
            </b>
            </tr>
            <tr>
                 <%
            try
            {
            
                Configuration cfg=new Configuration();
                SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
                Session s=sessionFactory.openSession();
                Transaction transaction=s.beginTransaction();
                
                String sql="FROM bean.Classified";
                Query query=s.createQuery(sql);
                List list=query.list();
                Iterator itr=list.iterator();
                
                while(itr.hasNext())
                {
                    %>
                <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#FFF';">
               
                    <%
                    bean.Classified obj=(bean.Classified)itr.next();
                    %>
                    <td>
                        <%=obj.getCid()%>
                    </td>
                    <td>
                        <%=obj.getTitle()%>
                    </td>
                    <td>
                        <%=obj.getDesc()%>
                    </td>
                    <td>
                        <%=obj.isPaid()%>
                    </td>
                       
                    <td>
                        <%=obj.getPostdate()%>
                    </td>
                    <td>
                        <input type="submit" name="<%=obj.getCid()%>" value="Edit/Delete"> 
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
            <jsp:include page="FooterUser.html"/>
    </body>
</html>
