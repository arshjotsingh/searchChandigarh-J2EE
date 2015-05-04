<%-- 
    Document   : ResultSingleRecord
    Created on : Nov 12, 2014, 11:24:17 AM
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
<style>
   #content a:hover{
        color: #fdd200;
    }
    
    #content a{
        text-decoration: none;
        color:#111111;
    }
    
    #content td
    {
        padding: 10px;
    }
    #content
    {
        border-color: #eee;
    }
   
    #contenttbl
    {
        float:left;
        border-collapse: separate;
        margin: 20px;
        width: 920px;
    }
    
    #srchtbl
    {
        border-collapse: separate;
        float:right;
        margin:20px;
        width: 250px;
    }
    
   
    #reviewtbl {
        border: #ccc 1px solid;
        width: 920px;
        float: left; 
        margin: 20px; 
    }
    
    
    #fdbcktbl
    {
        border-collapse: separate;
        float:right;
        margin:20px;
        width: 250px;
    }
                ::-webkit-input-placeholder { /* WebKit browsers */
               opacity: 0.7;
            }
            :-moz-placeholder { /* Mozilla Firefox 4 to 18 */

              opacity: 0.7;
            }
            ::-moz-placeholder { /* Mozilla Firefox 19+ */

               opacity: 0.7;
            }
            :-ms-input-placeholder { /* Internet Explorer 10+ */
              opacity: 0.7;
            }
    
</style>

