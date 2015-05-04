<%-- 
    Document   : AddCategory
    Created on : Sep 26, 2014, 2:08:48 PM
    Author     : aa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Category</title>
 
</head>
<body>
    <jsp:include page="AdminPanelWelcome.jsp"></jsp:include>
 <div id="content" style="min-height:400px; border-radius:15px">
     <form name="formAddCategory" method="post" action="/searchChd/AddCategory"> 
         <center>
<table  cellpadding="10" cellspacing="10" style="margin:20px 20px 20px 20px">
<tr>
	<th colspan="2" style="font-family:Serif; font-size:26px;  ">Add Category</th>
</tr>
<tr>
	<td>Category Name	</td>
	<td><input type="text" name="categoryname" required/></td>
</tr>
<tr>
	<td>Description	</td>
        <td><textarea name="desc" required></textarea></td>
</tr>


<tr>
	<td colspan="2"><center><input type="submit" value="Submit" /><input type="reset" value="Clear" /></td>
</tr>
<tr>
    
</tr>
</table>
         
 
</form>
     
 </div>
 
  
   <jsp:include page="FooterAdmin.html"/>
</div>

</body>
</html>