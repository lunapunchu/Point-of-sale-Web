<%-- 
    Document   : success
    Created on : 1-May-2023, 11:00:00
    Author     : ComSCIv3400
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <title>Point of Sale</title>
    <link rel="stylesheet" href="../CSS/style.css">
</head>

<body>
    
     <div class="grid-container">

            <!-- Header -->
            <header class="header">
              <div class="header-left">
                <i class="fas fa-truck-moving"></i>
                <span class="top-text">Supplier</span>
              </div>
              <div class="header-right">
                 <a href="../index.html">
                        <i class="fas fa-sign-in-alt" style="color: #000000;"></i>
                        <span class="top-text" style="color: #000000;">Exit</span>
                  </a>
              </div>
            </header>
            <!-- End Header -->

            <!-- Sidebar -->
            <aside id="sidebar" class="sidebar">
                <div class="profile">
                      <img class="logo" src="../Image/program/logo.png" width="150" height="40" alt="">
                      <img class="image" src="../Image/program/user1.png"  alt="profile_picture">
                        <%
                          if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) {
                        %>
                          <h3>.</h3>
                          <p>.</p>
                        <%} else {
                        %>
                          <h3><%=session.getAttribute("user")%></h3>
                          <p><%=session.getAttribute("id")%></p>
                        <%
                           }
                        %>
                  </div>
              <ul>
                      <li>
                          <a href="Home.jsp">
                              <span class="icon"><i class="fas fa-home"></i></span>
                              <span class="item">Home</span>
                          </a>
                      </li>
                      <li>
                          <a href="Selling.jsp">
                              <span class="icon"><i class="fas fa-donate"></i></span>
                              <span class="item">Selling</span>
                          </a>
                      </li>
                      <li>
                          <a href="Product.jsp">
                              <span class="icon"><i class="fab fa-dropbox"></i></span>
                              <span class="item">Product</span>
                          </a>
                      </li>
                      <li>
                          <a href="Order.jsp">
                              <span class="icon"><i class="fas fa-scroll"></i></span>
                              <span class="item">Order</span>
                          </a>
                      </li>
                       <li>
                          <a href="Stock.jsp">
                              <span class="icon"><i class="fas fa-pallet"></i></span>
                              <span class="item">Stock</span>
                          </a>
                      </li>
                      <li>
                          <a href="Expenses.jsp">
                              <span class="icon"><i class="fas fa-hand-holding-usd"></i></span>
                              <span class="item">Expenses</span>
                          </a>
                      </li>
                      <li>
                          <a href="Supplier.jsp" class="active">
                              <span class="icon"><i class="fas fa-truck-moving"></i></span>
                              <span class="item">Supplier</span>
                          </a>
                      </li>
                      <li>
                          <a href="Promotion.jsp">
                              <span class="icon"><i class="fas fa-percent"></i></span>
                              <span class="item">Promotion</span>
                          </a>
                      </li>
                      <li>
                          <a href="Person.jsp">
                              <span class="icon"><i class="fas fa-user-cog"></i></span>
                              <span class="item">Person</span>
                          </a>
                      </li>
                  </ul>
            </aside>
            <!-- End Sidebar -->

            <!-- Main -->
            <main class="main-container">
              <div class="main-title">
                <p class="font-weight-bold">Add Supplier Order</p>
              </div>

                    <div class="charts-card">
                            
                                <form method="post" action="../JSP/addSubOrder.jsp">
                                  <div class="user-details">
                                        <div class="input-box">
                                            <span class="txt-details">Supplier Order Id</span>
                                            <input type="text" name="spOrder_id" value="" >
                                        </div>
                                        <div class="input-box">
                                            <span class="txt-details">Product Id</span>
                                            <input type="text" name="p_id">
                                        </div>
                                        <div class="input-box">
                                            <span class="txt-details">Product Name</span>
                                            <%
                                                Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                                                Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false", "root", "0F3E71E5");
                                                Statement s1 = c1.createStatement();
                                                ResultSet r1 = s1.executeQuery("Select * from product");
                                            %>
                                            <select name="p_name" >
                                             <%
                                                while (r1.next()) {
                                            %>
                                                <option><%=r1.getString("p_name")%></option>
                                            <%}%>
                                            </select>
                                        </div>
                                        <div class="input-box">
                                            <span class="txt-details">Supplier Id</span>
                                            <%
                                                Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                                                Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false", "root", "0F3E71E5");
                                                Statement s2 = c2.createStatement();
                                                ResultSet r2 = s2.executeQuery("Select * from supplier");
                                            %>
                                            <select name="sp_name" >
                                             <%
                                                while (r2.next()) {
                                            %>
                                                <option><%=r2.getString("sp_name")%></option>
                                            <%}%>
                                            </select>
                                        </div>
                                         <div class="input-box">
                                            <span class="txt-details">Price</span>
                                            <input type="text" id="price" value="0.0" name="price">
                                        </div>
                                        <div class="input-box">
                                            <span class="txt-details">Amount</span>
                                            <input type="text" id="amount" value="0" name="amount">
                                        </div>
                                        <div class="input-box">
                                            <span class="txt-details">Total Price</span>
                                            <input type="text" id="total_price" value="0.0" name="total_price">
                                        </div>
                                  </div>  
                                  <div class="lower">
                                        <div class="lower-left">
                                            <input type="button" onclick="Cal()" class="button2" value="Calculate"/>
                                        </div>
                                        <div class="lower-right">
                                            <input type="submit" class="button3" value="Save"/>
                                        </div>
                                  </div>
                                </form>
                            
                
                    </div>
            </main>
            <!-- End Main -->

    </div>

    <script src="../JS/menu.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.35.3/apexcharts.min.js"></script>
    <script src="../JS/scripts.js"></script>
    <script>
         function Cal() {
                 var price = document.getElementById("price").value;
                 var amount = document.getElementById("amount").value;
                 var total_price = 0;
                 total_price = price * amount;
                 document.getElementById('total_price').value = total_price;
        }
    </script>

</body>

</html>

