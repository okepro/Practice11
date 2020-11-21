<%@ page import="java.util.Enumeration, logic.DataBaseHand" %>
<%@ page import="logic.Emp" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.sql.Date" %><%--
  Created by IntelliJ IDEA.
  User: MSI
  Date: 10/27/2020
  Time: 7:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorEmp.jsp" %>
<html>
<head>
    <meta charset="UTF-8" http-equiv="Content-Type" content="text/html" />
    <meta  name = "description" content="Описание Web-страницы"/>
    <meta  name = "description" content="Описание Web-страницы"/>
    <link type="text/css" rel = "stylesheet" href="main.css"/>
    <title>DataBase</title>
</head>
<body>
<form class = "form_emp" name="form_emp" action="" method="get">
    <p>
        <label for="empno">Номер сотрудника</label>
        <input id="empno" type="text" name="empno" placeholder="Введите номер сотрудника"/>
        <input id="subempno" type="submit" name="submit_find_empno" value="Подтвердить номер"/>
    </p>
    <script>
        document.getElementById("subempno").onclick = function (event) {
            var val = document.getElementById("empno").value;
            if(isNaN(+val)) {
                event.preventDefault();
                alert("Введите в поле 'Номер сотрудника' числа");
            }
        };
    </script>
    <p>
        <label for="empname">Имя сотрудника</label>
        <input id="empname"  type="text" name="empname" >
        <input type="submit" name="submit_find_name" value="Подтвердить имя"/>
    </p>
    <script>
        document.getElementById("empname").onmouseover = function () {
            document.getElementById("empname").setAttribute("placeholder", "Например, Иванов");
        }
        document.getElementById("empname").onmouseout = function () {
            document.getElementById("empname").removeAttribute("placeholder");
        }
    </script>
</form>
<form class = "form_all_emp" name="form_all_emp" action="#" method="get">
    <p>
        <input type="submit" name="submit_all" value="Все сотрудники"/>
    </p>
</form>

<p class = "new_emp"><a href="newEmp.jsp">Создать нового сотрудника</a></p>

<table class = "emp_table">
    <caption>Таблица сотрудников</caption>
    <tr>
        <th></th>
        <th>Номер сотрудника</th>
        <th>Имя сотрудника</th>
        <th>Должность сотрудника</th>
        <th>Дата принятия на работу</th>
        <th>Департамент</th>
        <th>Удалить</th>
    </tr>
        <%if (request.getParameter("submit_all") != null || request.getParameter("empname") != null || request.getParameter("empno") != null) {
            List<Emp> list = null;

//            DataBaseHand db = new DataBaseHand();
            InitialContext ic = new InitialContext();
            DataBaseHand bean = (DataBaseHand)ic.lookup("java:module/DataBaseHand");
            if (request.getParameter("submit_all") != null) {
                list = bean.showAllEmp();
            } else if(request.getParameter("submit_find_empno") != null) {
                list = bean.showEmpByNumber(request.getParameter("empno"));
                if (list.size() == 0) throw new Exception();
            } else if (request.getParameter("submit_find_name") != null ) {
                list = bean.showEmpByName(request.getParameter("empname"));
                if (list.size() == 0) throw new Exception();
            }

            for (Emp el:list) {
                String empno= el.getEmpno() + "";
                String ename = el.getEname();
                String job = el.getJob();
                Date hiredate = el.getHiredate();
                String deptno = el.getDeptno() + "";

        %>
    <form action="" method="get">
    <tr>
        <td><input type="checkbox" name="check1" value="emp"></td>
        <td><%=empno%></td>
        <td><%=ename%></td>
        <td><%=job%></td>
        <td><%=hiredate%></td>
        <td><%=deptno%></td>
        <td><a href="/data-base-jsp?id=<%=empno%>&submit_all=Все+сотрудники#">Удалить</a></td>
    </tr>
    </form>
        <%}%>

</table>
<%}%>
<%
    if(request.getParameter("id") != null) {
        InitialContext initialContext = new InitialContext();
        DataBaseHand bean = (DataBaseHand) initialContext.lookup("java:module/DataBaseHand");
        bean.deleteEmp(request.getParameter("id"));
    }
%>
<script>
    function delTd(id) {
        event.preventDefault();
        if(confirm("Удалить?")) {
            id.setAttribute("style", "visibility:hidden");
        }
    }
</script>
</body>
</html>
