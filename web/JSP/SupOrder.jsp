<%-- 
    Document   : login
    Created on : 1-May-2023, 11:00:00
    Author     : ComSCIv3400
--%>

<%@ page import ="java.sql.*" %>

<%
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        String spOrder_id = request.getParameter("spOrder_id");
        String p_id = request.getParameter("p_id");
        String s_amount = request.getParameter("amount");
        String total = request.getParameter("total_price");
        float total_price = Float.parseFloat(total);
         Connection c4 = DriverManager.getConnection("jdbc:mysql://localhost/warehouse?useSSL=false", "root", "0F3E71E5");
         Statement s4 = c4.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
         String sql4 = "Select * from stock where p_id='"+Integer.parseInt(p_id)+"'";
         ResultSet r4 = s4.executeQuery(sql4);
         r4.next();
         int amount = Integer.parseInt(r4.getString("amount")) + Integer.parseInt(s_amount);   
         
         //Update Stock
        Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/warehouse?useSSL=false", "root", "0F3E71E5");
        c1.setAutoCommit(false);        
        String sql = "update warehouse.stock SET amount ="+ amount +
           " WHERE p_id="+Integer.parseInt(p_id);
        PreparedStatement preparedStmt = c1.prepareStatement(sql);
        preparedStmt.executeUpdate();
        c1.commit();
        
        //Update Money
        Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost/sellingdb?useSSL=false", "root", "0F3E71E5");
        Statement s2 = c2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet r2 = s2.executeQuery("Select * from budget");
        r2.next();
        float money =  Float.parseFloat(r2.getString("money"));
        money = money - total_price;
        String sql2 = "update sellingdb.budget SET money ="+ money + " WHERE id="+ 1;
        PreparedStatement preparedStmt2 = c2.prepareStatement(sql2);
        preparedStmt2.executeUpdate();
        
        //Delete SupOrder
        Connection c3 = DriverManager.getConnection("jdbc:mysql://localhost/sellingdb?useSSL=false", "root", "0F3E71E5");
        String sql3 = "DELETE FROM suporder WHERE spOrder_id="+spOrder_id;
        PreparedStatement preparedStmt3 = c3.prepareStatement(sql3);
        c3.setAutoCommit(false);
        preparedStmt3.execute();
        c3.commit();
        
        response.sendRedirect("../Alert/alert11.html");
%>
