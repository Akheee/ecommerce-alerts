<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
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
        }
    </style>
</head>
<body>
<%
    String id = (String) session.getAttribute("id");
    String email = (String) session.getAttribute("email");
    String username = (String) session.getAttribute("username");
    String pid = request.getParameter("pid");
    String category = request.getParameter("e_username");

    if (id == null || username == null || pid == null || category == null) {
%>
    <script>
        alert("Invalid session or parameters. Redirecting to home.");
        window.location = "Users.jsp";
    </script>
<%
        return;
    }

    try {
        Connection con = Queries.getConnection();
        Statement s = con.createStatement();

        String qu = "SELECT COUNT(*) FROM pcount WHERE pid='" + pid + "' AND uid='" + id + "' AND category='" + category + "'";
        ResultSet r = Queries.getExecuteQuery(qu);

        int c = 0;
        if (r != null && r.next()) {
            c = r.getInt(1);
        }

        if (c > 0) {
            ResultSet r1 = Queries.getExecuteQuery("SELECT * FROM pcount WHERE pid='" + pid + "' AND uid='" + id + "' AND category='" + category + "'");
            if (r1 != null && r1.next()) {
                int cc = r1.getInt("pcount");
                int c2 = cc + 1;
                s.executeUpdate("UPDATE pcount SET pcount='" + c2 + "' WHERE pid='" + pid + "' AND uid='" + id + "' AND category='" + category + "'");
            }
        } else {
            Queries.getExecuteUpdate("INSERT INTO pcount VALUES (NULL, '" + pid + "', '" + username + "', '" + id + "', '1', 'waiting', '" + category + "')");
        }

    } catch (Exception e) {
        out.println("Tracking error: " + e.getMessage());
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
                    <li class="active"><a href="UserHome.jsp">Home</a></li>
                    <li><a href="Notification.jsp">Notification</a></li>
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
                    <table>
                        <tr>
                            <th>E-Commerce</th>
                            <th>Product Category</th>
                            <th>Product Name</th>
                            <th>Product Description</th>
                            <th>Product Price</th>
                            <th>Product Image</th>
                            <th>Back</th>
                        </tr>
                        <%
                            try {
                                ResultSet r = Queries.getExecuteQuery("SELECT * FROM products WHERE id='" + pid + "'");
                                if (r != null && r.next()) {
                        %>
                        <tr>
                            <td><%= r.getString("username") %></td>
                            <td><%= r.getString("category") %></td>
                            <td><%= r.getString("pname") %></td>
                            <td><%= r.getString("description") %></td>
                            <td><%= r.getString("price") %></td>
                            <td><img src="view.jsp?id=<%= r.getString("id") %>" width="150" height="150" /></td>
                            <td><a href="UserHome.jsp">Back</a></td>
                        </tr>
                        <%
                                } else {
                                    out.println("<tr><td colspan='7'>Product not found or DB error.</td></tr>");
                                }
                            } catch (Exception e) {
                                out.println("<tr><td colspan='7'>Error: " + e.getMessage() + "</td></tr>");
                            }
                        %>
                    </table>
                </div>
            </div>
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
