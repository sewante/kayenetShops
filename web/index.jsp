<%-- 
    Document   : salesLogin
    Created on : Apr 18, 2019, 9:36:19 AM
    Author     : rober
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <title>Kayenet-shops</title>
	<link rel="stylesheet" type="text/css" href="/kayenetShops/css/login.css"> 
    </head>
    <body>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>       	
        
        <br><br>
        <h1>Kayenet Ladies Bags</h1>
        <br>
        <h2 align="center">Sales Person Login</h2>
        <br>
        <div class="box" id="loginForm">
            <!--the code bellow is used to display the message of the input validation-->
            <h1>Login</h1>
            <form action="" name="loginform" method="POST">
                <p><label>username</label></p>
                <label><input type="name" name="username" id="" placeholder="Enter username" ></label>
                <p><label>Password</label></p>
                <label><input type="password" name="password" id="" placeholder="Enter Password" /></label>
                <p><label><input type="submit" name="submit" value="Login" /></label></p>
                
                <p> <a href="admin-login.jsp"> Admin Login </a> </p>
            </form>
            <p>
                <font color='red'>
                    <c:if test="${not empty param.errMsg}" >
                        <c:out value="${param.errMsg}"/>
                    </c:if>
                </font>
            </p>
        </div>
        <!-- verify login -->
            <c:if test="${param.submit eq 'Login'}">
                <%-- verify the login info of the sales person --%>
                
                <%-- sales person has not provided the password or the username --%>
                <c:if test="${empty param.username or empty param.password}">
                    <c:redirect url="index.jsp">
                        <c:param name="errMsg" value="Please Enter the Username and Password"></c:param>
                    </c:redirect>
                </c:if>
                
                <%-- sales person has provided the username and password --%>
                <c:if test="${(not empty param.username) and (not empty param.password)}">
                    <sql:setDataSource var="db" scope="session" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/kayenetshops" user="root" password=""></sql:setDataSource>
                    <sql:query dataSource="${db}" var="salesPersonResult">
                        select username,password from salespersons;
                    </sql:query>
                    <c:forEach var="col" items="${salesPersonResult.rows}">
                        <c:choose>
                            <c:when test="${(col.username eq param.username) and (col.password eq param.password)}">
                                <c:set scope="session" var="salesPersonName" value="${col.username}"></c:set>
                                <c:redirect url="salesperson-dashboard.jsp">
                                    <c:param name="salesPersonName" value="${col.username}"></c:param>
                                </c:redirect>
                            </c:when>
                            <c:otherwise>
                                <c:redirect url="index.jsp">
                                    <c:param name="errMsg" value="Wrong Username or Password"></c:param>
                                </c:redirect>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </c:if>
            </c:if>
    </body>
</html>
