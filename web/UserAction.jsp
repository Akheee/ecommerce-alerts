<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try {
    String uname = request.getParameter("username");
    String pwd = request.getParameter("password");

    if (uname == null || pwd == null || uname.trim().isEmpty() || pwd.trim().isEmpty()) {
%>
    <script type="text/javascript">
        alert("Username and Password are required.");
        window.location = "Users.jsp";
    </script>
<%
        return;
    }

    String query = "SELECT * FROM user WHERE username='" + uname + "' AND password='" + pwd + "'";
    ResultSet i = Queries.getExecuteQuery(query);

    if (i != null && i.next()) {
        session.setAttribute("id", i.getString("id"));
        session.setAttribute("email", i.getString("email"));
        session.setAttribute("username", i.getString("username"));
%>
    <script type="text/javascript">
        alert("Login Successful!");
        window.location = "UserHome.jsp";
    </script>
<%
    } else {
%>
    <script type="text/javascript">
        alert("Login Failed. Invalid credentials.");
        window.location = "Users.jsp";
    </script>
<%
    }
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>
