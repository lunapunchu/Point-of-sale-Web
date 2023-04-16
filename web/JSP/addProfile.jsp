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
        String id = request.getParameter("id");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String role = request.getParameter("role");
        String id_aumpher = "";
        String aumpher = request.getParameter("aumpher");
        Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/personel?useSSL=false","root", "0F3E71E5");
        String sql1 = "Select * from aumpher";
        Statement s1 = c1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet r1 = s1.executeQuery(sql1);
        while (r1.next()) {
            if (aumpher.equals(r1.getString("name"))){
                 id_aumpher = r1.getString("id");
            }
        }
        String id_graduate = "";
        String graduate = request.getParameter("graduate");
        Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost/personel?useSSL=false","root", "0F3E71E5");
        String sql2 = "Select * from graduate";
        Statement s2 = c2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet r2 = s2.executeQuery(sql2);
        while (r2.next()) {
            if (graduate.equals(r2.getString("name"))){
                 id_graduate = r2.getString("id");
            }
        }
        String id_title = "";
        String title = request.getParameter("title");
        Connection c3 = DriverManager.getConnection("jdbc:mysql://localhost/personel?useSSL=false","root", "0F3E71E5");
        String sql3 = "Select * from firstname";
        Statement s3 = c3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet r3 = s3.executeQuery(sql3);
        while (r3.next()) {
            if (title.equals(r3.getString("name"))){
                 id_title = r3.getString("id");
            }
        }
        String id_province = "";
        String province = request.getParameter("province");
        Connection c4 = DriverManager.getConnection("jdbc:mysql://localhost/personel?useSSL=false","root", "0F3E71E5");
        String sql4 = "Select * from province";
        Statement s4 = c4.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet r4 = s4.executeQuery(sql4);
        while (r4.next()) {
            if (province.equals(r4.getString("name"))){
                 id_province = r4.getString("id");
            }
        }
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost/personel?useSSL=false","root", "0F3E71E5");
        String sql="Insert into profile(id,fname,lname,email,tel,role,id_aumpher,id_graduate,id_title,id_province) values('"+id
                +"','"+fname+"','"+lname+"','"+email+"','"+tel+"','"+role+"','"+id_aumpher+"','"+id_graduate+"','"+id_title+"','"+id_province+"')";
        Statement s = c.createStatement();
        s.execute(sql);
        response.sendRedirect("../Alert/alert15.html");
%>
