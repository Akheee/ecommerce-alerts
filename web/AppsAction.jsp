<%-- 
    Document   : OwnerRegAction
    Created on : 29 Sep, 2020, 5:52:17 PM
    Author     : KishanVenky
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{

   String apps=request.getParameter("apps");
    String uname=request.getParameter("username");
    String pwd=request.getParameter("password");
    
    String query="select * from apps where username='"+uname+"'and password='"+pwd+"'";
    ResultSet i=Queries.getExecuteQuery(query);
    if(i.next()){
     String app=i.getString("app");
if(app.equals("Flipkart")){
    session.setAttribute("username","Flipkart");
  %>
      <script type='text/javascript'>
          window.alert("Login Successful...!!");
          window.location="FlipkartHome.jsp";
      </script>
      <%  
}else{
     session.setAttribute("username","Amazon");
%>
      <script type='text/javascript'>
          window.alert("Login Successful...!!");
          window.location="AmazonHome.jsp";
      </script>
      <%

    }
}else{
    
%>
      <script type='text/javascript'>
          window.alert("Login Failed..!!");
          window.location="Apps.jsp";
      </script>
      <%
}
}catch(Exception e){
    out.println(e);
}



%>