<%-- 
    Document   : add-products
    Created on : Apr 21, 2019, 12:22:23 PM
    Author     : robert
--%>

<%@page import="java.io.InputStream"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Kayenet | Add Products</title>

    <!-- Bootstrap core CSS -->
    <link href="/kayenetShops/assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="/kayenetShops/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/kayenetShops/assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="/kayenetShops/assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="/kayenetShops/assets/lineicons/style.css">    
    
    <!-- Custom styles for this template -->
    <link href="/kayenetShops/assets/css/style.css" rel="stylesheet">
    <link href="/kayenetShops/assets/css/style-responsive.css" rel="stylesheet">

    <script src="/kayenetShops/assets/js/chart-master/Chart.js"></script>
    
  </head>

  <body>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!-- Get the form data -->
<c:if test="${param.submit eq 'Save'}">
    <c:out value="${'Got here'}"></c:out>
    <h1>here</h1>
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

          String bagid = request.getParameter("bagId");
          String bagName =request.getParameter("bagName");
          if(bagName.isEmpty()){
              //response.sendRedirect("add-product.jsp?emptyBagName=fill in the Bag name");
          }
          String price = request.getParameter("price");
          String quantity = request.getParameter("quantity");
          try {
              int num = Integer.parseInt(price);
              int num2 = Integer.parseInt(quantity);
          }
          catch (NumberFormatException nfe){
              //response.sendRedirect("add-product.jsp?notDigits=Provide a numbers");
          }

          String description = request.getParameter("description");
          String salesPerson = request.getParameter("owner");


          //get the uploaded image
          //String imageLoaction = request.getParameter("bagImage");
          Part img = request.getPart("bagImage");
          InputStream inputStream = null;
          FileInputStream file = null;
          PreparedStatement bagStatement = null;

          try {
              if(img != null){
                  inputStream = img.getInputStream();
              }
              //File imageOfBag  = new File(imageLoaction);
              //file = new FileInputStream(imageOfBag);

              String addBagSql = "INSERT INTO products(bagId,bagname,description,price,quantity,owner,image)"
                      + "VALUES(?,?,?,?,?,?,?)";
              bagStatement = getStatement(addBagSql);

              bagStatement.setString(1, bagid);
              bagStatement.setString(2, bagName);
              bagStatement.setString(3, description);
              bagStatement.setFloat(4, Float.parseFloat(price));
              bagStatement.setInt(5, Integer.parseInt(quantity));
              bagStatement.setInt(6, Integer.parseInt(salesPerson));
             // bagStatement.setBinaryStream(7, (InputStream)file, (int)imageOfBag.length());
              if(inputStream != null) {
                  bagStatement.setBlob(7, inputStream);
              }
              else {
                  response.sendRedirect("add-products.jsp");
              }

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
  %>
</c:if>
    <%!
       //generate the bagID randomly
       String bagId = "";
       public String generateBagId() {
           Random random = new Random();    //random number object
           int myRand = random.nextInt(900) + 100;  //generate a random number from 0 to 899 and add 100 to it
           
           bagId = String.valueOf(myRand);

           return bagId;
        }
    %>
  <section id="container" >
      <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
      <!--header start-->
      <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="add-products.jsp" class="logo"><b>KAYENET SHOPS</b></a>
            <!--logo end-->
            <div class="nav notify-row" id="top_menu">
                <!--  notification end -->
            </div>
            <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    <li><a class="logout" href="logout.jsp">Logout</a></li>
            	</ul>
            </div>
        </header>
      <!--header end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
               <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><img src="/kayenetShops/assets/img/friends/fr-05.jpg" class="img-circle" width="60"></p>
                  <h5 class="centered">
                      <% 
                        try {
                          
                            if(session.getAttribute("salesPersonName").equals(null)) {

                            } 
                            else {
                                  out.print(session.getAttribute("salesPersonName"));
                              } 
                        }
                        catch (NullPointerException npe){
                            
                            response.sendRedirect("index.jsp");
                        }
                    %>
                  </h5>
              	  <!-- Dashboard Welcome -->	
                  <li class="mt">
                      <a href="salesperson-dashboard.jsp">
                        <i class="fa fa-dashboard"></i>
                        <span>Dashboard</span>
                      </a>
                  </li>
                  <!-- Sales -->
                  <li class="sub-menu">
                      <a href="javascript:;" >
                        <i class="fa fa-dollar"></i>
                        <span>Sales</span>
                      </a>
                      <ul class="sub">
                        <li><a  href="#">Enter Sales</a></li>
                        <li><a  href="#">Daily Sales</a></li>
                        <li><a  href="#">Weekly Sales</a></li>
                        <li><a  href="#">Monthly Sales</a></li>
                      </ul>
                  </li>
                  <!-- Products -->
                  <li class="sub-menu">
                      <a  class="active" href="javascript:;" >
                        <i class="fa fa-archive"></i>
                        <span>Products</span>
                      </a>
                      <ul class="sub">
                        <li class="active"><a  href="add-products.jsp">Add Products</a></li>
                        <li><a  href="#">Product Listing</a></li>
                        <li><a  href="sales-product-gallery.jsp">Product Gallery</a></li>
                      </ul>
                  </li>

              </ul>
              <!-- sidebar menu end-->             
          </div>
      </aside>
      <!--sidebar end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
       <section id="main-content">
            <section class="wrapper site-min-height">
          	<h3><i class="fa fa-angle-right"></i> Add New Bags / Products</h3>
          	<div class="row mt">
                    <div class="col-lg-12">
                        <p>Error shows here</p>
                        <div class="form-panel">
                            <h4 class="mb"><i class="fa fa-angle-right"></i> Enter the product's Data</h4>
                                <sql:setDataSource var="db" scope="session" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/kayenetshops" user="root" password=""></sql:setDataSource>
                                    <sql:query dataSource="${db}" var="salesPerson">
                                        select userId,branch from salespersons where userName='<% out.print(session.getAttribute("salesPersonName")); %>';
                                    </sql:query>
                                <c:forEach var="col" items="${salesPerson.rows}">
                                    <c:set scope="session" var="branchId" value="${col.branch}"></c:set>
                                </c:forEach>
                                <% 
                                    String branchId;

                                    try {
                                        branchId = session.getAttribute("branchId").toString();
                                        String tokens[] = new String[2];
                                        tokens = branchId.split("-");

                                        String bagId = tokens[0] +"-"+ generateBagId();     //construct a bag id
                                        session.setAttribute("bagId", bagId);   //add the generated bag id to the session
                                    }
                                    catch(ArrayIndexOutOfBoundsException aiof) {
                                        out.println("Error: "+aiof.getMessage());
                                    }
                                    catch(NullPointerException npe){
                                        out.println(npe.getMessage());
                                    }

                                %>
                                <form class="form-horizontal style-form" method="POST" action="process.jsp" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Bag ID</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" id="disabledInput" type="text" name="idOfBag" value='<% out.print(session.getAttribute("bagId")); %>' disabled>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Bag Name</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" name="nameOfBag">
                                        <span class="help-block">
                                            <font color='red'>
                                                <c:if test="${not empty param.emptyBagName}" >
                                                    <c:out value="${param.emptyBagName}"/>
                                                </c:if>
                                            </font>
                                        </span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Price</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="number" name="priceOfBag" required="required">
                                        <span class="help-block">
                                            <font color='red'>
                                                <c:if test="${not empty param.notDigits}" >
                                                    <c:out value="${param.notDigits}"/>
                                                </c:if>
                                            </font>
                                        </span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Quantity</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="number" name="quantityOfBag" minlength="1">
                                        <span class="help-block">
                                            <font color='red'>
                                                <c:if test="${not empty param.wrongQuantity}" >
                                                    <c:out value="${param.wrongQuantity}"/>
                                                </c:if>
                                            </font>
                                        </span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Image</label>
                                    <div class="col-sm-10">
                                        <input class="btn btn-default" type="file" name="imageOfBag" required="required">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Description</label>
                                    <div class="col-sm-10">
                                        <textarea type="text" class="form-control" name="descriptionOfBag" required="required">
                                            
                                        </textarea>
                                        
                                    </div>
                                </div>
                                    <c:forEach var="col" items="${salesPerson.rows}">
                                        <input class="form-control" type="hidden" name="ownerOfBag" value='<c:out value="${col.userId}"></c:out>'>
                                    </c:forEach>
                                <div class="form-group">
                                  <div class="col-sm-10">
                                      <p align="right"> <input  class="btn btn-primary" type="submit" name="submit" value="Save"> </p>
                                  </div>
                                </div>
                              </form>
			</div>
                    </div>
          	</div>
			
            </section><! --/wrapper -->
      </section><!-- /main content -->
      <jsp:include page="footer.jsp"></jsp:include>

