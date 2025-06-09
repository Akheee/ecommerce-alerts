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
        <h3><a href="#">OPTIMIZING APP ALERTS FOR <br><small>A SUPERIOR E-COMMERCE EXPERIENCE</small></a></h3>
      </div>
      <div class="menu_nav">
        <ul>
          <li><a href="index.html">Home</a></li>
          <li><a href="Apps.jsp">Apps</a></li>
          <li class="active"><a href="Users.jsp">Users</a></li>
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
          <h2>User Login</h2>
          <form name="login" action="UserAction.jsp" method="post">
            <table cellpadding="10">
              <tr><td><input type="text" name="username" placeholder="UserName" required /></td></tr>
              <tr><td><input type="password" name="password" placeholder="Password" required /></td></tr>
              <tr><td><input type="submit" value="Login" /></td></tr>
            </table>
          </form>
        </div>
      </div>

      <div class="sidebar">
        <div class="gadget">
          <h2>User Registration</h2>
          <form name="register" action="UserRegAction.jsp" method="post">
            <table cellpadding="10">
              <tr><th>Name</th><td><input type="text" name="name" placeholder="Name" required /></td></tr>
              <tr><th>Email</th><td><input type="email" name="email" placeholder="Email" required /></td></tr>
              <tr><th>Mobile</th><td><input type="number" name="mobile" placeholder="Mobile" required /></td></tr>
              <tr><th>Address</th><td><input type="text" name="address" placeholder="Address" required /></td></tr>
              <tr><th>UserName</th><td><input type="text" name="username" placeholder="UserName" required /></td></tr>
              <tr><th>Password</th><td><input type="password" name="password" placeholder="Password" required /></td></tr>
              <tr><th></th><td><input type="submit" value="Register" /></td></tr>
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
</body>
</html>
