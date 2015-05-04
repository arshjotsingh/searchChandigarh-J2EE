
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

<style>
    a:hover
    {
        color: #fdd200;
    }
    a
    {
        color: #333333;
    }
    
    #indextbl td
    {
    }
    
    
    
    #tdlargetile img 
    {
        background-color: #aaa;
        padding: 40px;
    }
     #tdlargetile img:hover
    {
        background-color: #fdd200;
        padding: 40px;
    }
    #tdsmalltile img 
    {
        background-color: #aaa;
        padding: 10px;
    }
     #tdsmalltile img:hover
    {
        background-color: #fdd200;
        padding: 10px;
    }
    
    
    #submitfdbck:hover
    
    {
        background-color: #fdd200;
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
</script>
</head>
 <jsp:include page="Home.jsp"></jsp:include>
 <div id="content"  >
     <table id="indextbl" border='0' style="width: 880px;margin: 20px;">
         <tr>
             <td>
                 <img src="css/left179.png" style="margin:10px; opacity: .1;" width="64" height="64" alt="quotes2"/><br>&nbsp;&nbsp;&nbsp;
             </td>
             <td colspan="2"style="margin: 10px;font-family: serif; font-style: italic;font-size: 24px; color: #696969">
                 <br><br> <br> The object of this edict is to enlighten the present and future citizens of Chandigarh about the basic concepts of planning of the city so that they become its guardians and save it from whims of individuals. "
             </td>
             
         </tr>
         <tr>
             <td>
                 
             </td>
             <td colspan="2"style="padding-top: 10px; color: #111">
                Le Corbusier: "The Edict of Chandigarh" (1916-1960)
                
             </td>
         </tr>
         <tr>
             <td>
                 
             </td>
             <td colspan="2"id="tdlargetile" style="padding-top: 70px;">
                 <a href="Result.jsp?qry=bank">  <img src="css/bank11.png"  alt="coffee11"/></a>
                 <a href="Result.jsp?qry=Hospital"> <img src="css/hospital11.png"/></a>
                 <a href="Result.jsp?qry=school"> <img src="css/school43.png"/></a>
                <a href="Result.jsp?qry=restaurant">  <img src="css/plate7.png"/></a>
                 <a href="Result.jsp?qry=coffee"> <img src="css/hot51.png" style="padding-bottom: 43px"/></a>
             </td>
         <tr>
             <td>
                 
             </td>
             <td colspan="2"id="tdlargetile">
                  <a href="Result.jsp?qry=Malls">   <img src="css/building33.png"/>
                  <a href="Result.jsp?qry=Grocery">  <img src="css/man165(1).png" style="padding: 8px;"/></a>
                 <a href="Result.jsp?qry=Petrol Pump">   <img src="css/fuel4.png" style="padding-top: 38px;"/></a>
                 <a href="Classifieds.jsp?cat=all">   <img src="css/searching33.png"/></a>
                 <a href="Result.jsp?qry=Bus Service">    <img src="css/bus3.png" style="padding-top: 36px;"/></a>
             </td>
         </tr>
                 
            </td>
         </tr>
         <tr>
             <td>
                 
             </td>
             <td colspan="2"id="tdsmalltile"style="padding-top: 10px;">
              <a href="Result.jsp?qry=ATM">   <img src="css/atm2.png" /></a>
               <a href="Result.jsp?qry=Train Service">  <img src="css/train20 (2).png"/></a>
                <a href="Result.jsp?qry=Tuitions"> <img src="css/books30.png"/></a>
                 <a href="Result.jsp?qry=Fast Food"><img src="css/fastfood.png"/></a>
                 <a href="Result.jsp?qry=Stadium"><img src="css/stadium1.png"/></a>
                <a href="Result.jsp?qry=Pizza"> <img src="css/pizza3.png"/></a>
                 <a href="Result.jsp?qry=Police"><img src="css/standing10.png"/></a>
                <a href="Result.jsp?qry=Cinema"> <img src="css/starting.png"/></a>
                <a href="Result.jsp?qry=College"> <img src="css/students17.png"/></a>
               <a href="Result.jsp?qry=Rental">  <img src="css/dwelling1.png"/></a>
                <a href="Result.jsp?qry=Temple"> <img src="css/temple8.png"/></a>
                <a href="Result.jsp?qry=Mosque"> <img src="css/mosque6.png"/></a>
                <a href="Result.jsp?qry=Gurudwara"> <img src="css/sri1.png"style="padding: 13px;" alt="coffee11"/>
             </td>
         </tr>
         <tr>
             <td>
                 
             </td>
             <td colspan="2" style="padding-top: 40px;">
                
             </td>
         </tr>
         <tr>
             
             <td>
                 
             </td>
             <td style=" width: 380px;padding-top:00px;padding-left: 10px;padding-right: 10px;">
                 <span  style="font-family: serif; font-weight:  bold;font-size: 18px; color: #333333">
                     <u>Looking To Add Your Business</u>
                     <br>
                     </span>
                 <span  style="font-family: sans-serif;font-size: 13px; color: #333333">
                         At searchChandigarh.com, Business opens new dimensions
                         in a way of reaching consumers by providing a common 
                         platform to state your services or business.
                     </span>
             </td>
               <td style=" width: 340px;padding-top: 00px;padding-left: 20px">
                 <span  style="font-family: serif; font-weight:  bold;font-size: 18px; color: #333333">
                     <u> Want to Post A Classfied!</U>
                     <br>
                     </span >
                     <span  style="font-family: sans-serif;font-size: 13px; color: #333333">
                     Simple and informative; this is what classified should be 
                     and thats how they are at searchChandigarh.com. 
                     </span>
             </td>
             
         </tr>
         
         <tr>
             
             <td>
             </td>
             <td style=" width: 380px;padding-top:10px;padding-left: 10px;padding-right: 10px;">
                 <img src="css/Commercial-Lines-Business-Meeting.jpg" width="350" style="opacity: .4"alt="yellowcity"/>

             </td>
             <td style=" width: 340px;padding-top: 20px;padding-left: 20px">
                     <table id="fdbcktbl" >
                        <form id="fdbckfrm"/>
                        <tr>
                        <input type="hidden" value="Submit Feedback" name="myfield"/>
                            <th>
                               <!--Feedback-->
                            </th>
                        </tr>
                        <tr>

                            <td>
                                <input id="fname" type="text"  name="fdbckname" size=28 placeholder="Your Name"  />
                            </td>
                        </tr>
                        <tr>

                            <td >
                                <input id="fsub" type="text"  name="fdbcksubject" size=28 placeholder="Your Subject" />
                            </td>
                        </tr>
                        <tr>

                             <td >
                                 <textarea id="ftext" name="fdbcktext" rows="8"cols="27"placeholder="Your Feedback" ></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top:10px;text-align: center">
                                 <input id="submitfdbck"type="button" onclick="validateFeedbackFrm()" name="action" style="color: #555;border:#aaa solid thin" value="Submit Feedback" />
                            </td>
                        </tr>
                    </form>
                    </table>
             </td>
                 
         </tr>
         
         
     </table>
 </div>
 
     
     
      

        
         
    
<!--	<div id="wowslider-container1">
	<div class="ws_images"><ul>
<li><a href="http://wowslider.com/vf"><img src="data1/images/pambeeslytheoffice317961280x800.jpg" alt="full screen slider" title="pam-beesly-the-office-31796-1280x800" id="wows1_0"/></a></li>
<li><img src="data1/images/1837765.jpg" alt="1837765" title="1837765" id="wows1_1"/></li>
</ul></div>
<div class="ws_bullets"><div>
<a href="#" title="pam-beesly-the-office-31796-1280x800"><img src="data1/tooltips/pambeeslytheoffice317961280x800.jpg" alt="pam-beesly-the-office-31796-1280x800"/>1</a>
<a href="#" title="1837765"><img src="data1/tooltips/1837765.jpg" alt="1837765"/>2</a>
</div></div><span class="wsl"><a href="http://wowslider.com/vjc">jquery carousel</a> by WOWSlider.com v6.6</span>
	<div class="ws_shadow"></div>
	</div>	
	<script type="text/javascript" src="engine1/wowslider.js"></script>
	<script type="text/javascript" src="engine1/script.js"></script>
  </div>-->
      
  
  
  
                

 <jsp:include page="footer.html"/>
</div>

</body>
</html>