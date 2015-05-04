<%-- 
    Document   : RegisterPage
    Created on : Sep 29, 2014, 12:19:28 PM
    Author     : aa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <style>
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
            
            function validateForm(){
                
               var uname=document.getElementById("username");
               var pwd=document.getElementById("password");
               
               var repwd=document.getElementById("repassword");
               var zip=document.getElementById("zipcode");
               var fone=document.getElementById("contactno");
               var lbl1=document.getElementById("lbl1");
              
               if(uname.value.length<4)
               {
                   lbl1.innerHTML="Username too short";
                    uname.focus();
                   return false;
               }
               
               if(pwd.value.length<4)
               {
                   lbl1.innerHTML="Password too short";
                    pwd.focus();
                   return false;
               }
               
               if(pwd.value!==repwd.value)
               {
                  lbl1.innerHTML="Password don't match";
                   pwd.focus();
                   return false;
               }
               
               var numbers = /^[0-9]+$/;  
                if(zip.value.match(numbers))  
                {  

                }  
                else  
                {  
                    lbl1.innerHTML="ZIP code must have numeric characters only";
                    zip.focus();
                    return false;  
                }  
                
                if(fone.value.match(numbers))  
                {  

                }  
                else  
                {  
                    lbl1.innerHTML="Contact no must have numeric characters only";
                    fone.focus();
                    return false;  
                }  

               

               return true;
                
            }
            
            
        </script>
