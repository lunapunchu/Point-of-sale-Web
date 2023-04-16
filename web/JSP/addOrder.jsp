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
        String cur_id = request.getParameter("cur_id");
        String p_id = request.getParameter("p_id");
        String p_name = request.getParameter("p_name");
        String id_unit = request.getParameter("id_unit");
        String sp_name = request.getParameter("sp_name");
        String sp_id="";
        Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false","root", "0F3E71E5");
        String sql1 = "Select * from supplier";
        Statement s1 = c1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet r1 = s1.executeQuery(sql1);
        while (r1.next()) {
            if (sp_name.equals(r1.getString("sp_name"))){
                 sp_id = r1.getString("sp_id");
            }
        }
        String price = request.getParameter("price");
        String cur_amount = request.getParameter("cur_amount");
        String cur_discount = request.getParameter("cur_discount");
        String total_price = request.getParameter("total_price");
        String date_order = request.getParameter("date_order");
        String date_sent = request.getParameter("date_sent");
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost/warehouse?useSSL=false","root", "0F3E71E5");
        String sql="Insert into curorder(cur_id,p_id,p_name,id_unit,sp_id,price,cur_amount,total_price,cur_discount,date_order,date_sent) values('"+cur_id
                +"','"+p_id+"','"+p_name+"','"+id_unit+"','"+sp_id+"','"+price+"','"+cur_amount+"','"+total_price+"','"+cur_discount+"','"+date_order+"','"+date_sent+"')";
        Statement s = c.createStatement();
        s.execute(sql);
        response.sendRedirect("../Alert/alert1.html");
%>
