<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String apps = request.getParameter("apps");
String email = request.getParameter("email");
String address = request.getParameter("address");
String uname = request.getParameter("username");
String pwd = request.getParameter("password");

try {
    int count = 0;
    String query = "SELECT COUNT(*) FROM apps WHERE email='" + email + "' AND app='" + uname + "'";
    ResultSet r = Queries.getExecuteQuery(query);

    if (r != null) {
        while (r.next()) {
            count = r.getInt(1);
        }

        if (count == 0) {
            int i = Queries.getExecuteUpdate(
                "INSERT INTO apps VALUES (NULL, '" + apps + "', '" + email + "', '" + address + "', '" + uname + "', '" + pwd + "')"
            );

            if (i > 0) {
%>
<script type="text/javascript">
    window.alert("App Registered Successfully..!!");
    window.location = "Apps.jsp";
</script>
<%
            } else {
%>
<script type="text/javascript">
    window.alert("App Registration Failed..!!");
    window.location = "Apps.jsp";
</script>
<%
            }
        } else {
%>
<script type="text/javascript">
    window.alert("App Already Exists..!!");
    window.location = "Apps.jsp";
</script>
<%
        }
    } else {
%>
<script type="text/javascript">
    window.alert("Database connection failed. Please try again later.");
    window.location = "Apps.jsp";
</script>
<%
    }

} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>
