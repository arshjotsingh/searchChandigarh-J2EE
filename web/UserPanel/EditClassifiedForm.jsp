<%-- 
    Document   : EditClassifiedForm
    Created on : Oct 28, 2014, 3:17:16 PM
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
<%
String str=request.getQueryString();
String[] parts=str.split("=");
    String uname=null;
    String cid=parts[0];
    request.getSession(false).setAttribute("classifiedid", cid);
    String ctitle=null;
    String cdesc=null;
    String cname=null;
    String cno=null;
    String imgpath1="";
    String imgpath2="";
    String imgpath3="";
    String imgpath4="";
    String noimgpath="../css/NoImage.png";
    String ctype="";
    int catid=0;
    boolean paid=false;
    
     try
            {
                
                uname=request.getSession(false).getAttribute("wname").toString();
                Configuration cfg=new Configuration();
                SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
                Session s=sessionFactory.openSession();
                Transaction transaction=s.beginTransaction();
                
                String sql="FROM bean.Classified where cid=:id";
                Query query=s.createQuery(sql);
                int i=Integer.parseInt(cid);
                query.setParameter("id", i);
                List list=query.list();
                Iterator itr=list.iterator();
                
                if(itr.hasNext())
                {
                    bean.Classified obj=(bean.Classified)itr.next();
                    catid=obj.getCatid();
                    ctitle=obj.getTitle();
                    cdesc=obj.getDesc();
                     paid=obj.isPaid();
                     cname=obj.getUname();
                     cno=obj.getUcontact();
                    
                    if(!obj.getImg1().isEmpty())
                    {
                        imgpath1=obj.getImg1();
                        String[] paths=imgpath1.split("web/");
                        imgpath1="../"+paths[1];
                    }
                    if(!obj.getImg2().isEmpty())
                    {
                        imgpath2=obj.getImg2();
                        String[] paths=imgpath2.split("web/");
                        imgpath2="../"+paths[1];
                    }
                    if(!obj.getImg3().isEmpty())
                    {
                        imgpath3=obj.getImg3();
                        String[] paths=imgpath3.split("web/");
                        imgpath3="../"+paths[1];
                    }
                    if(!obj.getImg4().isEmpty())
                    {
                        imgpath4=obj.getImg4();
                        String[] paths=imgpath4.split("web/");
                        imgpath4="../"+paths[1];
                    }
                    
                }
                
                if(paid)
                {
                    ctype="Paid";
                }
                else
                {
                    ctype="Free";
                }
                
                
                s.close();
                
            }
     catch(Exception ex)
     {
         System.out.println(ex.getMessage());
     }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Classified Form</title>
        <script>
            function verifyDelete()
            {
               var r= confirm("Are you sure you want to DELETE classified?");
               if(r==true)
               {
                   return true;
               }
               else
               {
                   return false;
               }
            }
        </script>
        <style>
            a{
                color:blue; text-decoration: none;
            }
        </style>
    </head>
    <body>
       <jsp:include page="UserPanel.jsp"></jsp:include>
        
         <div id="content" style="min-height:400px; border-radius:15px">
             <form name="formPostClassified" id="formPostClassified" method="get" action="/searchChd/EditClassifiedServ" enctype="multipart/form-data"> 
  <center>
      <table  cellpadding="10" cellspacing="10" style="margin:20px 20px 20px 20px">

      <tr>
	<th colspan="2" style="font-family:Serif; font-size:26px;  ">Edit Classified Form</th>
    </tr>
      </table>
      
<table  cellpadding="10" cellspacing="10" style="margin:20px 20px 20px 20px">

<tr>
	<td>Classified ID</td>
       
    <td>
        <input value="<%=cid%>" readonly="true"/>
    </td>
</tr>
<tr>
	<td>Category ID</td>
       
    <td>
        <input value="<%=catid%>" readonly="true"/> 
        <a href="EditClassifiedCategory.jsp?q=<%=catid%>" style="color:blue; text-decoration: none">Edit Category</a>
    </td>
</tr>
<!--<tr>
    <td>Classified Type</td><td>
        <input type="text" name="type" value="<%=ctype%>" readonly="true" />
    </td>
</tr>-->
<tr>
    <td>Title <br>(max limit 100 characters)</td>
    <td><input name="title"maxlength="99" size="42" type="text" value="<%=ctitle%>" required/></td>
