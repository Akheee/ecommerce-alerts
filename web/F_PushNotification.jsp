<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>OPTIMIZING APP ALERTS FOR A SUPERIOR E-COMMERCE EXPERIENCE</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="table.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
</head>
<body>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
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
          <li><a href="FlipkartHome.jsp">Home</a></li>
          <li><a href="UploadProducts.jsp">Upload Product</a></li>
          <li class="active"><a href="F_PushNotification.jsp">Push Notification</a></li>
          <li><a href="Apps.jsp">Logout</a></li>
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
          <h2>View All Products <font color="red">clicked more than 3 times</font></h2>
          <table>
            <tr>
              <th>Product Category</th>
              <th>Product Name</th>
              <th>Product Price</th>
              <th>Product Description</th>
              <th>Product Image</th>
            </tr>
            <%
              try {
                ResultSet r = Queries.getExecuteQuery("SELECT * FROM pcount c, products p WHERE c.pcount >= 3 AND p.id = c.pid AND c.category='" + username + "'");
                if (r != null) {
                  while (r.next()) {
            %>
            <tr>
              <td><%= r.getString("p.category") %></td>
              <td><%= r.getString("p.pname") %></td>
              <td><%= r.getString("p.price") %></td>
              <td><%= r.getString("p.description") %></td>
              <td><img src="view.jsp?id=<%= r.getString("p.id") %>" width="100" height="100" /></td>
            </tr>
            <%
                  }
                } else {
                  out.println("<tr><td colspan='5'>⚠️ DB connection error.</td></tr>");
                }
              } catch (Exception e) {
                out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
              }
            %>
          </table>
        </div>
      </div>

      <div class="sidebar">
        <div class="gadget">
          <h2>Select User & Push Notification</h2>
          <form action="A_PushNotification.jsp" method="post">
            <table>
              <tr>
                <th>Product Category</th>
                <td>
                  <select name="uid" required>
                    <option></option>
                    <%
                      try {
                        ResultSet r = Queries.getExecuteQuery("SELECT * FROM pcount WHERE pcount >= 3 AND category='" + username + "'");
                        if (r != null) {
                          while (r.next()) {
                            session.setAttribute("pid", r.getString("pid"));
                    %>
                    <option value="<%= r.getString("uid") %>"><%= r.getString("username") %></option>
                    <%
                          }
                        } else {
                          out.println("<option disabled>DB error</option>");
                        }
                      } catch (Exception e) {
                        out.println("<option disabled>Error: " + e.getMessage() + "</option>");
                      }
                    %>
                  </select>
                </td>
              </tr>
              <tr><th></th><td><input type="submit" value="Push" /></td></tr>
            </table>
          </form>

          <%
            String uid = request.getParameter("uid");
            String pid = (String) session.getAttribute("pid");
            if (uid != null && pid != null) {
          %>
          <form action="A_PushNotifyAction.jsp" method="post">
            <table>
              <tr><th>Product Id</th><td><input type="text" name="pid" value="<%= pid %>" readonly /></td></tr>
              <tr><th>User Id</th><td><input type="text" name="uid" value="<%= uid %>" readonly /></td></tr>
              <tr><th>Content</th><td><textarea cols="30" rows="5" name="content" required></textarea></td></tr>
              <tr><th></th><td><input type="submit" value="SUBMIT" /></td></tr>
            </table>
          </form>
          <% } %>
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
