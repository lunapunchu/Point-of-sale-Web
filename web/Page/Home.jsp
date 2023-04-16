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
                <i class="fas fa-home"></i>
                <span class="top-text">Home</span>
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
                          <a href="Home.jsp" class="active">
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
                <p class="font-weight-bold"></p>
              </div>

              <div class="main-cards">

                <div class="card">
                  <div class="card-inner">
                    <p class="text-primary">Total Money</p>
                    <i class="fas fa-coins text1 fa-2x"></i>
                  </div>

                         <%
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection c = DriverManager.getConnection("jdbc:mysql://localhost/sellingdb?useSSL=false", "root", "0F3E71E5");
                            Statement s = c.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet r = s.executeQuery("Select * from budget");
                            r.next();
                        %>
                              <span class="text-primary font-weight-bold"><%=r.getString("money")%></span>
                        <%
                        %>
                    
                </div>

                <div class="card">
                  <div class="card-inner">
                    <p class="text-primary">Daily Sales</p>
                    <i class="fas fa-shopping-cart text2 fa-2x"></i>
                  </div>
                        <%
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/warehouse?useSSL=false", "root", "0F3E71E5");
                            Statement s1 = c1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet r1 = s1.executeQuery("Select * from curorder");
                            int rec=0;
                            while(r1.next()){
                                rec++;
                            }
                            float  price = 0;
                            r1.first();                     
                            price = price + Float.parseFloat(r1.getString("total_price"));
                            while (r1.next()){ 
                               price = price + Float.parseFloat(r1.getString("total_price"));
                            }
                        %>
                                <span class="text-primary font-weight-bold"><%=price%></span>
                        <%
                        %>
                </div>

                <div class="card">
                  <div class="card-inner">
                    <p class="text-primary">Total Expenses</p>
                    <i class="fas fa-hand-holding-usd text3 fa-2x"></i>
                  </div>
                        <%
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost/sellingdb?useSSL=false", "root", "0F3E71E5");
                            Statement s2 = c2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet r2 = s2.executeQuery("Select * from expense");
                            rec=0;
                            while(r2.next()){
                                rec++;
                            }
                            price = 0;
                            r2.first();                     
                            price = price + Float.parseFloat(r2.getString("price"));
                            while (r2.next()){ 
                               price = price + Float.parseFloat(r2.getString("price"));
                            }
                        %>
                                <span class="text-primary font-weight-bold"><%=price%></span>
                        <%
                        %>
                </div>

                <div class="card">
                  <div class="card-inner">
                    <p class="text-primary">Stock</p>
                    <i class="fas fa-pallet text4 fa-2x"></i>
                  </div>
                        <%
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection c3 = DriverManager.getConnection("jdbc:mysql://localhost/warehouse?useSSL=false", "root", "0F3E71E5");
                            Statement s3 = c3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet r3 = s3.executeQuery("Select * from stock");
                            rec=0;
                            while(r3.next()){
                                rec++;
                            }
                            int count=0;
                            r3.first();                     
                            count++;
                            while (r3.next()){ 
                               count++;
                            }
                        %>
                            <span class="text-primary font-weight-bold"><%=count%></span>
                         <%
                         %>
                </div>

              </div>

              <div class="charts">

                <div class="charts-card">
                  <p class="chart-title">Top 5 Products in Stock</p>
                  <div id="bar-chart"></div>
                </div>

                <div class="charts-card">
                  <p class="chart-title">Sales and Supplier Orders</p>
                  <div id="area-chart"></div>
                </div>

              </div>
            </main>
            <!-- End Main -->

    </div>

    <script src="../JS/menu.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.35.3/apexcharts.min.js"></script>
    <script src="../JS/scripts.js"></script>

</body>

</html>

