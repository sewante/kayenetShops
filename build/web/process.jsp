<%-- 
    Document   : process
    Created on : Apr 21, 2019, 4:59:50 PM
    Author     : rober
--%>

<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>process</title>
    </head>
    <body>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

            <%!
              //prepared statement to execute the querries on the database
              public PreparedStatement getStatement(String sql){
                  PreparedStatement state = null;
                  PrintWriter out = null;
                  try{ 
                      Class.forName("com.mysql.jdbc.Driver");
                      Connection con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost/kayenetshops","root","");
                      state = (PreparedStatement)con.prepareStatement(sql);
                  }catch(ClassNotFoundException err){
                      out.print("Failed to Loaed the Database Driver"+err.getMessage());
                  }catch(SQLException err){
                      out.print("Failed to Connect to database"+err.getMessage());
                  }
                  if(state == null){
                      throw new IllegalArgumentException("statement is null");
                  }
                  return state;
              }
          %>

          <% 


              try{

                  String bagId = request.getParameter("idOfBag");
                  out.println("  ID "+bagId);
                  
                  String bagName =request.getParameter("bagName");
                  if(bagName.isEmpty()){
                      response.sendRedirect("add-product.jsp?emptyBagName=fill in the Bag name");
                  }
                  String price = request.getParameter("price");
                  String quantity = request.getParameter("quantity");
                  try {
                      int num = Integer.parseInt(price);
                      int num2 = Integer.parseInt(quantity);
                  }
                  catch (NumberFormatException nfe){
                      response.sendRedirect("add-product.jsp?notDigits=Provide a numbers");
                  }

                  String description = request.getParameter("description");
                  String salesPerson = request.getParameter("owner");

                  //get the uploaded image
                  String imageLoaction = request.getParameter("bagImage");

                  FileInputStream file = null;
                  PreparedStatement bagStatement = null;

                  try {
                      File imageOfBag  = new File(imageLoaction);
                      file = new FileInputStream(imageOfBag);

                      String addBagSql = "INSERT INTO products(bagId,bagname,description,price,quantity,owner,image)"
                              + "VALUES(?,?,?,?,?,?,?)";
                      bagStatement = getStatement(addBagSql);

                      bagStatement.setString(1, bagId);
                      bagStatement.setString(2, bagName);
                      bagStatement.setString(3, description);
                      bagStatement.setFloat(4, Float.parseFloat(price));
                      bagStatement.setInt(5, Integer.parseInt(quantity));
                      bagStatement.setInt(6, Integer.parseInt(salesPerson));
                      bagStatement.setBinaryStream(7, (InputStream)file, (int)imageOfBag.length());

                      if(bagStatement.executeUpdate() > 0){
                          out.print(""
                                  + "<script type='text/javascript'>"
                                  +"alert('Product Addition successful');"
                                  +"</script>"
                                  + ""); 
                      }
                      else {
                        out.print(""
                                  + "<script type='text/javascript'>"
                                  +"alert('Product Addition Failed, Try again');"
                                  +"</script>"
                                  + "");  
                      }  
                  }
                  catch(Exception ioe){
                      out.print("here");
                  }
              }
              catch(IllegalStateException ise){
                  out.print("Really");
              }
              catch(NullPointerException npe){
                  out.print("What is "+npe.getMessage());
              }
              response.sendRedirect("add-products.jsp");
          %>
          
    </body>
</html>
