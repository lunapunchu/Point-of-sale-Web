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
        String p = request.getParameter("price");
        float price = Float.parseFloat(p);
        
        //Delete Expense
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost/sellingdb?useSSL=false", "root", "0F3E71E5");
        String sql = "DELETE FROM expense WHERE e_id="+e_id;
        PreparedStatement preparedStmt = c.prepareStatement(sql);
        c.setAutoCommit(false);
        preparedStmt.execute();
        c.commit();
        
        //Update Money
        Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/sellingdb?useSSL=false", "root", "0F3E71E5");
        Statement s1 = c1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet r1 = s1.executeQuery("Select * from budget");
        r1.next();
        float money =  Float.parseFloat(r1.getString("money"));
        money = money - price;
        String sql1 = "update sellingdb.budget SET money ="+ money + " WHERE id="+ 1;
        PreparedStatement preparedStmt1= c1.prepareStatement(sql1);
        preparedStmt1.executeUpdate();
        
        response.sendRedirect("../Alert/alert9.html");
%>
