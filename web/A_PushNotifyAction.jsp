<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
try {
    String username = (String) session.getAttribute("username");
    String pid = request.getParameter("pid");
    String uid = request.getParameter("uid");
    String content = request.getParameter("content");

    if (username == null || pid == null || uid == null || content == null || content.trim().isEmpty()) {
%>
        <script type="text/javascript">
            alert("Missing required data. Please try again.");
            window.location = "A_PushNotification.jsp";
        </script>
<%
        return;
    }

    int cc = 0;
    boolean success = false;

    ResultSet rr1 = Queries.getExecuteQuery(
        "SELECT COUNT(*) FROM notification WHERE uid='" + uid + "' AND pid='" + pid + "'"
    );

    if (rr1 != null && rr1.next()) {
        cc = rr1.getInt(1);
    }

    if (cc != 0) {
        ResultSet r = Queries.getExecuteQuery(
            "SELECT * FROM notification WHERE uid='" + uid + "' AND pid='" + pid + "'"
        );
        if (r != null && r.next()) {
            String status = r.getString("status");
            String newStatus = status.equalsIgnoreCase("Block") ? "Block" : "waiting";

            success = Queries.getExecuteUpdate(
                "INSERT INTO notification VALUES (NULL, '" + username + "', '" + uid + "', '" + pid + "', '" + content + "', '" + newStatus + "')"
            ) > 0;
        }
    } else {
        // New notification
        success = Queries.getExecuteUpdate(
            "INSERT INTO notification VALUES (NULL, '" + username + "', '" + uid + "', '" + pid + "', '" + content + "', 'waiting')"
        ) > 0;
    }

    if (success) {
%>
        <script type="text/javascript">
            alert("Notification sent successfully!");
            window.location = "A_PushNotification.jsp";
        </script>
<%
    } else {
%>
        <script type="text/javascript">
            alert("Failed to send notification!");
            window.location = "A_PushNotification.jsp";
        </script>
<%
    }

} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>
