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
        String p_id = request.getParameter("p_id");
        String p_name = request.getParameter("p_name");
        String g_id="";
        String group = request.getParameter("group");
        Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false","root", "0F3E71E5");
        String sql1 = "Select * from productgroup";
        Statement s1 = c1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet r1 = s1.executeQuery(sql1);
        while (r1.next()) {
            if (group.equals(r1.getString("g_name"))){
                 g_id = r1.getString("g_id");
            }
        }
        String s_id="";
        String subgroup = request.getParameter("subgroup");
        Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false","root", "0F3E71E5");
        String sql2 = "Select * from subgroup";
        Statement s2 = c2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet r2 = s2.executeQuery(sql2);
        while (r2.next()) {
            if (subgroup.equals(r2.getString("s_name"))){
                 s_id = r2.getString("s_id");
            }
        }
        String sp_id="";
        String supplier = request.getParameter("supplier");
        Connection c3 = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false","root", "0F3E71E5");
        String sql3 = "Select * from supplier";
        Statement s3 = c3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet r3 = s3.executeQuery(sql3);
        while (r3.next()) {
            if (supplier.equals(r3.getString("sp_name"))){
                 sp_id = r3.getString("sp_id");
            }
        }
        String price = request.getParameter("price");
        String pm_id="";
        String pm = request.getParameter("pm");
        Connection c4 = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false","root", "0F3E71E5");
        String sql4 = "Select * from promotion";
        Statement s4 = c4.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet r4 = s4.executeQuery(sql4);
        while (r4.next()) {
            if (pm.equals(r4.getString("pm_name"))){
                 pm_id = r4.getString("pm_id");
            }
        }
        String image = request.getParameter("image");
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false","root", "0F3E71E5");
        String sql="Insert into product(p_id,p_name,g_id,sp_id,s_id,price,pm_id,image) values('"+p_id
                +"','"+p_name+"','"+g_id+"','"+sp_id+"','"+s_id+"','"+price+"','"+pm_id+"','"+image+"')";
        Statement s = c.createStatement();
        s.execute(sql);
        response.sendRedirect("../Alert/alert5.html");
%>
