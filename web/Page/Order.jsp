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
                <i class="fas fa-scroll"></i>
                <span class="top-text">Order</span>
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
                          <a href="Order.jsp" class="active">
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

              <div >

                <div class="charts-card">
                  
                  <div class="boxContainer">
                      <table class="elementsContainer">
                          <tr>
                              <td>
                                  <form method="post" action="Order.jsp">
                                          <input type="text" name="id" placeholder="Search" class="search">
                                  </form>
                              </td>
                              <td>
                                  <i class="fas fa-search"></i>
                              </td>
                          </tr>
                      </table>
                  </div>
                  <div class="table">
                    <%
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection c = DriverManager.getConnection("jdbc:mysql://localhost/warehouse?useSSL=false", "root", "0F3E71E5");
                        Statement s = c.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        String Sql = "Select * from curorder";
                        String id = request.getParameter("id"); 
                        if(id != null){
                             Sql = "Select * from curorder where cur_id='"+Integer.parseInt(id)+"'";
                        };
                        ResultSet r = s.executeQuery(Sql);
                    %>
                   <table class="content">
                        <thead>
                          <tr>
                                <td>Curorder Id</td>
                                <td>Product Id</td>
                                <td>Product Name</td>
                                <td>Unit</td>
                                <td>Supplier Id</td>
                                <td>Price</td>
                                <td>Amount</td>
                                <td>Discount</td>
                                <td>Total</td>
                                <td>Date Order</td>
                                <td>Date Sent</td>
                                <td># Inventory</td>
                          </tr>
                        </thead>
                        <tbody>
                           <%
                             while (r.next()) {
                          %>
                          <form method="post" action="../JSP/InventoryJSP.jsp">
                            <tr>
                                  <td><input hidden type="text" name="cur_id" value="<%=r.getString("cur_id")%>"><%=r.getString("cur_id")%></td>
                                  <td><input hidden type="text" name="p_id" value="<%=r.getString("p_id")%>"><%=r.getString("p_id")%></td>
                                  <td><%=r.getString("p_name")%></td>
                                  <td><%=r.getString("id_unit")%></td>
                                  <td><%=r.getString("sp_id")%></td>
                                  <td><%=r.getString("price")%></td>
                                  <td><input hidden type="text" name="cur_amount" value="<%=r.getString("cur_amount")%>"><%=r.getString("cur_amount")%></td>
                                  <td><%=r.getString("cur_discount")%></td>
                                  <td><input hidden type="text" name="total_price" value="<%=r.getString("total_price")%>"><%=r.getString("total_price")%></td>
                                  <td><%=r.getString("date_order")%></td>
                                  <td><%=r.getString("date_sent")%></td>
                                  <td><input type="submit" class="button" value="Inventory"></input></td>
                            </tr>
                          </form>
                          <%
                            }
                            s.close();
                            r.close();
                          %>
                        </tbody>
                      </table>
                    </div>
                  
                    <div class="lower">
                        <div class="lower-left">

                        </div>
                        <div class="lower-right">
                            <a href="AddOrder.jsp" class="button2">Add Order</a>
                        </div>
                    </div>
                    
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