</head>
<body>
    <jsp:include page="Home.jsp"></jsp:include>
    <div id="content">
        <form name="registerform" action="SignupServ" method="post" onsubmit="return validateForm();" enctype="multipart/form-data" >
                    
                <center>
                <table border="0" cellpadding="7" style="margin-top:30px" >
                <tr>
                    <th colspan="2" style="font-family:Serif; font-size:26px; text-align: center ;">Register New Account </th>
                </tr>
                </table>
                    <table border="0" cellpadding="7" style="margin-top:30px" >
                        
                        <tr>
                            <td>Name</td>
                            <td><input type="text" name="firstname" placeholder="FirstName" size="7" required="" ><input type="text" name="lastname" placeholder="LastName" size="7"  required=""></td>
                            
                        </tr>
                        
                        <tr>
                            <td>Date of Birth</td>
                            <td>
                                <select id="form_dob_month" name="dob_month"  required="">
                                    <option value="">Month</option>
                                    <option value="1">January</option>
                                    <option value="2">February</option>
                                    <option value="3">March</option>
                                    <option value="4">April</option>
                                    <option value="5">May</option>
                                    <option value="6">June</option>
                                    <option value="7">July</option>
                                    <option value="8">August</option>
                                    <option value="9">September</option>
                                    <option value="10">October</option>
                                    <option value="11">November</option>
                                    <option value="12">December</option>
                                </select>
                                <select id="form_dob_day" name="dob_day"  required="">
                                    <option value="">Day</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                                    <option value="19">19</option>
                                    <option value="20">20</option>
                                    <option value="21">21</option>
                                    <option value="22">22</option>
                                    <option value="23">23</option>
                                    <option value="24">24</option>
                                    <option value="25">25</option>
                                    <option value="26">26</option>
                                    <option value="27">27</option>
                                    <option value="28">28</option>
                                    <option value="29">29</option>
                                    <option value="30">30</option>
                                    <option value="31">31</option>
                                </select>
                                <select id="form_dob_year" name="dob_year" required="" >
                                    <option value="">Year</option>
                                    <option value="2011">2011</option>
                                    <option value="2010">2010</option>
                                    <option value="2009">2009</option>
                                    <option value="2008">2008</option>
                                    <option value="2007">2007</option>
                                    <option value="2006">2006</option>
                                    <option value="2005">2005</option>
                                    <option value="2004">2004</option>
                                    <option value="2003">2003</option>
                                    <option value="2002">2002</option>
                                    <option value="2001">2001</option>
                                    <option value="2000">2000</option>
                                    <option value="1999">1999</option>
                                    <option value="1998">1998</option>
                                    <option value="1997">1997</option>
                                    <option value="1996">1996</option>
                                    <option value="1995">1995</option>
                                    <option value="1994">1994</option>
                                    <option value="1993">1993</option>
                                    <option value="1992">1992</option>
                                    <option value="1991">1991</option>
                                    <option value="1990">1990</option>
                                    <option value="1989">1989</option>
                                    <option value="1988">1988</option>
                                    <option value="1987">1987</option>
                                    <option value="1986">1986</option>
                                    <option value="1985">1985</option>
                                    <option value="1984">1984</option>
                                    <option value="1983">1983</option>
                                    <option value="1982">1982</option>
                                    <option value="1981">1981</option>
                                    <option value="1980">1980</option>
                                    <option value="1979">1979</option>
                                    <option value="1978">1978</option>
                                    <option value="1977">1977</option>
                                    <option value="1976">1976</option>
                                    <option value="1975">1975</option>
                                    <option value="1974">1974</option>
                                    <option value="1973">1973</option>
                                    <option value="1972">1972</option>
                                    <option value="1971">1971</option>
                                    <option value="1970">1970</option>
                                    <option value="1969">1969</option>
                                    <option value="1968">1968</option>
                                    <option value="1967">1967</option>
                                    <option value="1966">1966</option>
                                    <option value="1965">1965</option>
                                    <option value="1964">1964</option>
                                    <option value="1963">1963</option>
                                    <option value="1962">1962</option>
                                    <option value="1961">1961</option>
                                    <option value="1960">1960</option>
                                    <option value="1959">1959</option>
                                </select>
                            </td>
                            
                        </tr>
                        <tr>
                            <td>Gender</td>
                            <td><input type="radio" name="gender" value="Male" checked="true"  >Male&nbsp;&nbsp;<input type="radio" name="gender" value="Female">Female</td>
                            
                        </tr>
                        <tr>
                            <td>Username</td>
                            <td><input id="username" type="text" name="username" placeholder="Enter Username"required=""  >(min. 4 characters)</td>
                            
                        </tr>
                        <tr>
                            <td>Password</td>
                            <td><input id="password" type="password" name="password" placeholder="Enter Password" required=""  >(min. 4 characters)</td>
                            
                        </tr>
                        <tr>
                            <td>Re Password</td>
                            <td><input id="repassword" type="password" name="repassword" placeholder="Confirm Password"  required=""></td>
                            
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><input id="email" type="email" name="email" placeholder="Enter EmailAddress"required=""  ></td>
                            
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td><textarea name="address" rows="3" cols="30"  style="resize: none;"required="" ></textarea></td>
                            
                        </tr>
                        <tr>
                            <td>City</td>
                            <td><input name="city" type="text" placeholder="Enter City"required=""></td>
                        </tr>
                        <tr>
                            <td>State</td>
                            <td><input name="state" type="text" placeholder="Enter State"required=""></td>
                        </tr>
                        <tr>
                            <td>Country</td>
                            <td><input name="country" type="text" placeholder="Enter Country"required=""></td>
                        </tr>
                        <tr>
                            <td>Zip Code</td>
                            <td><input id="zipcode" name="zipcode" type="number" placeholder="Enter Zipcode"required=""></td>
                        </tr>
                        <tr>
                            <td>Contact No</td>
                            <td><input id="contactno" name="contactno" type="text" placeholder="Enter PhoneNo"required=""></td>
                        </tr>
                        <tr>
                            <td>Add Image</td>
                            <td><input type="file" name="userimage"></td>
                        </tr>
                        <tr>
                            <td  colspan="2" align="center"><input style="padding-left: 20px;padding-right: 20px;" type="submit" value="Register">
                            <input style="padding-left: 20px;padding-right: 20px;" type="reset" value="Clear">    
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"style="text-align: center;">
                                <label id="lbl1" style="color: red"></label>
                            </td>
                        </tr>
                    </table>
    </div>
    <jsp:include page="footer.html"/>
</div>

    </body>
</html>
