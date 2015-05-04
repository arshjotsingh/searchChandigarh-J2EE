<%-- 
    Document   : LoginPage
    Created on : Sep 29, 2014, 12:09:26 PM
    Author     : aa
--%>

<%
    if(null==request.getSession(false))
    {
        
    }
    else
    {
        response.sendRedirect("UserPanel/UserPanelWelcome.jsp");
    }
    
    %>

<%@page contentType="text/html" pageEncoding="UTF-8" session="false" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log In </title>
   <link href="css/adminPanel.css" rel="stylesheet" type="text/css">
<link href="css/boilerplate.css" rel="stylesheet" type="text/css">
<link href="css/Main.css" rel="stylesheet" type="text/css">
<style>
   
    
</style>

    </head>
    <jsp:include page="Home.jsp"></jsp:include>
  
  <div id="content" style="border-radius:15px;height:400px;">
      
       <form name="loginform" action="LoginServ" method="get" >
                    
                <center>
                    <table border="0" cellpadding="10" style="margin-top:30px" >
                        <tr>
                           <th colspan="2" style="font-family:Serif; font-size:26px; text-align: center ">Log In</th>
                        </tr>
                        <tr>
                            <td>Username </td>
                            <td><input type="text" name="username" placeholder="Enter Username"></td>
                        </tr>
                        <tr>
                            <td>Password</td>
                            <td><input type="password" name="password" placeholder="Enter Password"></td>
                            
                        </tr>
                     
                        <tr>
                            <td colspan="2" align="center"><input type="submit" value="Log In">
                            <input type="reset" value="Clear">    
                            </td>
                        </tr>
                        
                        <tr>
                            <td colspan="2" align="center"> 
                                <a style="text-decoration: none;color: blue;"href="RegisterPage.jsp" >New User</a>
                               &nbsp;
                                 <a style="text-decoration: none;color: blue;" href="#" >Trouble Logging in?</a></td>
                            
                        </tr>
                        
                        <tr>
                            <td colspan="2" align="center" style="color: red">
                            <%
                                if(request.getParameter("d")!=null)
                                {
                                    
                                    out.print("INVALID Username/Password");
                                }
                                %>
                            </td>
                            
                        </tr>
                                         
                     </table>
                </center>
                </form>
  
 </div>
  
                                <jsp:include page="footer.html"/>
</body>
</html>
