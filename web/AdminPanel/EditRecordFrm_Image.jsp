<%-- 
    Document   : EditRecordFrm_Image
    Created on : Nov 11, 2014, 12:05:48 PM
    Author     : aa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset=UTF-8">
        <title>Edit Record Form (Category Edit)</title>
         <script>
                    function goBack() 
                    {
                        window.history.back();
                    } 
        </script>
        <style>
            td{
                padding:5px 0px 5px 5%;
            }
        </style>
            
    </head>
    <body>
        <jsp:include page="AdminPanelWelcome.jsp"></jsp:include>
        <div id="content" style="min-height:400px; border-radius:15px; margin:auto" >
            <form name="frmEditimg" method="post" action="/searchChd/EditRecord" enctype="multipart/form-data"> 
 <center>
<table  cellpadding="10" cellspacing="10" style="margin:20px 20px 20px 20px">
<tr>
    <th colspan="2" style="font-family:Serif; font-size:26px;  ">Edit Record Image</th>
</tr>

<tr>
    <td>
        <br>
          Add Image 
    </td>
    <td>
        <br>
        <input name="recimage" type="file" required=""/>
    </td>
</tr>

<tr>
    <td colspan="2">
    <center>
        <input type="submit" name="action" value="Submit Image">
        <input type="button" name="Back" value="Back" onclick="goBack()">
    </td>
</tr>
</table>
</center>
</form>
        </div>
         <jsp:include page="FooterAdmin.html"/>
    </body>
</html>

