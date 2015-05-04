<%-- 
    Document   : PostInfo
    Created on : Sep 30, 2014, 1:46:38 PM
    Author     : aa
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="false" %>
    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post Record Info Page</title>
        <script>
            
            function showUser(str){
                var p=str;
                if(str="")
                {
                    document.getElementById("abc").innerHTML="";
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
                        
                        document.getElementById("recordSelect").innerHTML=xmlhttp.responseText;
                       
                    }
                }
                
                
               
                //send request
                xmlhttp.open("GET","/searchChd/PostInfo?q="+p+"&action=getRecord",true);
                xmlhttp.send();

            }
            
            function showRecordID(st)
            {
              var rid=st;
              document.getElementById("recid").value=rid;
                
            }
            
        </script>
    </head>
    <body>
        <jsp:include page="AdminPanelWelcome.jsp"></jsp:include>
        
        <div id="content" style="height:auto; border-radius:15px" >
            <form name="form_postcatinfo" method="post" action="/searchChd/PostInfo" enctype="multipart/form-data">
                <input type="hidden" name="PostHidden"  value="hiddenCatid"/>
                
                <center>
                    <table border="0"cellpadding="10" cellspacing="10" style="float:left; margin:20px;width: 940px">
                        <tr>
                            <th colspan="4" style="font-family:Serif; font-size:26px;  ">
                                Add Record Details
                            </th>
                        </tr>
                    </table>
                    <table border="0"cellpadding="8" cellspacing="8"  style="float:left;margin-left: 40px ;width: 460px">
                        
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
                    List list=query.list();

                    Iterator itr=list.iterator();
        %>
       
                    <td>
                        
                        <select name="categorySelect" onchange="showUser(this.value)" required>
                            <option value="" selected>--Select Category--</option>
                            
        <%
        
        while(itr.hasNext())
        {
            bean.Category obj = (bean.Category)itr.next();
           
        %>
            <option value="<%=obj.getCatid()%>"> <%=obj.getCatname() %></option>
             
             <%
        }
        
        
            
        
        s.close();
        }
        catch(Exception ex)
        {
            System.out.println(ex);      
                    
        }
        %>
                        </select>
                        
                        <a href="AddCategory.jsp" style="color:blue; text-decoration: none">Add New Category</a>
                    </td>
                </tr>
               <form name="form_2" method="get" action="/searchChd/PostInfo">
                <input type="hidden" name="r"  value="frm2"/>  
                <input type="hidden" id="recid" name="recordid" value="">
                <tr>
                    <td>Select Record</td>
                
                    <td>
                        <select id="recordSelect" onchange="showRecordID(this.value)">
                            <option value="">--Select Record--</option>
                        </select>
                        <a href="AddRecord.jsp" style="color:blue; text-decoration: none">Add New Record</a>
                    </td>
                </tr>
                
                <tr>
                    <th style="font-family:Serif; font-size:18px;">Address</th>
                </tr>
                
                <tr>
                    <td>Street 1</td>
                    <td><input name="street1" type="text" required></td>
                </tr>
                 <tr>
                    <td>Street 2</td>
                    <td><input name="street2" type="text" >(optional)</td>
                </tr>
                <tr>
                    <td>Landmark</td>
                    <td><input name="landmark" type="text">(optional)</td>
                </tr>
                <tr>
                    <td>City</td>
                    <td><input name="city" type="text" required></td>
                </tr>
                 <tr>
                    <td>State</td>
                    <td><input name="state" type="text" required></td>
                </tr>
                <tr>
                    <td>Country</td>
                    <td>
                        <select name="country">
                            <option value="India">India</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Zip Code</td>
                    <td><input name="zip" type="text" required></td>
                </tr>
                    </table>
                         <table border="0"cellpadding="8" cellspacing="8" style="float: left;margin-right: 20px ;width: 420px">
                <tr>
                    <th style="font-family:Serif; font-size:18px;">Contact No</th>
                </tr>
                <tr>
                    <td>Phone 1</td>
                    <td><input name="contact1" type="text" required></td>
                <tr>
                    <td>Phone 2</td>
                    <td><input name="contact2" type="text">(optional)</td>
                </tr>    
                <tr>    
                    <td>Phone 3</td>
                      <td><input name="contact3" type="text" >(optional)</td>
                </tr>
                
               
                <tr>
                      <th style="font-family:Serif; font-size:18px;">E-Contact</th>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input name="email1" type="text" >(optional)</td>
                <tr>
                    <td>Email 2</td>
                    <td><input name="email2" type="text" >(optional)</td>
                </tr>
                <tr>
                    <td>Email 3</td>
                     <td><input name="email3" type="text" >(optional)</td>
                </tr>
                   
                
                <tr>
                    <td>Web Site</td>
                    <td><input name="website" type="text" >(optional)</td>
                </tr>
                 <tr>
                     <td style="font-family:Serif; font-size:16px;font-weight: bold">Add Image</td>
                    <td><input type="file" name="recimage"/></td>
                </tr>
                
            </table>
            <table border="0"cellpadding="10" cellspacing="10" style="float:left; margin:20px;width:970px;">
                <tr>
                    <td>
                <center>
                    <input type="submit" name="action" value="Add Record">
                    <input type="reset" value="clear">
                </center>
                    </td>
                </tr>
            </table>
                </center>
                         
                   
            </form>
        </div>
                         <jsp:include page="FooterAdmin.html"/>
                       
    </body>
</html>
