<%-- 
    Document   : Result
    Created on : Nov 4, 2014, 11:29:52 AM
    Author     : aa
--%>

<%@page import="java.util.Set"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.lang.Object"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SearchChandigarh Portal </title>
   <link href="css/adminPanel.css" rel="stylesheet" type="text/css">
<link href="css/boilerplate.css" rel="stylesheet" type="text/css">
<link href="css/Main.css" rel="stylesheet" type="text/css">
<style>
   #content a:hover{
        color: #fdd200;
    }
    
    #content a{
        text-decoration: none;
        color:#111111;
    }
    
   
    
    
</style>

    </head>
    <jsp:include page="Home.jsp"></jsp:include>
  
  <div id="content" style="border-radius:15px;min-height:400px;">
       <center>
           <table style="margin-top:20px">
          <tr>
            <th colspan="3" style="font-family:Serif; font-size:26px; text-align: center ">
                Search Result for "<%=request.getParameter("qry")%>"
            </th>
        </tr>
     
          
      
    <%
        Configuration cfg=new Configuration();
        SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
        Session s=sessionFactory.openSession();
        Transaction transaction=s.beginTransaction();
    %>



    <%
    try
    {
        String recname="%"+request.getParameter("qry")+"%";
        String sql1="Select r.recid, r.recname"
              + " From bean.Record r"
              + " where r.recname like :name";

        Query query1=s.createQuery(sql1);
        query1.setParameter("name", recname);
        List<Object[]> list1 = query1.list();
        Iterator itr1=list1.iterator();
%>
<tr>
    <td> Query Found : 
</tr>
<%
        if(itr1.hasNext())
        {
    %>
        <center>

    <%
            while(itr1.hasNext())
            {
                Object[] obj1=(Object[])itr1.next();
                int recid=Integer.parseInt(obj1[0].toString());

    %>
            
                    
    <%
                int addid=0;
                String sql2="Select addid from bean.Address where recid=:id";
                Query query2=s.createQuery(sql2);
                query2.setParameter("id",recid);
                List list2 = query2.list();
                Iterator itr2=list2.iterator();
                if(itr2.hasNext())
                {
                     addid=(Integer)itr2.next();
                }

                //==== Fetch address data for each record LIKE

                String sql3="From bean.Address a inner join fetch a.email e where a.addid=:id";
                Query query3=s.createQuery(sql3);
                query3.setParameter("id",addid);
                List list3 = query3.list();

                Iterator itr3=list3.iterator();
                if(itr3.hasNext())
                {
                  bean.Address obj3=(bean.Address)itr3.next();
                  if(obj3.getAddid()!=0)
                  {
    %>
    <table  style="border-collapse: separate;margin: 20px;width: 500px">
        
        <tr>
            <td colspan="3" style="border: #696969 1px solid; border-top-left-radius: 10px; border-top-right-radius: 10px;text-align: center;font-size: 14px;padding: 5px; background-color:#404040  ; color: #FAFAFA" >
                <a href="ResultSingleRecord.jsp?q=<%=recid%>&p=<%=addid%>"><%=obj1[1]%>(<%=obj3.getArea()%>)</a>
            </td>
        </tr>
        <tr>
            <td style="border-bottom-left-radius: 10px; border: #696969 1px solid;border-top-width:0px;padding: 3px "rowspan="4">
                  <% 
                      String imgpath="";
                      if(obj3.getImgpath()!=null)
                                {
                                    imgpath=obj3.getImgpath();
                                    String[] paths=imgpath.split("web/");
                                    imgpath=paths[1];
                                    System.out.println(imgpath);
                                    %>
                                    <a href="<%=imgpath%>"><img src="<%=imgpath%>" width="150" /></a>
                                    <%
                                }
                              else
                              {
                                  imgpath="RecordPhotos/NoImage.png";
                                  %>
                                    
                                  <a href="<%=imgpath%>"><img src="<%=imgpath%>"  width="150" /></a>
                                  
                                  <%
                              }
                  %>
               </td>
            </tr>
           <tr>
               <td>
                   <span><img src="css/34250.png" style="height: 32px;width: 32px" /></span>
               </td>
                <td style="border-right:  #696969 1px solid;">
               <%=obj3.getStreet()%>,
               <%=obj3.getArea()%>,
               <%=obj3.getLandmark()%>,
               <%=obj3.getCity()%>,
               <%=obj3.getState()%>,
               <%=obj3.getCountry()%>,
               <%=obj3.getZipcode()%>
               </td>
           </tr>
           <tr>
               <td>
                   <span><img src="css/9243.png" style="height: 32px;width: 32px"/></span>
               </td>
               <td style="border-right:  #696969 1px solid;">
               
               <%=obj3.getFone1()%>
               <%
                if(obj3.getFone2()!=null)
                {
                    out.print(","+obj3.getFone2());
                }%>
                    
               <%
                if(obj3.getFone3()!=null)
                {
                    out.print(","+obj3.getFone3());
                }%>
               </td>
           </tr>
           <tr>
               <td style="border-bottom: #696969 1px solid;">
                   <img src="css/email20(1).png">
               </td>
                <td style="border-bottom-right-radius: 10px;border: #696969 1px solid;border-top-width:0px;border-left-width: 0px">
                       
    <%
                Set em=obj3.getEmail();
                Iterator itr4=em.iterator();
                if(itr4.hasNext())
    %>
           
    <%                                    
                while(itr4.hasNext())
                {
                    bean.Email email=(bean.Email)itr4.next();
                    out.print(" "+email.getEmailadd()+" ");
                }
    %>
                </td>
                </tr>
            </table>
    <%
                  }
                }
              }
            }
          }
          catch(Exception ex)
          {
              System.out.println(ex.getMessage());
          }
    %>
                  
      </table>
    </center>
    </div>
    
    <jsp:include page="footer.html"/>
    </body>
</html>
