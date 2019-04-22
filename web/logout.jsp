<%-- 
    Document   : logout
    Created on : Apr 21, 2019, 11:14:54 AM
    Author     : rober
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <% 
            try{
                
                if(session.getAttribute("salesPersonName").equals(null)){
                    response.sendRedirect("index.jsp"); 
                }
                else {
                    //session.removeAttribute("salesPersonName");
                    session.setAttribute("salesPersonName", null);
                    session.removeAttribute("bagId");
                    session.removeAttribute("branchId");
                    response.sendRedirect("index.jsp");
                }
            }
            catch(NullPointerException npe){
                response.sendRedirect("index.jsp"); 
            }
        %>
    </body>
</html>
