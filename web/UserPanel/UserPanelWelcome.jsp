<%-- 
    Document   : UserPanelWelcome
    Created on : Oct 7, 2014, 2:06:49 PM
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
        <title>UserPanel</title>
    </head>
    <body>
        <%
            String welcomename=null;
         
         if(request.getSession(false)==null)
         {
             response.sendRedirect("../LoginPage.jsp");
         }
         else if(request.getSession(false)!=null)
         {
           welcomename=request.getSession(false).getAttribute("wname").toString();
         }
            
            %>
    <jsp:include page="UserPanel.jsp"></jsp:include>

 <div id="content" style="min-height:400px; border-radius:15px">
 <center>
     <p  style="font-family:'Lobster 1.4'; font-size:36px; display:block; margin-top:70px;  ">Welcome, <%=welcomename%> </p>
        <img src="../UserPhotos/<%=welcomename%>.jpg" height="150" width="150"alt="image" />
     </center>
 </div>
  
        <jsp:include page="FooterUser.html"/>
</body>
</html>
