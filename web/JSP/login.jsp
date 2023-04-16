<%-- 
    Document   : login
    Created on : 1-May-2023, 11:00:00
    Author     : ComSCIv3400
--%>

<%@ page import ="java.sql.*" %>

<%
    String user = request.getParameter("uname");    
    String pass = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/logindb?useSSL=false", "root", "0F3E71E5");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from user where uname='" + user + "' and pass='" + pass + "'");
    if (rs.next()) {
        session.setAttribute("user", user);
        session.setAttribute("id", rs.getString("id"));
        response.sendRedirect("../Page/Home.jsp");
    } else {
        response.sendRedirect("../Alert/alert2.html");
  }
%>
