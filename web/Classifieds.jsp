<%-- 
    Document   : Classifieds
    Created on : Nov 15, 2014, 11:58:38 AM
    Author     : aa
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%-- 
    Document   : index
    Created on : Sep 26, 2014, 2:01:53 PM
    Author     : aa
--%>

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
<script>
           function showClassifiedData()
           {
               
                var img=document.getElementById("imgselect").checked;
                var cat=document.getElementById("cselect").value;
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
                        document.getElementById("maindiv").innerHTML=xmlhttp.responseText;
                    }
                }
                
                //send request
                xmlhttp.open("GET","/searchChd/ViewClassified?c="+cat+"&i="+img,true);
                xmlhttp.send();
                
            } 
            
</script>

<style>
   
   #tbl a
    {
        text-decoration: none;
        font-size: 14px;
        color: blue;
        
    }
    #tbl
    {
        margin: 20px;
    }
    #tbl td
    {
        width:600px;
        padding :10px;
    }
    #tbl1
    { border: #ccc 1px solid;
        margin: 20px;
    }
    #tbl1 td
    {
        padding: 5px;
    }
    
    
</style>
</head>
 <jsp:include page="Home.jsp"></jsp:include>
  
  <%
        Configuration cfg=new Configuration();
        SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
        Session s=sessionFactory.openSession();
        Transaction transaction=s.beginTransaction();
    %>
    <div id="content" style="border-radius:15px;min-height:400px;">
        <center><table id="tbl1" style="border-width:0px">
                <tr>
                       <th colspan="2" style="font-family:Serif; font-size:26px; text-align: center; padding-bottom: 10px ">Classifieds</th>
                </tr>
                <tr>
        <%  try
            {
                String sql="FROM bean.Category";
                Query query=s.createQuery(sql);
                List<String> list=query.list();
                Iterator itr=list.iterator();
        %>
       
    <td> Select Category
        <select id="cselect" name="cat" onchange="showClassifiedData()">
            <option value="0">All Categories</option>
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
                <td>
                    With Images
                    <input id="imgselect" type="checkbox" name="images"  onclick="showClassifiedData()"/>
                </td>
            </tr>

        </table>
        
         

    
        <div id="maindiv" >
    <%
    try
    {
        
        String temp="";
        String temptday="";
        String sql1="Select c.title, c.postdate,c.cid"
              + " From bean.Classified c"
                + " order by c.postdate desc";

        Query query1=s.createQuery(sql1);
//        query1.setParameter("name", recname);
        List<Object[]> list1 = query1.list();
        Iterator itr1=list1.iterator();
%>

<%
        if(itr1.hasNext())
        {
    %>
            
    <%
            while(itr1.hasNext())
            {
                %>
                
                         <%
                Object[] obj1=(Object[])itr1.next();
                %>
                    
                <%
                Date todaydate=new Date();
                Date clsdate=(Date)obj1[1];
                String cdate=clsdate.getDate()+clsdate.getMonth()+clsdate.getYear()+"";
                String rdate=todaydate.getDate()+todaydate.getMonth()+todaydate.getYear()+"";
                
                if(cdate.equals(rdate))
                {
                    if(cdate.equals(temptday))
                    {
                       
                    }
                    else
                    {
                        %>
                        <table id="tbl" style="border: #ccc 1px solid;"><tr><td style="border-bottom: #ccc 1px solid;">
                        <%
                        out.print("Posted Today");
                        %></td></tr><%
                                
                    }
                   %>
                   
                            <tr><td><a href="ViewClassified.jsp?q=<%=obj1[2].toString()%>"> <%out.println(obj1[0].toString());%></td></tr>
                           <%
                    temptday=cdate;
                }
                else
                {
                    
                String[] parts=new String[1];
                
                parts=obj1[1].toString().split(" ");
                
                    if(parts[0].equals(temp))
                    {
                         
                    }
                else
                    {
                        %>
                        </table><table id="tbl"  style="border: #ccc 1px solid;"><tr><td style="border-bottom: #ccc 1px solid;">
                                <%
                        out.println("Posted on : "+parts[0]);
                        %></td></tr><%
                    }
                    %>
                   
                            <tr>  <td ><a href="ViewClassified.jsp?q=<%=obj1[2].toString()%>"> <%out.println(obj1[0].toString());%></td></tr>
                           <%
                 temp=parts[0];
                }
                %><%
            }
            %></table><%
        }
    }
          catch(Exception ex)
          {
              System.out.println(ex.getMessage());
          }
    %>
        </div>              
      </center>
    </body>
</html>

    </div>
  <jsp:include page="footer.html"/>
    
</div>
</body>
</html>
