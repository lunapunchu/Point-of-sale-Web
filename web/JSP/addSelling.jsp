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
        String d_id = request.getParameter("d_id");
        String p_id = request.getParameter("p_id");
        String p_name = request.getParameter("p_name");
        String id_unit = request.getParameter("id_unit");
        String sp_id = request.getParameter("sp_id");
        String price = request.getParameter("price");
        String amount = request.getParameter("amount");
        String discount = request.getParameter("discount");
        String total_price = request.getParameter("total_price");
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost/sellingdb?useSSL=false","root", "0F3E71E5");
        String sql="Insert into sellingtable(d_id,p_id,p_name,id_unit,price,amount,discount,total_price) values('"+d_id
                +"','"+p_id+"','"+p_name+"','"+id_unit+"','"+price+"','"+amount+"','"+discount+"','"+total_price+"')";
        Statement s = c.createStatement();
        s.execute(sql);
        response.sendRedirect("../Alert/alert6.html");
%>
