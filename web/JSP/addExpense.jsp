<%-- 
    Document   : login
    Created on : 1-May-2023, 11:00:00
    Author     : ComSCIv3400
--%>

<%@ page import ="java.sql.*" %>

<%
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        String e_id = request.getParameter("e_id");
        String e_name = request.getParameter("e_name");
        String price = request.getParameter("price");
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost/sellingdb?useSSL=false","root", "0F3E71E5");
        String sql="Insert into expense(e_id,e_name,price) values('"+e_id+"','"+e_name+"','"+price+"')";
        Statement s = c.createStatement();
        s.execute(sql);
        response.sendRedirect("../Alert/alert8.html");
%>
