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
        String pm_id = request.getParameter("pm_id");
        String pm_name = request.getParameter("pm_name");
        String discount = request.getParameter("discount");
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false","root", "0F3E71E5");
        String sql="Insert into promotion(pm_id,pm_name,discount) values('"+pm_id+"','"+pm_name+"','"+discount+"')";
        Statement s = c.createStatement();
        s.execute(sql);
        response.sendRedirect("../Alert/alert13.html");
%>
