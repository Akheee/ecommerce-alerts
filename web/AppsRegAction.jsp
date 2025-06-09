<%-- 
    Document   : RegAction
    Created on : Jan 18, 2020, 2:53:23 PM
    Author     : Acer
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String apps=request.getParameter("apps");
String email=request.getParameter("email");

String address=request.getParameter("address");
String uname=request.getParameter("username");
String pwd=request.getParameter("password");
try{
    int count=0;
    
  String query="select count(*) from apps where email='"+email+"'and app='"+uname+"'";
       ResultSet r=Queries.getExecuteQuery(query);
       while(r.next()){
     count=r.getInt(1);   
       }
       if(count==0){
         int i=Queries.getExecuteUpdate("insert into apps values(null,'"+apps+"','"+email+"','"+address+"','"+uname+"','"+pwd+"')");
         if(i>0){
            %>
       <script type="text/javascript">
           window.alert("App Register SuccessFully..!!");
           window.location="Apps.jsp";
           </script>
          <%
    }else{
 %>
       <script type="text/javascript">
           window.alert("App Registration Failed..!!");
           window.location="Apps.jsp";
           </script>
          <%
}
       }else{
%>
       <script type="text/javascript">
           window.alert("App already  Exist..!!");
           window.location="Apps.jsp";
           </script>
          <%
}
    
}catch(Exception e){
    out.println(e);
}



%>