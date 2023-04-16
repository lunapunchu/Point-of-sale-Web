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
                <i class="fas fa-donate"></i>
                <span class="top-text">Selling</span>
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
                <p class="font-weight-bold"></p>
              </div>

                    <div class="charts-card">
                            
                                <form method="post" action="../JSP/addSelling.jsp">
                                  <div class="user-details">
                                        <div class="input-box">
                                            <span class="txt-details">Selling Id</span>
                                            <input type="text" name="d_id" value="" >
                                        </div>
                                        <div class="input-box">
                                            <span class="txt-details">Product Id</span>
                                            <input type="text" name="p_id">
                                        </div>
                                        <div class="input-box">
                                            <span class="txt-details">Product Name</span>
                                            <%
                                                Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                                                Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false", "root", "0F3E71E5");
                                                Statement s2 = c2.createStatement();
                                                ResultSet r2 = s2.executeQuery("Select * from product");
                                            %>
                                            <select name="p_name" >
                                             <%
                                                while (r2.next()) {
                                            %>
                                                <option><%=r2.getString("p_name")%></option>
                                            <%}%>
                                            </select>
                                        </div>
                                        <div class="input-box">
                                            <span class="txt-details">Unit</span>
                                            <%
                                                Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                                                Connection c3 = DriverManager.getConnection("jdbc:mysql://localhost/warehouse?useSSL=false", "root", "0F3E71E5");
                                                Statement s3 = c3.createStatement();
                                                ResultSet r3 = s3.executeQuery("Select * from unit");
                                            %>
                                            <select name="id_unit" >
                                             <%
                                                while (r3.next()) {
                                            %>
                                                <option><%=r3.getString("name")%></option>
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
                                            <span class="txt-details">Discount</span>
                                            <input type="text" id="discount" value="0.0" name="discount">
                                        </div>
                                        <div class="input-box">
                                            <span class="txt-details">Total Price</span>
                                            <input type="text" id="total_price" value="0.0" name="total_price">
                                        </div>
                                  </div>  
                                  <div class="lower">
                                        <div class="lower-left">
                                            <input type="button" onclick="Cal()" class="button2" value="Calculate"/>&nbsp;
                                            <a href="Scan.jsp" class="button3">Scan</a>
                                        </div>
                                        <div class="lower-right">
                                            <input type="submit" class="button3" value="Move to Table"/>
                                        </div>
                                  </div>
                                </form>
                            
                
                    </div>
                    <div class="charts-card">
                            <%
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection c4 = DriverManager.getConnection("jdbc:mysql://localhost/sellingdb?useSSL=false", "root", "0F3E71E5");
                                Statement s4 = c4.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                String Sqlid4 = "Select * from sellingtable";
                                ResultSet r4 = s4.executeQuery(Sqlid4);
                            %>
                            <table class="content">
                                <thead>
                                    <tr>
                                        <td>Selling ID</td>
                                        <td>Product ID</td>
                                        <td>Product Name</td>
                                        <td>Unit</td>
                                        <td>Price</td>
                                        <td>Amount</td>
                                        <td>Discount</td>
                                        <td>Total Price</td>
                                        <td># Buy</td>
                                    </tr>
                                </thead>
                                <tbody>
                            <%
                                while (r4.next()) {
                            %>  
                                    <form method="post" action="../JSP/buyMove.jsp">
                                        <tr>
                                            <td><input hidden type="text" name="d_id" value="<%=r4.getString("d_id")%>"><%=r4.getString("d_id")%></td>
                                            <td><input hidden type="text" name="p_id" value="<%=r4.getString("p_id")%>"><%=r4.getString("p_id")%></td>
                                            <td><input hidden type="text" name="p_name" value="<%=r4.getString("p_name")%>"><%=r4.getString("p_name")%></td>
                                            <td><input hidden type="text" name="id_unit" value="<%=r4.getString("id_unit")%>"><%=r4.getString("id_unit")%></td>
                                            <td><input hidden type="text" name="price" value="<%=r4.getString("price")%>"><%=r4.getString("price")%></td>
                                            <td><input hidden type="text" name="amount" value="<%=r4.getString("amount")%>"><%=r4.getString("amount")%></td>
                                            <td><input hidden type="text" name="discount" value="<%=r4.getString("discount")%>"><%=r4.getString("discount")%></td>
                                            <td><input hidden type="text" name="total_price" value="<%=r4.getString("total_price")%>"><%=r4.getString("total_price")%></td>
                                            <td><input type="submit" class="button" value="Buy"></input></td>
                                        </tr>
                                    </form>
                            <%
                              }
                            %>
                                </tbody>
                            </table>     
                            <div class="lower">
                                   <div class="lower-left">
                                   </div>
                                   <div class="lower-right">
                                            <input type="button" class="button3" value="Print"/>
                                   </div>
                             </div>
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
                 var discount = document.getElementById("discount").value;
                 var total_price = 0;
                 total_price = ( price * amount ) - discount;
                 document.getElementById('total_price').value = total_price;
        }
    </script>

</body>

</html>

