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
        String price = request.getParameter("price");
        String d_amount = request.getParameter("amount");
        String discount = request.getParameter("discount");
        String total = request.getParameter("total_price"); 
        float total_price = Float.parseFloat(total);
        String date = "2022-12-12 12:50:53";
        String emp_name = "Admin";
        String emp_id = "40000";
         Connection c = DriverManager.getConnection("jdbc:mysql://localhost/warehouse?useSSL=false", "root", "0F3E71E5");
         Statement s = c.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
         String sql = "Select * from stock where p_id='"+Integer.parseInt(p_id)+"'";
         ResultSet r = s.executeQuery(sql);
         r.next();
         int amount = Integer.parseInt(r.getString("amount")) - Integer.parseInt(d_amount);  
         
         //Update Stock
        Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/warehouse?useSSL=false", "root", "0F3E71E5");
        c1.setAutoCommit(false);        
        String sql1 = "update warehouse.stock SET amount ="+ amount +
           " WHERE p_id="+Integer.parseInt(p_id);
        PreparedStatement preparedStmt1 = c1.prepareStatement(sql1);
        preparedStmt1.executeUpdate();
        c1.commit();
        
        //Update Money
        Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost/sellingdb?useSSL=false", "root", "0F3E71E5");
        Statement s2 = c2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet r2 = s2.executeQuery("Select * from budget");
        r2.next();
        float money =  Float.parseFloat(r2.getString("money"));
        money = money + total_price;
        String sql2 = "update sellingdb.budget SET money ="+ money + " WHERE id="+ 1;
        PreparedStatement preparedStmt2 = c2.prepareStatement(sql2);
        preparedStmt2.executeUpdate();
        
        //Delete Order
        Connection c3 = DriverManager.getConnection("jdbc:mysql://localhost/sellingdb?useSSL=false", "root", "0F3E71E5");
        String sql3 = "DELETE FROM sellingtable WHERE d_id="+d_id;
        PreparedStatement preparedStmt3 = c3.prepareStatement(sql3);
        c3.setAutoCommit(false);
        preparedStmt3.execute();
        c3.commit();
        
        //Move to dailysale
        Connection c5 = DriverManager.getConnection("jdbc:mysql://localhost/sellingdb?useSSL=false","root", "0F3E71E5");
        String sql5="Insert into dailysale(d_id,p_id,p_name,id_unit,price,amount,total_price,discount,date_sale,id_emp,emp_name) values('"+d_id
                +"','"+p_id+"','"+p_name+"','"+id_unit+"','"+price+"','"+d_amount+"','"+total_price+"','"+discount+"','"+date+"','"+emp_id+"','"+emp_name+"')";
        Statement s5 = c5.createStatement();
        s5.execute(sql5);
        
        response.sendRedirect("../Alert/alert7.html");
%>
