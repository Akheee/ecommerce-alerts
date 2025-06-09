<%@page import="com.database.Queries"%>
<%@page import="java.sql.ResultSet"%>
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
  <style>
    table tr th, table tr td {
      text-align: center;
      border: 0.5px solid lightgrey;
      padding: 8px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
    }
  </style>
</head>
<body>
<%
    String id = (String) session.getAttribute("id");
    String email = (String) session.getAttribute("email");
    String username = (String) session.getAttribute("username");

    if (id == null || email == null || username == null) {
%>
<script>
    alert("Session expired or not logged in. Redirecting...");
    window.location = "Users.jsp";
</script>
<%
        return;
    }
%>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h3><a href="#"><%= email %></a></h3>
      </div>
      <div class="menu_nav">
        <ul>
          <li><a href="UserHome.jsp">Home</a></li>
          <li class="active"><a href="Notification.jsp">Notification</a></li>
          <li><a href="ViewProfile.jsp">View Profile</a></li>
          <li><a href="Users.jsp">Logout</a></li>
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
          <h2>Notifications</h2>
          <table>
            <tr>
              <th>From App</th>
              <th>Notification</th>
              <th>Product Name</th>
              <th>Price</th>
              <th>Description</th>
              <th>Action</th>
            </tr>
            <%
              try {
                ResultSet r = Queries.getExecuteQuery(
                  "SELECT n.id, n.sender, n.content, p.pname, p.price, p.description " +
                  "FROM notification n, products p " +
                  "WHERE n.uid='" + id + "' AND n.pid=p.id AND n.status='waiting'"
                );

                if (r != null && r.isBeforeFirst()) {
                  while (r.next()) {
            %>
            <tr>
              <td><%= r.getString("sender") %></td>
              <td><%= r.getString("content") %></td>
              <td><%= r.getString("pname") %></td>
              <td><%= r.getString("price") %></td>
              <td><%= r.getString("description") %></td>
              <td><a href="Block.jsp?id=<%= r.getString("id") %>">Block</a></td>
            </tr>
            <%
                  }
                } else {
                  out.println("<tr><td colspan='6'>No new notifications.</td></tr>");
                }
              } catch (Exception e) {
                out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
              }
            %>
          </table>
        </div>
      </div>
      <div class="sidebar">
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
