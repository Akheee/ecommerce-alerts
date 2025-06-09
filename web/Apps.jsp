<%-- 
    Document   : Apps
    Created on : 4 Apr, 2021, 12:15:57 PM
    Author     : KishanVenky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>OPTIMIZING APP ALERTS FOR A SUPERIOR E-COMMERCE EXPERIENCE</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h3><a href="#">OPTIMIZING APP ALERTS FOR <small> <br> A SUPERIOR E-COMMERCE EXPERIENCE</small></a></h3>
      </div>
      <div class="menu_nav">
        <ul>
          <li><a href="index.html">Home</a></li>
          <li class="active"><a href="Apps.jsp">Apps</a></li>
          <li><a href="Users.jsp">Users</a></li>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="htext">
        <h2>OPTIMIZING APP ALERTS FOR A SUPERIOR E-COMMERCE EXPERIENCE</h2>
        
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
         </div>
        <div class="article">
          <h2><span></span></h2>
          <div class="clr">
              <h2>Apps Login Here</h2>
            <form name="login" action="AppsAction.jsp" method="post">
              <table cellpadding="10px" >
                              <tr><td><select name="apps" required>
                                          <option></option>
                                          <option value="Flipkart">Flipkart</option>
                                          <option value="Amazon">Amazon</option>
                                         
                          </select></td></tr>
                
                  <tr><td><input type="text" name="username" placeholder="UserName" required></input></td></tr>
              <tr><td><input type="password" name="password"  placeholder="Password"  required></input></td></tr>
              <tr><td><input type="Submit" value="Login"></input></td></tr>
                </table>
              </form>
          </div>
          </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star"><span></span> </h2>
          <div class="clr"></div>
              
        </div>
        <div class="gadget">
         
          <div class="clr"></div>
          
      <h2>Apps Registration Here</h2>
           <form name="login" action="AppsRegAction.jsp" method="post">
              <table cellpadding="10px" >
                  <tr><th>Select App</th><td><select name="apps" required style="width:170px;">
                                          <option></option>
                                          <option value="Flipkart">Flipkart</option>
                                          <option value="Amazon">Amazon</option>
                                         
                          </select></td></tr>
               <tr><th>Email</th><td><input type="email" name="email"  placeholder="Email"  required></input></td></tr>
                <tr><th>Address</th><td><input type="text" name="address"  placeholder="Address"  required></input></td></tr>
          
                  <tr><th>UserName</th><td><input type="text" name="username" placeholder="UserName" required></input></td></tr>
              <tr><th>Password</th><td><input type="password" name="password"  placeholder="Password"  required></input></td></tr>
              <tr><th></th><td><input type="Submit" value="Registration"> </input></td></tr>
                </table>
              </form>
          
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  
  <div class="footer">
    <div class="footer_resize">
      
      <div class="clr"></div>
    </div>
  </div>
</div>
</html>

