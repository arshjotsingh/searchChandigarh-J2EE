<%-- 
    Document   : EditClassifiedImagefrm
    Created on : Oct 29, 2014, 12:43:14 PM
    Author     : aa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Image Panel</title>
    </head>
    <%
        String imgid=request.getQueryString();
        String [] parts=imgid.split("=");
        imgid = parts[1];
        
        request.getSession(false).setAttribute("imgid", imgid);
        
        %>
    <body>
        <jsp:include page="UserPanel.jsp"></jsp:include>
        <div id="content" style="min-height:400px; border-radius:15px">
        <form name="formEditClassified" method="post" action="/searchChd/EditClassifiedServ" enctype="multipart/form-data"> 
  <input type="hidden" name="hiddenfields" value="preview">
  <center>
<table  cellpadding="10" cellspacing="10" style="margin:20px 20px 20px 20px">
    <tr>
	<th colspan="2" style="font-family:Serif; font-size:26px;  ">Image Form</th>
</tr>
        <tr>
            <td>Add Image </td>
            <td><input type="file" name="imgupload"/></td>
        </tr>
        <tr>
        <td colspan="2"><center> 
        <input type="submit" value="Submit Image" name="action">
        <input type="reset" value="Clear" />
  </center>
    </td>
    </tr>
</table>
         
  </center>
        </form>
        </div>
        <jsp:include page="FooterUser.html"/>
    </body>
</html>
