<%-- 
    Document   : admin-login
    Created on : Apr 18, 2019, 4:01:32 PM
    Author     : rober
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <title>Kayenet | admin Login</title>
	<link rel="stylesheet" type="text/css" href="/kayenetShops/css/login.css"> 
    </head>
    <body>
        
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
        <br><br>
        <h1>Kayenet Ladies Bags</h1>
        <br>
        <h2 align="center">Administartor</h2>
        <br>
        <div class="box" id="loginForm">
            <!--the code bellow is used to display the message of the input validation-->
            <h1>Login</h1>
            <form action="admin-login.jsp" name="loginform" method="POST">
                <p><label>username</label></p>
                <label><input type="name" name="username" id="" placeholder="Enter username" required></label>
                <p><label>Password</label></p>
                <label><input type="password" name="password" id="" placeholder="Enter Password" required/></label>
                <p><label><input type="submit" name="submit" value="Login" /></label></p>
            </form>
            <p>
                <font color='red'>
                    <c:if test="${not empty param.errMsg}" >
                        <c:out value="${param.errMsg}"/>
                    </c:if>
                </font>
            </p>
            <!-- verify login -->
            <c:if test="${param.submit eq 'Login'}">
                <%-- verify the login info of the admin --%>
                
                <%-- admin has not provided the password or the username --%>
                <c:if test="${empty param.username or empty param.password}">
                    <c:redirect url="admin-login.jsp">
                        <c:param name="errMsg" value="Please Enter the Username and Password"></c:param>
                    </c:redirect>
                </c:if>
                
                <%-- admin has provided the username and password --%>
                <c:if test="${(not empty param.username) and (not empty param.password)}">
                    <sql:setDataSource var="db" scope="session" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/kayenetshops" user="root" password=""></sql:setDataSource>
                    <sql:query dataSource="${db}" var="adminResult">
                        select username,password from administrators where status='active';
                    </sql:query>
                    <c:forEach var="col" items="${adminResult.rows}">
                        <c:choose>
                            <c:when test="${(col.username eq param.username) and (col.password eq param.password)}">
                                <c:set scope="session" var="adminName" value="${col.username}"></c:set>
                                <c:redirect url="admin-dashboard.jsp">
                                    <c:param name="adminName" value="${col.username}"></c:param>
                                </c:redirect>
                            </c:when>
                            <c:otherwise>
                                <c:redirect url="admin-login.jsp">
                                    <c:param name="errMsg" value="Wrong Username or Password"></c:param>
                                </c:redirect>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </c:if>
            </c:if>
        </div>
    </body>
</html>
