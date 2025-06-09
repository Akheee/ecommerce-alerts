<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try {
    String id = request.getParameter("id");

    if (id != null && !id.trim().isEmpty()) {
        String query = "UPDATE notification SET status='Block' WHERE id='" + id + "'";
        int i = Queries.getExecuteUpdate(query);

        if (i > 0) {
%>
<script type='text/javascript'>
    window.alert("Notification blocked successfully!");
    window.location = "Notification.jsp";
</script>
<%
        } else {
%>
<script type='text/javascript'>
    window.alert("Update failed.");
    window.location = "Notification.jsp";
</script>
<%
        }
    } else {
%>
<script type='text/javascript'>
    window.alert("Invalid ID provided.");
    window.location = "Notification.jsp";
</script>
<%
    }
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>
