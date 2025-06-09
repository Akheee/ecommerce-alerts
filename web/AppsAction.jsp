<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try {
    String apps = request.getParameter("apps");
    String uname = request.getParameter("username");
    String pwd = request.getParameter("password");

    String query = "SELECT * FROM apps WHERE username='" + uname + "' AND password='" + pwd + "'";
    ResultSet i = Queries.getExecuteQuery(query);

    if (i != null && i.next()) {
        String app = i.getString("app");
        if (app.equals("Flipkart")) {
            session.setAttribute("username", "Flipkart");
%>
            <script type='text/javascript'>
                window.alert("Login Successful...!!");
                window.location = "FlipkartHome.jsp";
            </script>
<%
        } else {
            session.setAttribute("username", "Amazon");
%>
            <script type='text/javascript'>
                window.alert("Login Successful...!!");
                window.location = "AmazonHome.jsp";
            </script>
<%
        }
    } else {
%>
        <script type='text/javascript'>
            window.alert("Login Failed..!!");
            window.location = "Apps.jsp";
        </script>
<%
    }
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>
