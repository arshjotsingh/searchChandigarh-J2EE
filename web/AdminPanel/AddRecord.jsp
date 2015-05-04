<%-- 
    Document   : AddRecord
    Created on : Oct 9, 2014, 3:24:34 PM
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
        <title>Add Record Page</title>
        <script>
            function showData(str){
                
                var p=str;
                if(p=="")
                {
                    document.getElementById("recname").innerHTML="";
                    return;
                }
                
                if(window.XMLHttpRequest)
                // code for IE7+, opera, firefox, chrome, safari
                {
                    xmlhttp=new XMLHttpRequest();
                }
                
                else
                // code for IE6, IE5
                {
                    xmlhttp= new ActiveXObject("Microsoft.XMLHTTP") ;
                }
                
                xmlhttp.onreadystatechange=function ()
                {
                    // to get response text from jsp to required id here
                    if(xmlhttp.readyState==4 && xmlhttp.status==200)
                    {
                      
                      document.getElementById("reclist").innerHTML=xmlhttp.responseText;
                        
                    }
                }
                
                //send request
                xmlhttp.open("GET","/searchChd/AddRecord?q="+p+"&qry=ajx",true);
                xmlhttp.send();
                
            }
            
        </script>
    </head>
    <body>
         <jsp:include page="AdminPanelWelcome.jsp"></jsp:include>
 <div id="content" style="min-height:400px; border-radius:15px">
     <form name="formAddRecord" method="get" action="/searchChd/AddRecord"> 
         <center>
<table  cellpadding="10" cellspacing="10" style="margin:20px 20px 20px 20px">
<tr>
    <th colspan="2" style="font-family:Serif; font-size:26px;  ">Add Record</th>
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
        <select name="categorySelect">
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
                        
        <a href="AddCategory.jsp" style="color:blue; text-decoration: none">Add a New Category</a>
    </td>
</tr>

<tr>

	<td>Record Name	</td>
        <td>
            <input type="text" list="reclist" autocomplete="off" name="recordname" id="recname"  onkeyup="showData(this.value)"/>
            <datalist id="reclist">
            </datalist>
        </td>

            

</tr>

<tr>
	<td>Description	</td>
        <td><textarea name="desc"  required></textarea></td>
</tr>

<tr>
	<td>Tags	</td>
        <td><textarea name="tags" required></textarea></td>
</tr>
<tr>
<td colspan="2"><center><input name="qry" type="submit" value="Submit" /><input type="reset" value="Clear" /></td>
</tr>
<tr>
  
</tr>
</table>
         
 
</form>
     
 </div>
 
  <jsp:include page="FooterAdmin.html"/> 
     </body>
</html>
