<%@page import="com.database.Queries"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>

<%
    String id = request.getParameter("id");

    if (id == null || id.trim().isEmpty()) {
        out.println("No ID provided.");
        return;
    }

    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        con = Queries.getConnection(); // ? FIXED: Use your actual DB connection
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT image FROM products WHERE id = '" + id + "'");

        if (rs.next()) {
            Blob image = rs.getBlob("image");
            if (image != null) {
                byte[] imgData = image.getBytes(1, (int) image.length());
                response.setContentType("image/jpeg"); // or "image/png" depending on file type
                OutputStream o = response.getOutputStream();
                o.write(imgData);
                o.flush();
                o.close();
            } else {
                out.println("No image found for this product.");
            }
        } else {
            out.println("Invalid product ID.");
        }

    } catch (Exception e) {
        out.println("Image Display Error: " + e.getMessage());
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
