<%-- 
    Document   : logout
    Created on : 1-May-2023, 11:00:00
    Author     : ComSCIv3400
--%>

<%
    session.setAttribute("user", null);
    session.invalidate();
    response.sendRedirect("index.html");
%>
