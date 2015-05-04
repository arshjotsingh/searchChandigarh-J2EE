<%-- 
    Document   : Home
    Created on : Oct 7, 2014, 1:10:00 PM
    Author     : aa
--%>

<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Welcome to SearchChandigarh</title>
<link href="css/adminPanel.css" rel="stylesheet" type="text/css">
<link href="css/boilerplate.css" rel="stylesheet" type="text/css">
<link href="css/Main.css" rel="stylesheet" type="text/css">
<script src="css/respond.min.js"></script>

<!--for slider start-->
<link rel="stylesheet" type="text/css" href="engine1/style.css" />
	<script type="text/javascript" src="engine1/jquery.js"></script>
<!--for slider end-->
<script>
            function showData(str){
                var area=document.getElementById("arealistSearchbar").value;
                var cat=document.getElementById("catlistSearchbar").value;
                
             
                var p=str;
                if(p=="")
                {
                    document.getElementById("searchname").innerHTML="";
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
                xmlhttp.open("GET","/searchChd/SearchBar?q="+p+"&c="+cat+"&a="+area,true);
                xmlhttp.send();
                
            }
            
        </script>
<style>
    a:hover
    {
        color: #fdd200;
    }
    a
    {
        color: #333333;
    }
    
    #submitbtn:hover
    
    {
        background-color: #fdd200;
    }
</style>
</head>
 <body>
     
     
     <%
         String welcomename=null;
         
         if(request.getSession(false)==null)
         {
             welcomename="Guest";
         }
         else if(request.getSession(false)!=null)
         {
           welcomename=request.getSession(false).getAttribute("wname").toString().toUpperCase();
         }
         
         %>
<div class="gridContainer clearfix">
  <div id="content" style="border-radius: 0px;margin-top: 0px;background-color:#FAFAFA; ">
      <span style="float: left; ">
          <a href="index.jsp" > <img src="css/logo 1.png"  alt="logo" /></a>
      </span>
      <table border="0"style="text-align: right; padding-right: 0px; float: right;margin-top: 30px">
          <tr>
              
              <td style="padding:10px 10px 10px 0px ;text-shadow:  .5px .5px  #aaa; color: #555">
                  <a href="LoginPage.jsp" style="text-decoration: none; text-shadow:  .5px .5px #aaa; ">LOGIN </a>&nbsp;|&nbsp;
                   Welcome <%= welcomename %>!  
              </td>
          </tr>
          <tr>
          <form name="frmSearchBar" action="Result.jsp" method="get">
              
              <!--Fetch Category for Search Bar-->
              
              <%!
            Configuration cfg=new Configuration();
            SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
            Session s=sessionFactory.openSession();
            Transaction transaction=s.beginTransaction();
              %>
              <td colspan="2"style="padding:10px 10px 10px 0px">
                  <input name="qry" required="" type="text" id="searchname" list="reclist" style="border:#000 solid thin"  autocomplete="off" placeholder="eg: Bank" size="25" onkeyup="showData(this.value)"/>
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
         <input id="submitbtn"type="submit" value="Search" style="border:#aaa solid thin">
              </td> 
              </form>
          </tr>
      </table>
     
          
    
</div>
              
              <!--Fetch Data for Navigation Bar-->
             
              <nav style="text-align: center;">
   <ul class="nav">

       <li><a href="index.jsp">Home</a>
     
    </li>
    <li><a href="#">ChandigarhPOINT</a>
      <ul>
        <li><a href="#">About Chandigarh</a></li>
        <li><a href="#">Sector Map</a></li>
        <li><a href="#">Cultural Fest</a></li>
        
      </ul>
    </li>
    <li><a href="#">Classifieds</a>
      <ul>
        <li><a href="#">Post Classified</a></li>
        <li><a href="Classifieds.jsp?cat=all">View Classifieds</a></li>
        
        
      </ul>
    </li>
    
    <li><a href="#">Hospitals</a>
      <ul>
          <li><a href="#">Public Hospital</a>
              <ul>
                <%
                  try
                  {
                      String sql="From bean.Record where catid=:cid";
                      Query query=s.createQuery(sql);
                      query.setParameter("cid", 1);
                      List list=query.list();
                      Iterator itr=list.iterator();
                      
                      while(itr.hasNext())
                      {
                          bean.Record obj=(bean.Record)itr.next();
                          String str=obj.getRecname();
                %>

                <li><a href="Result.jsp?qry=<%=str%>"><%=str%></a></li>

                <%
                      }
                  }
                  catch(Exception ex)
                  {
                      System.out.println(ex.getMessage());
                  }
                %>
              </ul>
        </li>
         <li><a href="#">Private Hospital</a>
      </ul>
    </li>
    
    <li><a href="#">Education</a>
      <ul>
        <li><a href="#">Schools</a>
            <ul>
                <%
                  try
                  {
                      String sql="From bean.Record where catid=:cid";
                      Query query=s.createQuery(sql);
                      query.setParameter("cid", 6);
                      List list=query.list();
                      Iterator itr=list.iterator();
                      
                      while(itr.hasNext())
                      {
                          bean.Record obj=(bean.Record)itr.next();
                          String str=obj.getRecname();
                %>

                    <li><a href="Result.jsp?qry=<%=str%>"><%=str%></a></li>

                <%
                      }
                  }
                  catch(Exception ex)
                  {
                      System.out.println(ex.getMessage());
                  }
                %>
            </ul>
        </li>
        <li><a href="#">College/Universities</a>
            <ul>
                <%
                  try
                  {
                      String sql="From bean.Record where catid=:cid";
                      Query query=s.createQuery(sql);
                      query.setParameter("cid", 5);
                      List list=query.list();
                      Iterator itr=list.iterator();
                      
                      while(itr.hasNext())
                      {
                          bean.Record obj=(bean.Record)itr.next();
                          String str=obj.getRecname();
                %>

                 <li><a href="Result.jsp?qry=<%=str%>"><%=str%></a></li>

                <%
                      }
                  }
                  catch(Exception ex)
                  {
                      System.out.println(ex.getMessage());
                  }
                %>
            </ul>
        </li>
        <li><a href="#">Coaching Centers</a></li>
        
      </ul>
    </li>
    <li><a href="#">Finance</a>
      <ul>
        <li><a href="#">Bank</a>
            <ul>
                <%
                  try
                  {
                      String sql="From bean.Record where catid=:cid";
                      Query query=s.createQuery(sql);
                      query.setParameter("cid",3);
                      List list=query.list();
                      Iterator itr=list.iterator();
                      
                      while(itr.hasNext())
                      {
                          bean.Record obj=(bean.Record)itr.next();
                          String str=obj.getRecname();
                %>

                   <li><a href="Result.jsp?qry=<%=str%>"><%=str%></a></li>

                <%
                      }
                  }
                  catch(Exception ex)
                  {
                      System.out.println(ex.getMessage());
                  }
                %>
            </ul>
        </li>
        <li><a href="#">ATMs</a></li>
        <li><a href="#">Insurance</a></li>
        
      </ul>
       
    </li>	
    <li><a href="#">Entertainment</a>
      <ul>
        <li><a href="#">Mall</a></li>
        <li><a href="#">Shopping Center</a></li>
        <li><a href="#">Movie Theater</a></li>
        
      </ul>
    </li>
    <li><a href="#">Hotels & Restaurants</a>
        <ul>
            <li><a href="#">Hotels</a>
                <ul>
                    <%
                  try
                  {
                      String sql="From bean.Record where catid=:cid";
                      Query query=s.createQuery(sql);
                      query.setParameter("cid",7);
                      List list=query.list();
                      Iterator itr=list.iterator();
                      
                      while(itr.hasNext())
                      {
                          bean.Record obj=(bean.Record)itr.next();
                          String str=obj.getRecname();
                %>

                      <li><a href="Result.jsp?qry=<%=str%>"><%=str%></a></li>

                <%
                      }
                  }
                  catch(Exception ex)
                  {
                      System.out.println(ex.getMessage());
                  }
                %>
                </ul>
            </li>
        </ul>
    </li>
    <li><a href="#">Utilities</a>
      <ul>
        <li><a href="#">Bus Services</a></li>
        <li><a href="#">Railway Information</a></li>
        <li><a href="#">Police Station</a></li>
        
      </ul>
    </li>    
   
    
  </ul>
 </nav>
                
	
  
    </body>
</html>
