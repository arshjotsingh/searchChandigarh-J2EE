<%-- 
    Document   : PostClassified
    Created on : Oct 7, 2014, 2:24:21 PM
    Author     : aa
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post a New Classified</title>
        <script>
           
        </script>
    </head>
    <body>
        <jsp:include page="UserPanel.jsp"></jsp:include>
        
         <div id="content" style="height:auto; border-radius:15px">
             <form name="formPostClassified" id="formPostClassified" method="post" action="/searchChd/PostClassifiedServ" enctype="multipart/form-data"> 
  <input type="hidden" name="hiddenfields" value="preview">
  <center>
<table  cellpadding="10" cellspacing="10" style="margin:20px 20px 20px 20px">
<tr>
	<th colspan="2" style="font-family:Serif; font-size:26px;  ">Post Classified</th>
</tr>
<tr>
	<td>Select Category</td>
        <%
        try
        {
            Configuration cfg=new Configuration();
            SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
            Session s=sessionFactory.openSession();
            Transaction transaction=s.beginTransaction();

            String sql="FROM bean.Category";
            Query query=s.createQuery(sql);
            List<String> list=query.list();
            Iterator itr=list.iterator();
        %>
       
    <td>
        <select name="categorySelect" autofocus=""required>
            <option value="" selected>--Select Category--</option>
            <%
            while(itr.hasNext())
            {
                bean.Category obj = (bean.Category)itr.next();
            %>
            <option value="<%=obj.getCatid()%>"><%=obj.getCatname()%></option>
            <%
            }
        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
        }
        %>
        </select>
                        
    </td>
</tr>
<!--<tr>
    <td>Select Classified Type</td><td>
        <input type="radio" name="grp1" value="Free" checked="" >&nbsp;&nbsp;Free</input>
        <input type="radio" name="grp1" value="Paid" >&nbsp;&nbsp;Paid</input>
    </td>
</tr>-->
<tr>
    <td>Title <br>(max limit 100 characters)</td>
    <td><input name="title"maxlength="99" size="42" type="text" required/></td>
</tr>
<tr>
    <td>Description<br>(max limit 800 characters)</td>
        <td><textarea name="desc" cols="40" rows="10" maxlength="799"required></textarea></td>
</tr>
<tr>
    <td>Contact Name</td>
    <td><input name="name"maxlength="99" size="42" type="text" required/></td>
</tr>
<tr>
    <td>Contact No </td>
    <td><input name="contactno"maxlength="99" size="42" type="text" required/></td>
</tr>
<tr>
    <td>Add Image (1)</td>
    <td><input type="file" name="img1"></textarea></td>
</tr>
<tr>
    <td>Add Image (2)</td>
    <td><input type="file" name="img2"></textarea></td>
</tr><tr>
    <td>Add Image (3)</td>
    <td><input type="file" name="img3"></textarea></td>
</tr><tr>
    <td>Add Image (4)</td>
    <td><input type="file" name="img4"></textarea></td>
</tr>

<tr><td>
        &nbsp;
    </td>
    
    <td colspan="1"><input type="submit"  value="Preview" name="Submit">
        <input type="submit" value="Submit" name="Submit">
        <input type="reset" value="Clear" />
       
    </td>
</tr>
</table>
         
 
</form>
     
 </div>
 
          <jsp:include page="FooterUser.html"/>

</div>

</body>
</html>
