<%-- 
    Document   : login
    Created on : 1-May-2023, 11:00:00
    Author     : ComSCIv3400
--%>

<%@ page import ="java.sql.*" %>

<%
        String id = request.getParameter("p_id");    
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false", "root", "0F3E71E5");
        Statement s = c.createStatement();
        String sql="DELETE FROM product WHERE p_id="+Integer.parseInt(id); 
        s.execute(sql); 
        response.sendRedirect("../Alert/alert4.html");
%>
