<%-- 
    Document   : PushNotifyAction
    Created on : 4 Apr, 2021, 3:06:32 PM
    Author     : KishanVenky
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
try{
    String  username=(String)session.getAttribute("username");
  String pid=request.getParameter("pid");
    String uid=request.getParameter("uid");
    String content=request.getParameter("content");
    ResultSet rr1=Queries.getExecuteQuery("select count(*) from notification where uid='"+uid+"'and pid='"+pid+"'");
   int cc=0;
    while(rr1.next()){
         cc=rr1.getInt(1);
    }
    if(cc!=0){
    ResultSet r=Queries.getExecuteQuery("select * from notification where uid='"+uid+"'and pid='"+pid+"'");
    if(r.next()){
        String status=r.getString("status");
        if(status.equals("Block")){
             int i=Queries.getExecuteUpdate("insert into notification values(null,'"+username+"','"+uid+"','"+pid+"','"+content+"','Block')");
    if(i>0){   
        %>
        <script type="text/javascript">
            window.alert("Sent Successfully...!!");
            window.location="PushNotifyAction.jsp";
        </script>  
        <%
    }else{
 %>
        <script type="text/javascript">
            window.alert("Sending Failed...!!");
            window.location="PushNotifyAction.jsp";
        </script>  
        <%
}
}else{
int i=Queries.getExecuteUpdate("insert into notification values(null,'"+username+"','"+uid+"','"+pid+"','"+content+"','waiting')");
    if(i>0){
        %>
        <script type="text/javascript">
            window.alert("Sent Successfully...!!");
            window.location="PushNotifyAction.jsp";
        </script>  
        <%
    }else{
 %>
        <script type="text/javascript">
            window.alert("Sending Failed...!!");
            window.location="PushNotifyAction.jsp";
        </script>  
        <%
}
}  
}
}else{
int i=Queries.getExecuteUpdate("insert into notification values(null,'"+username+"','"+uid+"','"+pid+"','"+content+"','waiting')");
    if(i>0){
        %>
        <script type="text/javascript">
            window.alert("Sent Successfully...!!");
            window.location="PushNotifyAction.jsp";
        </script>  
        <%
    }else{
 %>
        <script type="text/javascript">
            window.alert("Sending Failed...!!");
            window.location="PushNotifyAction.jsp";
        </script>  
        <%
}
}
    
}catch(Exception e){
   out.println(e); 
}



%>
