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
                <i class="fas fa-barcode"></i>
                <span class="top-text">Scan Payment</span>
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
                          <a href="Selling.jsp" class="active">
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
                          <a href="Supplier.jsp">
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
                <p class="font-weight-bold">Waiting for payment from scanner.</p>
              </div>

                    <div class="charts-card">
                         <form>
                                  <div class="user-details">
                                        <div class="input-box">
                                            <span class="txt-details">Credit Card</span>
                                            <input type="text" name="credit_card">
                                        </div>
                                        <div class="input-box">
                                            <span class="txt-details">Product Name</span>
                                            <%
                                                Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                                                Connection c = DriverManager.getConnection("jdbc:mysql://localhost/sellingdb?useSSL=false", "root", "0F3E71E5");
                                                Statement s = c.createStatement();
                                                ResultSet r = s.executeQuery("Select * from payment");
                                            %>
                                            <select name="banking" >
                                             <%
                                                while (r.next()) {
                                            %>
                                                <option><%=r.getString("backing")%></option>
                                            <%}%>
                                            </select>
                                        </div>
                                        <div class="input-box">
                                            <span class="txt-details">Payment</span>
                                            <input type="text" name="payment">
                                        </div>
                                  </div>  
                                  <div class="lower">
                                        <div class="lower-left">
                                            
                                        </div>
                                        <div class="lower-right">
                                            <input type="button"  class="button2" value="OK"/>
                                        </div>
                                  </div>    
                              <form>

                
                    </div>
            </main>
            <!-- End Main -->

    </div>

    <script src="../JS/menu.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.35.3/apexcharts.min.js"></script>
    <script src="../JS/scripts.js"></script>

</body>

</html>

