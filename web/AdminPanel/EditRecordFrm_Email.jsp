<%-- 
    Document   : EditRecordFrm_Email
    Created on : Nov 10, 2014, 2:27:06 PM
    Author     : aa
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <div id="content" style="height:auto; border-radius:15px; margin:auto" >
            <form name="frmEditemail" method="get" action="/searchChd/EditRecord"> 
 <center>
<table  cellpadding="10" cellspacing="10" style="margin:20px 20px 20px 20px">
<tr>
    <th colspan="2" style="font-family:Serif; font-size:26px;  ">Add Email/Website</th>
</tr>

<tr>
    <td>
        <br>
         Enter Email 
    </td>
    <td>
        <br>
        <input name="email" type="text" autocomplete="false" required=""/>
    </td>
</tr>
<tr>
    <td>
         Enter Website
    </td>
    <td>
        <input name="website" type="text" autocomplete="false" required=""/>
    </td>
</tr>
<tr>
    <td colspan="2">
    <center>
        <input type="submit" name="action" value="Submit Email/Website">
        <input type="button" name="Back" value="Back" onclick="goBack()">
    </td>
</tr>
    </body>
</html>