<script>
            function validateFeedbackFrm()
            {
                var p = "Submit Feedback";
                var name=document.getElementById("fname").value;
                var sub=document.getElementById("fsub").value;
                var txt=document.getElementById("ftext").value;
                var params = "action="+p+"&fname="+name+"&fsub="+sub+"&ftxt="+txt;
                
                if(name==null || name=="" || sub==null || sub==""||txt==null || txt=="" )
                {
                    alert("Incomplete Feedback");
                }
                else
                {
                
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
                         alert(xmlhttp.responseText);
                         document.getElementById("fdbckfrm").reset();
                         
                        }
                    }
                    
                    
                    
                    //send request
                    xmlhttp.open("POST","/searchChd/Feedback_Review",true);
                    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
                    xmlhttp.send(params);
                   
                   
                }   
            }
            
            function validateReviewFrm()
            {
                var x=document.getElementById("recid").value;
                var p = "Submit Review";
                var txt=document.getElementById("rtext").value;
                var params = "action="+p+"&rtext="+txt+"&recid="+x;

                if(txt==null || txt=="")
                {
                    alert("Enter Review text");
                }
                else
                {
                
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
                         alert(xmlhttp.responseText);
                         document.getElementById("reviewfrm").reset();
                         
                        }
                    }
                    
                    
                    
                    //send request
                    xmlhttp.open("POST","/searchChd/Feedback_Review",true);
                    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
                    xmlhttp.send(params);
                   
                   
                }   
            }
            
            
            function changeMap()
            {
               
            }
            
        </script>

    </head>
    <jsp:include page="Home.jsp"></jsp:include>
    <div id="content" style="border-radius:15px;min-height:400px;" >
           
          
          
      
    <%
        Configuration cfg=new Configuration();
        SessionFactory sessionFactory=cfg.configure("hibernate.cfg.xml").buildSessionFactory();
        Session s=sessionFactory.openSession();
        Transaction transaction=s.beginTransaction();
    %>



    <%
    try
    {
        int recid=Integer.parseInt(request.getParameter("q"));
        int addid=Integer.parseInt(request.getParameter("p"));
        String sql1="From bean.Record r"
              + " where r.recid =:id";

        Query query1=s.createQuery(sql1);
        query1.setParameter("id", recid);
        List list1 = query1.list();
        Iterator itr1=list1.iterator();
%>

<%
        if(itr1.hasNext())
        {
    %>

    <%
        bean.Record recobj=(bean.Record)itr1.next();
    %>
            
                    
    <%
                //==== Fetch address data for the record 

                String sql3="From bean.Address a inner join fetch a.email e where a.addid=:id";
                Query query3=s.createQuery(sql3);
                query3.setParameter("id",addid);
                List list3 = query3.list();

                Iterator itr3=list3.iterator();
                if(itr3.hasNext())
                {
                  bean.Address addobj=(bean.Address)itr3.next();
                  if(addobj.getAddid()!=0)
                  {
    %>
    <table id="contenttbl" >
        
        <tr>
                <td colspan="3" style="border: #ccc 1px solid;font-weight: bold; font-size: 16px;padding-top:15px;padding-bottom: 14px;border-bottom: #ccc 1px solid;">
                <%=recobj.getRecname()%>(<%=addobj.getArea()%>)
            </td>
        </tr>
        <tr>
            <td style="border: #ccc 1px solid;border-top-width:0px;padding: 3px "rowspan="6">
                  <% 
                      String imgpath="";
                      if(addobj.getImgpath()!=null)
                                {
                                    imgpath=addobj.getImgpath();
                                    String[] paths=imgpath.split("web/");
                                    imgpath=paths[1];
                                    %>
                                    <a href="<%=imgpath%>"><img src="<%=imgpath%>" width="320" /></a>
                                    <%
                                }
                              else
                              {
                                  imgpath="RecordPhotos/NoImage.png";
                                  %>
                                    
                                  <a href="<%=imgpath%>"><img src="<%=imgpath%>"  width="320" /></a>
                                  
                                  <%
                              }
                  %>
               </td>
            </tr>
           <tr>
               <td style="border-bottom: #ccc 1px solid;border-right:  #ccc 1px solid;" >
                   <span><img src="css/34250.png" style="height: 32px;width: 32px" /></span>
               </td>
                <td style="border-bottom: #ccc 1px solid;border-right:  #ccc 1px solid;">
               <%=addobj.getStreet()%>,
               <%=addobj.getArea()%>,
               <%
                if(addobj.getLandmark()!=null)
                {
                    out.print(addobj.getLandmark()+",");
                }%>
               <%=addobj.getCity()%>,
               <%=addobj.getState()%>,
               <%=addobj.getCountry()%>,
               <%=addobj.getZipcode()%>
               </td>
           </tr>
           <tr>
               <td style="border-right:  #ccc 1px solid;border-bottom: #ccc 1px solid;" >
                   <span><img src="css/9243.png" style="height: 32px;width: 32px"/></span>
               </td>
               <td style="border-right:  #ccc 1px solid;border-bottom: #ccc 1px solid;">
               
               <%=addobj.getFone1()%>
               <%
                if(addobj.getFone2()!=null)
                {
                    out.print(","+addobj.getFone2());
                }%>
                    
               <%
                if(addobj.getFone3()!=null)
                {
                    out.print(","+addobj.getFone3());
                }%>
               </td>
           </tr>
           
           <tr>
               <td style="border-right:  #ccc 1px solid;border-bottom: #ccc 1px solid;" >
                   <img src="css/email20(1).png">
               </td>
                <td style="border-right:  #ccc 1px solid;border-bottom: #ccc 1px solid;" >
                       
    <%
                Set em=addobj.getEmail();
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
                <tr>
                    <td style="border-right:  #ccc 1px solid;border-bottom: #ccc 1px solid;">
                        Tags
                    </td>
                    <td style="border-right:  #ccc 1px solid;border-bottom: #ccc 1px solid;"><a href="">
                        <%=recobj.getTags()%>
                        </a>
                    </td>
                </tr>
                <tr>
                    <td style="border-right:  #ccc 1px solid;border-bottom: #ccc 1px solid;" >
                        Description
                    </td>
                    <td style="border-right:  #ccc 1px solid;border-bottom: #ccc 1px solid;">
                            <%=recobj.getDesc()%>
                        
                    </td>
                </tr>
                <tr>
                    
                    <td colspan="3">
                         <iframe   width="920"  height="350" frameborder="1"  style="border: #ccc 1px solid;"
  src="https://www.google.com/maps/embed/v1/place?key=AIzaSyBhu85iatJgdfh221zeieY6XHryxJBn23c
        &q=<%=addobj.getArea()%>,<%=addobj.getCity()%>">
</iframe>
                    </td>
                </tr>
           
    <%
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

    
<!--    <table id="srchtbl" >
        <tr>
            <th colspan="2" style="padding-top:15px;padding-bottom: 15px;border-top-left-radius:5px;border-top-right-radius:5px;border:#ccc 1px solid;">
                Search near you
            </th>
        </tr>
        <tr>
            <td style="border-left: #ccc 1px solid;">
                Find
            </td>
            <td style="border-right: #ccc 1px solid;">
                <input type="text" name="searchquery">
            </td>
        </tr>
        <tr>
            <td style="border-left: #ccc 1px solid;">
                Category
            </td>
          <td style="border-right: #ccc 1px solid;">
                <select name="">
                    <option>All Categories</option>
                    <option></option>
                </select>
            </td>
        </tr>
        <tr>
            <td style="border-left: #ccc 1px solid;">
                Your Location
            </td>
           <td style="border-right: #ccc 1px solid;">
                <select name="">
                    <option>Sector 01</option>
                    <option></option>
                </select>
            </td>
        </tr>
        <tr>
            <td style="border-left: #ccc 1px solid;">
                
            </td>
            <td style="border-right: #ccc 1px solid;">
                <input name="action" value="SearchChandigarh" type="submit"/>
            </td>
        </tr>
        <tr>
            <td style="border-bottom-left-radius: 5px;border-left: #ccc 1px solid;border-bottom: #ccc 1px solid;">
                
            </td>
            <td style="border-bottom-right-radius: 5px;border-right: #ccc 1px solid;border-bottom: #ccc 1px solid;">
                
            </td>
        </tr>
    </table>-->
    
<table>
       
    </table>
    
    
    <table id="reviewtbl">
        <form id="reviewfrm"/>
        
        <tr>
            <td colspan="3" style="font-weight: bold; font-size: 16px;padding-top:15px;padding-bottom: 14px;border-bottom: #ccc 1px solid;">
                Review(s)
            </td>
        </tr>
        
          <%
            int recid=Integer.parseInt(request.getParameter("q"));
            %>
            
                <!--Record Id to pass by ajax to servlet Feedback_review-->
            <input type="hidden" name="recid" id="recid" value="<%=recid%>" />
         
            <%

            String sql4="From bean.Review WHERE recid=:id and visible=:visible";
            Query query4=s.createQuery(sql4);
            query4.setParameter("id", recid);
            query4.setParameter("visible", false);
            
            List list4=query4.list();
            Iterator itr4=list4.iterator();
            if(itr4.hasNext())
            {
                while(itr4.hasNext())
                {
                    %>
                    <tr>
                        <td style="border-right: #ccc 1px solid;border-bottom: #ccc 1px solid;">
                            <%
                    bean.Review r=(bean.Review)itr4.next();
                    out.print("<b>"+r.getRevusrname()+"</b>&nbsp;&nbsp;&nbsp;");
                    %>
            </td>
        
             <td style="border-right: #ccc 1px solid;border-bottom: #ccc 1px solid;">
                    <%
                    out.print(r.getRevtext());
                    %>
            </td>
            <td style="border-bottom: #ccc 1px solid;">
                    <%
                    out.print(r.getPostdate());
                   %>
                   </td>
        </tr>
        <%
                }
            }     
    
        %>
        
       <tr>
           <td style="padding-top:20px;border-top: #ccc 1px solid;">
                Write review
            </td>
            
            <td colspan="2" style="padding-top:20px;border-top: #ccc 1px solid;">
                <%
         
         if(request.getSession(false)==null)
         {
             %><a href="LoginPage.jsp">Login to write a review </a>
             </td>
        </tr>
             <%
         }
         else if(request.getSession(false)!=null)
         {
           %>
           <textarea name="rtext" id="rtext" cols="77" rows="8"></textarea>
           </td>
        </tr>
           <tr>
            <td>
                
            </td>
            <td colspan="2"> 
                <input type="button" onclick="validateReviewFrm()" name="action" value="Submit Review"/>
                <input type="button" onclick="this.form.reset();"value="Clear"/>
            </td>
        </tr>
           <%
         }
         
         %>
                
            
        
    </form> 
                
    </table>
  </div>
         <jsp:include page="footer.html"/>
    </body>
</html>
