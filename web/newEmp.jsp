<%@ page import="java.util.Enumeration" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="logic.DataBaseHand" %><%--
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
    <meta charset="UTF-8">
    <title>New Employ</title>
</head>
<body>
<div>
    <form type="text" action="#" method="get">
        <input id="empno" type="number" name="empno" placeholder="Введите номер">
        <input id="ename" type="text" name="ename" placeholder="Введите имя">
        <select name = "job">
            <option disabled>Выберите должность</option>
            <option value="SALESMAN"> SALESMAN </option>
            <option value="ANALYST"> ANALYST </option>
            <option value="CLERK"> CLERK </option>
            <option value="MANAGER"> MANAGER </option>
            <option value="PRESIDENT"> PRESIDENT </option>
        </select>
        <input id="mgr" type="number" name="mgr" placeholder="Введите номер менеджера">
        <input id="hiredate" type="text" name="hiredate" placeholder="Введите дату приема на работу">
        <input id="sal" type="number" name="sal" placeholder="Введите зарплату">
        <input id="comm" type="number" name="comm" placeholder="Введите коммисионные">
        <select name = "deptno">
            <option disabled>Выберите номер департамента</option>
            <option value="10"> 10 </option>
            <option value="20"> 20 </option>
            <option value="30"> 30 </option>
        </select>
        <input type="submit" name="submit_add_new_emp" value="Добавить сотрудника"/>
    </form>
</div>
<%
    if(request.getParameter("submit_add_new_emp") != null){
        InitialContext initialContext = new InitialContext();
        DataBaseHand bean = (DataBaseHand) initialContext.lookup("java:module/DataBaseHand");
        bean.addNewEmp(request.getParameter("empno"), request.getParameter("ename"), request.getParameter("job"),
                request.getParameter("mgr"), request.getParameter("hiredate"), request.getParameter("sal"),
                request.getParameter("comm"), request.getParameter("deptno"));
    }
%>
<script>
    function getVal(value) {
        const query = window.location.search.substring(1);
        const vars = query.split('&');
        let str;

        for (let i = 0; i < vars.length; i++) {
            let pair = vars[i].split('=');
            if (pair[0] === value) {
                str = pair[1];

                return str.toString();
            }
        }
        return alert(sadfasd);
    }
    document.getElementById("ename").setAttribute("value", getVal("empname"));
</script>
</body>
</html>
