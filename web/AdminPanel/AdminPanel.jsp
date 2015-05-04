<%-- 
    Document   : AdminPanel
    Created on : Sep 26, 2014, 2:07:30 PM
    Author     : aa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


</head>
<body>
    
    <jsp:include page="AdminPanelWelcome.jsp"></jsp:include>
      <%
            String welcomename=null;
         
         if(request.getSession(false)==null)
         {
             response.sendRedirect("LoginPage.jsp");
         }
         else if(request.getSession(false)!=null)
         {
           welcomename=request.getSession(false).getAttribute("wname").toString();
         }
            
            %>

 <div id="content" style="min-height:400px; border-radius:15px">
 <center>
 <p  style="font-family:'Lobster 1.4'; font-size:36px; display:block; margin-top:70px;  ">Welcome Admin,<%=welcomename%></p>
  <img src="../UserPhotos/<%=welcomename%>.jpg" height="150" width="150"alt="image" />
 </center>

 </div>
    <jsp:include page="FooterAdmin.html"/>
  
</body>
</html>
