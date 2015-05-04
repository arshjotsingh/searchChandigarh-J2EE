<%-- 
    Document   : ViewClassified
    Created on : Nov 20, 2014, 1:41:52 PM
    Author     : aa
--%>

<%@page import="bean.Record"%>
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
<script>
    
    function changeImage(str)
    {
        document.getElementById("imglarge").src=str;
    }
    function goBack() 
    {
     window.history.back();
    }
    
</script>
<style>
    #classifiedtable
    {
        width: 93%;
        margin: 40px;
    }
    
    #classifiedtable td
    {
        border: #ccc 1px solid;
    }
    
    #classifiedtable tr
    {
        border: #ccc 1px solid;
    }
    
</style>
    

<jsp:include page="Home.jsp"></jsp:include>
    </head>
  <div id="content" style="border-radius:15px;min-height:400px;">
      <table id="classifiedtable">
          
              
  <%
        int cid=Integer.parseInt(request.getParameter("q"));
        String imgpath1="";
        String imgpath2="";
        String imgpath3="";
        String imgpath4="";
        Configuration cfg=new Configuration();
        SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
        Session s=sessionFactory.openSession();
        Transaction transaction=s.beginTransaction();
        
        Query q=s.createQuery("From bean.Classified where cid=:id");
        q.setParameter("id", cid);
        List list1 = q.list();
        Iterator itr=list1.iterator();
        
        if(itr.hasNext())
        {
            bean.Classified obj=(bean.Classified)itr.next();
            
            %>
            </td>
                            <tr>
                                <td style="padding: 15px;font-size: 19px; font-weight: bold;color: #111111">
                                    <%=obj.getTitle()%>
                                </td>
                            </tr>
                            
          
            <%
            
            if(obj.getImg1()!=null)
                        {
                            imgpath1=obj.getImg1();
                            String[] paths=imgpath1.split("web/");
                            imgpath1=paths[1];
                            %>
                            <tr>
                                <td>
                            <a href="<%=imgpath1%>"><img style="margin-bottom:1px" id="imglarge" height='350' src="<%=imgpath1%>" alt='image1'></img></a><br>
                             <a href="<%=imgpath1%>"><img style='margin-right:-1px' onmouseover="changeImage(this.src)" width='190' height='150' alt='image' src="<%=imgpath1%>" alt='image1'></img></a>
        
                            <%
                        }
                        if(obj.getImg2()!=null)
                        {
                            imgpath2=obj.getImg2();
                            String[] paths=imgpath2.split("web/");
                            imgpath2=paths[1];
                            %>
                            <a href="<%=imgpath2%>"><img style='margin-right:-1px' onmouseover="changeImage(this.src)" width='190' height='150' alt='image' src="<%=imgpath2%>" alt='image1'></img></a>
                            <%
                        }
                        if(obj.getImg3()!=null)
                        {
                            imgpath3=obj.getImg3();
                            String[] paths=imgpath3.split("web/");
                            imgpath3=paths[1];
                            %>
                            <a href="<%=imgpath3%>"><img style='margin-right:1px' onmouseover="changeImage(this.src)" width='190' height='150' alt='image' src="<%=imgpath3%>" alt='image1'></img></a>
                            <%
                        }
                        if(obj.getImg4()!=null)
                        {
                            imgpath4=obj.getImg4();
                            String[] paths=imgpath4.split("web/");
                            imgpath4=paths[1];
                            %>
                            <a href="<%=imgpath4%>"><img style='margin-right:1px' onmouseover="changeImage(this.src)" width='190' height='150' alt='image' src="<%=imgpath4%>" alt='image1'></img></a>
                            <%
                        }
                %>
                                
                                
                        </td>
                            <tr>
                                <td style="padding: 15px;font-weight: bold;font-size: 16px; color: #222">
                                Description
                                </td>
                            <tr>
                                <td style="padding: 15px;font-size: 16px;font-family: serif ;color: #333">
                                    <%=obj.getDesc()%><br><br>
                                    <span style="font-weight: bold;font-size: 16px; color: #222"> Contact -&nbsp;&nbsp; </span> <%=obj.getUname()%>&nbsp;&nbsp;<%=obj.getUcontact()%>
                                </td>
                            </tr>
                            
                            
                            
                            <%
               
        }
        
    %>
    
                            
      </table>
  </div>
    
     <jsp:include page="footer.html"/>
    
    </body>
</html>
