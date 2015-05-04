<%-- 
    Document   : EditClassifiedCategory
    Created on : Oct 29, 2014, 3:11:06 PM
    Author     : aa
--%>

<%@page import="org.hibernate.Transaction"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Classified Category</title>
        <script>
                    function goBack() 
                    {
                        window.history.back();
                    } 
        </script>
            
    </head>
    <body>
        <jsp:include page="UserPanel.jsp"></jsp:include>
        <div id="content" style="min-height:400px; border-radius:15px">
     <form name="frmEditCat" method="get" action="/searchChd/EditClassifiedServ"> 
 <center>
<table  cellpadding="10" cellspacing="10" style="margin:20px 20px 20px 20px">
<tr>
    <th colspan="2" style="font-family:Serif; font-size:26px;  ">Edit Classified Category</th>
</tr>
<tr>
    <td>
        Previous Category
    </td>
<%
    try
        {
            int catid=Integer.parseInt(request.getParameter("q"));
            
            Configuration cfg=new Configuration();
            SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
            Session s=sessionFactory.openSession();
            Transaction transaction=s.beginTransaction();

            String sql="FROM bean.Category Where catid=:id";
            Query query=s.createQuery(sql);
            query.setParameter("id",catid);
            List<String> list=query.list();
            Iterator itr=list.iterator();
            if(itr.hasNext())
            {
                bean.Category obj = (bean.Category)itr.next();
                %>
                <td>
                    <input type="text" value="<%=obj.getCatname()%>" readonly="true">
                </td>
                <%
            }
        }
    catch(Exception ex)
    {
        System.out.println(ex.getMessage());
    }
    %>
    
</tr>
<tr>
    <td>Select New Category</td>
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
        <select name="categorySelect" required>
            <option value="">--Select Category--</option>
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
<tr>
    
    <td colspan="2">
    <center>
        <input type="submit" name="action" value="Update Category">
        <input type="button" name="Back" value="Back" onclick="goBack()">
    </td>
</tr>
</table>
            </center>
</form>
        </div>
                    <jsp:include page="FooterUser.html"/>

    </body>
</html>
