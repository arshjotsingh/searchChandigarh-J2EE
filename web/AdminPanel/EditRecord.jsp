<%-- 
    Document   : EditRecord
    Created on : Oct 16, 2014, 1:43:53 PM
    Author     : aa
--%>
<%@page import="org.hibernate.SQLQuery"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
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
        <title>Edit Record </title>
        <style>
            table.hovertable 
            {
                
	font-family: verdana,arial,sans-serif;
	font-size:12px;
	color:#333333;
	border-width: 1px;
	border-color: #696969;
        border-style: groove;
}   
table.hovertable th {
	/*background-color:#FFA500;*/
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #696969;
}
table.hovertable tr {
	background-color:#FAFAFA;
}
table.hovertable td {
	border-width: 1px;
	/*padding: 8px;*/
	border-style: groove;
	border-color: #696969;
}
        </style>
    </head>
    <body>
        <jsp:include page="AdminPanelWelcome.jsp"></jsp:include>
        <div id="content" style="min-height:400px; border-radius:15px">
            <form name="form_editRecord" action="EditRecordForm.jsp" method="get">
            <center>
            <table class="hovertable" cellpadding="6" cellspacing="6" style="margin:20px 20px 20px 20px">
          
            <tr>
                <th colspan="15" style="font-family:Serif; font-size:26px; text-align: center ">
                    Edit Record
                </th>
            </tr>
            <tr>
                <td>
                    Sort by : 
                </td>
                <td colspan="6">
                    <a href="EditRecord.jsp?srt=rid">Record ID</a>
                    <a href="EditRecord.jsp?srt=rnm">Record Name</a>
                    <a href="EditRecord.jsp?srt=cid">Category ID</a>
                    <a href="EditRecord.jsp?srt=area">Area</a>
                </td>
            </tr>
                
            <tr>
                <td>
                    Record ID
                </td>
                <td>
                    Record Name
                </td>
                <td>
                    Category Id
                </td>
                <td>
                    Street
                </td>
                <td>
                    Area
                </td>
                <td>
                    City
                </td>
                <td>
                    
                </td>
            </tr>
            <tr>
        <%
            try
            {
            
                Configuration cfg=new Configuration();
                SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
                Session s=sessionFactory.openSession();
                Transaction transaction=s.beginTransaction();
                
                String orderby=request.getParameter("srt");
                String sql="";
               
                   if(orderby.equals("rid"))
                    {
                        sql="Select r.recid,r.recname,r.catid,a.street,a.area,a.city,a.addid"
                            + " From bean.Record r,bean.Address a"
                           + " where r.recid=a.recid order by r.recid";
                    }

                   else if(orderby.equals("rnm"))
                    {
                        sql="Select r.recid,r.recname,r.catid,a.street,a.area,a.city,a.addid"
                            + " From bean.Record r,bean.Address a"
                           + " where r.recid=a.recid order by r.recname";
                    }

                   else if(orderby.equals("cid"))
                    {
                         sql="Select r.recid,r.recname,r.catid,a.street,a.area,a.city,a.addid"
                            + " From bean.Record r,bean.Address a"
                           + " where r.recid=a.recid order by r.catid";
                    }
                    else if(orderby.equals("area"))
                    {
                         sql="Select r.recid,r.recname,r.catid,a.street,a.area,a.city,a.addid"
                            + " From bean.Record r,bean.Address a"
                           + " where r.recid=a.recid order by a.area";
                    }
                    else
                    {
                        sql="Select r.recid,r.recname,r.catid,a.street,a.area,a.city,a.addid"
                            + " From bean.Record r left outer join bean.Address a"
                           + " on r.recid=a.recid ";
                    }
                    
                Query query=s.createQuery(sql);
                List<Object[]> list=query.list();
                Iterator itr=list.iterator();
                
                while(itr.hasNext())
                {
                    %>
                <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#FFF';">
               
                    <%
                    Object[] obj=(Object[])itr.next();
                    
                    %>
                    <td>
                        <%=obj[0]%>
                    </td>
                    <td>
                        <%=obj[1]%>
                    </td>
                    <td>
                        <%=obj[2]%>
                    </td>
                    <td>
                        <%=obj[3]%>
                    </td>
                    <td>
                        <%=obj[4]%>
                    </td>
                     <td>
                        <%=obj[5]%>
                    </td>
                    <td>
                        <a href="EditRecordForm.jsp?q=<%=obj[0]%>&p=<%=obj[6]%>">Edit/Delete</a>
                    </td>
                        </tr>
                    <%
                }
                
                s.close();
            }
                  
            catch(Exception ex)
            {
                  System.out.println(ex.getMessage());
            }
        %>
            </tr>
            
            </table>       
            </center>
            </form>
        </div> 
             <jsp:include page="FooterAdmin.html"/>
    </body>
</html>