</tr>
<tr>
    <td>Description<br>(max limit 800 characters)</td>
        <td><textarea name="desc" cols="40" rows="10" maxlength="799"required><%=cdesc%></textarea></td>
</tr>
<tr>
    <td>Contact Name</td>
    <td><input name="name"maxlength="99" size="42" type="text" value="<%=cname%>" required/></td>
</tr>
<tr>
    <td>Contact No </td>
    <td><input name="contactno"maxlength="99" size="42" type="text" value="<%=cno%>" required/></td>
</tr>
<tr>
    <th colspan="1" style="font-family:Serif; font-size:20px; padding: 30px 30px 30px 30px ">Image Panel</th>
</tr>
                <tr>
                    <td> Image 1</td>
                    <%
                        if(!imgpath1.isEmpty())
                        {
                    %>
                    <td><a href="<%=imgpath1%>"><img src="<%=imgpath1%>" height="260" width="400"/></a></td>
                        <td><a href="EditClassifiedImageForm.jsp?q=1">Edit</a>&nbsp;<a href="/searchChd/EditClassifiedServ?action=delete&q=1&c=<%=cid%>">Delete</a></td>
                       <%
                        }
                        else
                        {
                       %>
                       <td><a href="<%=noimgpath%>"><img src="<%=noimgpath%>" height="200" width="400"/></a></td>
                        <td><a href="EditClassifiedImageForm.jsp?q=1">Add</a></td>
                       <%
                        }
                        %>
                </tr>
                
               <tr>
                    <td> Image 2</td>
                     <%
                        if(!imgpath2.isEmpty())
                        {
                    %>
                    <td><a href="<%=imgpath2%>"><img src="<%=imgpath2%>" height="260" width="400"/></a></td>
                        <td><a href="EditClassifiedImageForm.jsp?q=2">Edit</a>&nbsp;<a href="/searchChd/EditClassifiedServ?action=delete&q=2&c=<%=cid%>">Delete</a></td>
                       <%
                        }
                        else
                        {
                            
                       %>
                        <td><a href="<%=noimgpath%>"><img src="<%=noimgpath%>" height="200" width="400"/></a></td>
                        <td><a href="EditClassifiedImageForm.jsp?q=2">Add</a></td>
                       <%
                        }
                        %>
                </tr>
                
                <tr>
                    <td> Image 3</td>
                    
                     <%
                        if(!imgpath3.isEmpty())
                        {
                    %>
                        <td><a href="<%=imgpath3%>"><img src="<%=imgpath3%>" height="260" width="400"/></a></td>
                        <td><a href="EditClassifiedImageForm.jsp?q=3">Edit</a>&nbsp;<a href="/searchChd/EditClassifiedServ?action=delete&q=3&c=<%=cid%>">Delete</a></td>
                       <%
                        }
                        else
                        {
                       %>
                       <td><a href="<%=noimgpath%>"><img src="<%=noimgpath%>" height="200" width="400"/></a></td>
                        <td><a href="EditClassifiedImageForm.jsp?q=3">Add</a></td>
                       <%
                        }
                        %>
                </tr>
            
                <tr>
                    <td> Image 4</td>
                   
                     <%
                        if(!imgpath4.isEmpty())
                        {
                    %>
                        <td><a href="<%=imgpath4%>"><img src="<%=imgpath4%>" height="260" width="400"/></a></td>
                        <td><a href="EditClassifiedImageForm.jsp?q=4">Edit</a>&nbsp;<a href="/searchChd/EditClassifiedServ?action=delete&q=4&c=<%=cid%>">Delete</a></td>
                       <%
                        }
                        else
                        {
                       %>
                       <td><a href="<%=noimgpath%>"><img src="<%=noimgpath%>" height="200" width="400"/></a></td>
                        <td><a href="EditClassifiedImageForm.jsp?q=4">Add</a></td>
                       <%
                        }
                        %>
                </tr>

</table>
                <table  cellpadding="10" cellspacing="10" style="margin:20px 20px 20px 20px">


<tr><td>
        &nbsp;
    </td>
    
    <td colspan="1">
        <input type="submit"  value="Preview Classified" name="action">
        <input type="submit" value="Submit Classified" name="action">
        <input type="submit" value="Delete Classified" name="action" onclick="{return verifyDelete();}">
       
    </td>
</tr>
</table>
         
 
</form>
     
 </div>
     <jsp:include page="FooterUser.html"/>
</div>
         

    </body>
</html>
