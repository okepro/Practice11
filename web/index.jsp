<%@ page import="java.util.Enumeration, logic.DataBaseHand" %><%--
  Created by IntelliJ IDEA.
  User: MSI
  Date: 10/27/2020
  Time: 7:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorPage.jsp" %>
<html>
  <head>
    <title>Calculate</title>
  </head>
  <body>

    <form name = "calValue" action="" method="GET">

      <input type="number" name = "val1" placeholder="Введите первое число" value= <%=request.getParameter("val1")%>>
      <input type="number" name = "val2" placeholder="Введите второе число" value= <%=request.getParameter("val2")%>>
      <input type="submit" value = "*" name = "mul">
      <input type="submit" value = "/" name = "div">
      <input type="submit" value = "+" name = "add">
      <input type="submit" value = "-" name = "sub">
    </form>
    <%
      Enumeration names = request.getParameterNames();
      if (names.hasMoreElements()) {
        String name = null;
        String action = null;
        String val1 = null;
        String val2 = null;
        double result = 0;
        while (names.hasMoreElements()) {
          name = (String) names.nextElement();
          action = request.getParameter(name);
          if(name.equals("val1"))
            val1 = request.getParameter(name);
           else if(name.equals("val2"))
            val2 = request.getParameter(name);
           else if(name.equals("mul")){
             result = Double.parseDouble(val1) * Double.parseDouble(val2);
             action = " * ";
           }
           else if(name.equals("div")){
            result = Double.parseDouble(val1) / Double.parseDouble(val2);
            action = " / ";
           }
           else if(name.equals("add")) {
            result = Double.parseDouble(val1) + Double.parseDouble(val2);
            action = " + ";
           }
           else if(name.equals("sub")) {
            result = Double.parseDouble(val1) - Double.parseDouble(val2);
            action = " - ";
           }

    %>
    <p>
    </p>
    <%}%>
    <%= val1 + action + val2 + " = " + result
    %>
    <%}%>
  </body>
</html>
