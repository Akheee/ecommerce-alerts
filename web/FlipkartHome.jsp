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
<%
  String username = (String) session.getAttribute("username");
  if (username == null) {
    response.sendRedirect("login.jsp"); // or Apps.jsp if you prefer
    return;
  }
%>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h3><a href="#">Welcome : <%= username %></a></h3>
      </div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="FlipkartHome.jsp">Home</a></li>
          <li><a href="UploadProducts.jsp">Upload Product</a></li>
          <li><a href="F_PushNotification.jsp">Push Notification</a></li>
          <li><a href="Logout.jsp">Logout</a></li>
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
          <h2>Application Home Page</h2>
        </div>
      </div>

      <div class="sidebar">
        <div class="gadget"><div class="clr"></div></div>
        <div class="gadget"><div class="clr"></div></div>
      </div>

      <div class="clr"></div>
    </div>
  </div>

  <div class="footer">
    <div class="footer_resize"><div class="clr"></div></div>
  </div>
</div>
</body>
</html>
