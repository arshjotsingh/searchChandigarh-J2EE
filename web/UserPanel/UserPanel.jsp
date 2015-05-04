<%-- 
    Document   : UserPanel
    Created on : Oct 7, 2014, 1:33:18 PM
    Author     : aa
--%>

<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="false" %>
 <%
            String welcomename=null;
         
         if(null==request.getSession(false))
         {
             response.sendRedirect("../LoginPage.jsp");
         }
         else if(request.getSession(false)!=null)
         {
             System.out.print("inside else");
           welcomename=request.getSession(false).getAttribute("wname").toString().toUpperCase();
         }
            
            %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UserPanel</title>
        <link href="../css/boilerplate.css" rel="stylesheet" type="text/css">
<link href="../css/Main.css" rel="stylesheet" type="text/css">
<link href="../css/adminPanel.css" rel="stylesheet" type="text/css">

<script src="css/respond.min.js"></script>
</head>
<body>
<div class="gridContainer clearfix">
  <div id="content" style="background-color:#FAFAFA;border-radius:0px;margin-top:0px">
 <span style="float: left; ">
       <a href="../index.jsp" > <img src="../css/logo 1.png"  alt="logo" /></a>
      </span>
      <table border="0"style="text-align: right; padding-right: 10px; float: right;margin-top: 30px">
          <tr>
              
              <td style="padding:10px 10px 10px 0px ;text-shadow:  .5px .5px  #aaa; color: #555">
                  <a href="../LoginPage.jsp" style="text-decoration: none; text-shadow:  .5px .5px #aaa; color: #555">LOGIN </a>&nbsp;|&nbsp;
                   Welcome <%= welcomename %>!  
              </td>
          </tr>
          <tr>
          <form name="frmSearchBar" action="../Result.jsp" method="get">
              
              <!--Fetch Category for Search Bar-->
              
              <%
            Configuration cfg=new Configuration();
            SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
            Session s=sessionFactory.openSession();
            Transaction transaction=s.beginTransaction();
              %>
              <td colspan="2"style="padding:10px 10px 10px 0px">
                  <input name="qry" type="text" id="searchname" list="reclist" style="border:#000 solid thin"  autocomplete="off" placeholder="eg: Bank" size="25" onkeyup="showData(this.value)"/>
                   <datalist id="reclist">
            </datalist>
                  <select id="catlistSearchbar" style="border:#000 solid thin">
                      <option value="">All Categories</option>
                  <%
                  try
                  {
                      String sql="From bean.Category c";
                      Query query=s.createQuery(sql);
                        List list = query.list();
                        
                      Iterator itr=list.iterator();
                      
                      while(itr.hasNext())
                      {
                          bean.Category obj=(bean.Category)itr.next();
                          String str=obj.getCatname();
                          int i=obj.getCatid();
                %>

                <option value="<%=i%>"><%=str%></option>

                <%
                      }
                  }
                  catch(Exception ex)
                  {
                      System.out.println(ex.getMessage());
                  }
                %>
         </select>
          <select id="arealistSearchbar" style="border:#000 solid thin">
                      <option value="">All Areas</option>
                  <%
                  try
                  {
                      String sql="Select distinct area From bean.Address ";
                      Query query=s.createQuery(sql);
                      List list=query.list();
                      Iterator itr=list.iterator();
                      
                      while(itr.hasNext())
                      {
                          String str=itr.next().toString();
                          
                %>

                <option value="<%=str%>"><%=str%></option>

                <%
                      }
                  }
                  catch(Exception ex)
                  {
                      System.out.println(ex.getMessage());
                  }
                %>
         </select>
         <input type="submit" value="Search" style="border:#000 solid thin">
              </td> 
              </form>
          </tr>
      </table>
</div>

  <nav>
   <ul class="nav" style="min-width: 0px;">
       <li><a href="UserPanelWelcome.jsp">Home Panel</a>
    
    <li><a href="#">Add Classifieds</a>
      <ul>
          <li><a href="PostClassified.jsp">Post New Classified</a></li>
          <li><a href="EditClassified.jsp">Edit Classified</a></li>
        
      </ul>
    </li>
<!--    <li><a href="#">Add Business/Service</a>
      <ul>
        <li><a href="#">Add a new Business</a></li>
        <li><a href="#">Edit a Business</a></li>
        
      </ul>
    </li>-->
    
    
    <li><a href="../LogoutServ">Logout</a></li>
    
  </ul>
 </nav>
 
</body>
</html>

