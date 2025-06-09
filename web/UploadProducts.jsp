<%-- 
    Document   : Apps
    Created on : 4 Apr, 2021, 12:15:57 PM
    Author     : KishanVenky
--%>

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
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
          <%
           
              String  username=(String)session.getAttribute("username");
              
              %>
        <h3><a href="#">Welcome : <%=username%></a></h3>
      </div>
      <div class="menu_nav">
        <ul>
          <li ><a href="FlipkartHome.jsp">Home</a></li>
          <li class="active"><a href="UploadProducts.jsp">Upload Product</a></li>
          <li><a href="F_PushNotification.jsp">Push Notification</a></li>
          <li><a href="Apps.jsp">logout</a></li>
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
         </div>
        <div class="article">
          <h2><span></span></h2>
        
              
              <h2>View All Products</h2>
              <table>
                  <tr>
                      <th>Product Category</th>
                      <th>Product Name</th>
                      <th>Product Price</th>
                      <th>Product Description</th>
                       <th>Product Image</th>
                  </tr>
                  <%
                  try{
                    ResultSet r=Queries.getExecuteQuery("select * from products where username='"+username+"'");
                    while(r.next()){
                        %>
                        <tr>
                            <td><%=r.getString("category")%></td>
                            <td><%=r.getString("pname")%></td>
                            <td><%=r.getString("price")%></td>
                            <td><%=r.getString("description")%></td>
                            <td><image src="view.jsp?id=<%=r.getString("id")%>" width="100" height="100"/></td>
                            
                        </tr>
                        
                        <%
                    }
                  }catch(Exception e){
                      out.println(e);
                  }
                  
                  %>
              </table>
              
              
              
        
          </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star"><span></span> </h2>
          <div class="clr"></div>
              <h2>Upload All Products Here</h2>
             
              <form action="Upload" method="post" enctype="multipart/form-data">
                  <table>
                                  <tr><th>Product Category</th><td><select name="category" required="">
                                              <option></option>
                                              <option value="Mobiles">Mobiles</option>
                                              <option value="Laptops">Laptops</option>
                                              <option value="Televisions">Televisions</option>
                                              <option value="Pendrive">Pendrives</option>
                                              
                                              
                              </select></td></tr>
                      <tr><th>Product Name</th><td><input type="text" name="pname" required=""/></td></tr>
                      <tr><th>Product Description</th><td><textarea cols=20 rows=10 name="desc" required=""></textarea></td></tr>
                      <tr><th>Product Price</th><td><input type="number" name="price" required=""/></td></tr>
                        <tr><th>Product Image</th><td><input type="file" name="image" required=""/></td></tr>
                     <tr><th></th><td><input type="submit" value="Upload"/> <input type="reset" value="Reset"/></td></tr>
                     
                  </table>
              </form>
        </div>
        <div class="gadget">
         
          <div class="clr"></div>
           
              
     
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
</html>

