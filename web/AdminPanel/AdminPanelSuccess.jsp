<%-- 
    Document   : AdminPanelSuccess
    Created on : Nov 4, 2014, 2:00:13 PM
    Author     : aa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success Page</title>
    </head>
    <body>
        <jsp:include page="AdminPanelWelcome.jsp"></jsp:include>

 <div id="content" style="min-height:400px; border-radius:15px">
 <center>
     <p  style="font-family:'Lobster 1.4'; font-size:36px; display:block; margin-top:70px;  "> </p>
 <img src="../css/Success.png" height="120" width="120"alt="image" />
 <% out.print(request.getSession(false).getAttribute("info").toString());%>
     </center>
 </div>
  
  <jsp:include page="FooterAdmin.html"/>
    </body>
</html>
