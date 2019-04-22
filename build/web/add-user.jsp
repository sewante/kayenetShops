<%-- 
    Document   : add-user
    Created on : Apr 18, 2019, 4:16:22 PM
    Author     : robert
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>Kayenet | add-user</title>

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
        <c:if test="${param.submit eq 'Save'}">
            <%!
                public Statement getStatement(){
                    Statement state = null;
                    PrintWriter out = null;
                    try{ 
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost/kayenetshops","root","");
                        state = (Statement)con.createStatement();
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
                Statement addUserStatement = getStatement();
                
                //get the data from the form
                try {
                    String firstName = request.getParameter("fName");
                    if(firstName.isEmpty()) {
                        response.sendRedirect("add-user.jsp?emptyFirstName=fill in the first name");
                    }
                    String lastName = request.getParameter("lName");
                    if(lastName.isEmpty()){
                        response.sendRedirect("add-user.jsp?emptyLastName=fill in the last name");
                    }
                    String address = request.getParameter("address");
                    if(address.isEmpty()){
                        response.sendRedirect("add-user.jsp?emptyAddress=fill in the address");
                    }
                    String phoneNmuber = request.getParameter("phone");
                    try {
                        int num = Integer.parseInt(phoneNmuber);
                    }
                    catch (NumberFormatException nre){
                        response.sendRedirect("add-user.jsp?notPhoneNumber=Provide a phoneNumber");
                    }
                    String userName = request.getParameter("uName");
                    String password = request.getParameter("password");
                    String passwordMatch = request.getParameter("passwordconf");
                    if( ! password.equals(passwordMatch)){
                        response.sendRedirect("add-user.jsp?notMatch=Passwords do not match");
                    }
                    String kioskBranch = request.getParameter("branch");
                    String referee = request.getParameter("referee");
                    
                    //save the data to the db now
                    String salesPersonSql = "INSERT INTO salespersons SET firstname='"+firstName+"',"
                            + "lastname='"+lastName+"',username='"+userName+"',"
                            + "password='"+password+"',phonenumber='"+phoneNmuber+"',"
                            + "address='"+address+"',branch='"+kioskBranch+"',"
                            + "referee='"+referee+"',status='active'";
                    if(addUserStatement.executeUpdate(salesPersonSql) >= 0) {
                        out.print(""
                                + "<script type='text/javascript'>"
                                +"alert('Operation successful');"
                                +"</script>"
                                + "");
                    }
                    else {
                      out.print(""
                                + "<script type='text/javascript'>"
                                +"alert('Operation Failed, Try again');"
                                +"</script>"
                                + "");  
                    }
                }
                catch(IllegalStateException ise){
                    
                }
                
                
            %>
        </c:if>
        <section id="container">
        <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
        <!--header start-->
        <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
              <!--logo start-->
              <a href="add-user.jsp" class="logo"><b>KAYENET SHOPS</b></a>
              <!--logo end-->
              <div class="nav notify-row" id="top_menu">
              <!--  notification end -->
              </div>
              <div class="top-menu">
                  <ul class="nav pull-right top-menu">
                      <li><a class="logout" href="admin-login.jsp">Logout</a></li>
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
                  <h5 class="centered">Admin | <% out.print(session.getAttribute("adminName")); %>
                  </h5>
              	  <!-- Dashboard Welcome -->	
                  <li class="mt">
                      <a href="admin-dashboard.jsp">
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
                        <li><a  href="daily-sales.jsp">Daily Sales</a></li>
                        <li><a  href="weekly-sales.jsp">Weekly Sales</a></li>
                        <li><a  href="monthly-sales.jsp">Monthly Sales</a></li>
                      </ul>
                  </li>
                  <!-- Products -->
                  <li class="sub-menu">
                      <a href="javascript:;" >
                        <i class="fa fa-archive"></i>
                        <span>Products</span>
                      </a>
                      <ul class="sub">
                        <li><a  href="product-listing.jsp">Product Listing</a></li>
                        <li><a  href="gallery.jsp">Product Gallery</a></li>
                      </ul>
                  </li>
                  <!-- Users -->
                  <li class="sub-menu">
                      <a class="active" href="javascript:;" >
                        <i class="fa fa-user"></i>
                        <span>Users</span>
                      </a>
                      <ul class="sub">
                        <li class="active"><a href="add-user.jsp">Add User</a></li>
                        <li><a  href="deactivate-user.jsp">Deactivate User</a></li>
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
          	<h3><i class="fa fa-angle-right"></i> Add a New User</h3>
          	<div class="row mt">
                    <div class="col-lg-12">
                        <p> 
                            <font color='red'>
                                <c:if test="${not empty param.activeUserPresent}" >
                                    <c:out value="${param.activeUserPresent}"/>
                                </c:if>
                            </font>
                        </p>
                        <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> Enter Sales person's Data </h4>
                          <form class="form-horizontal style-form" method="post" action="add-user.jsp">
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">First Name</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="fName">
                                        <span class="help-block">
                                            <font color='red'>
                                                <c:if test="${not empty param.emptyFirstName}" >
                                                    <c:out value="${param.emptyFirstName}"/>
                                                </c:if>
                                            </font>
                                        </span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Last Name</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" name="lName">
                                        <span class="help-block">
                                            <font color='red'>
                                                <c:if test="${not empty param.emptyLastName}" >
                                                    <c:out value="${param.emptyLastName}"/>
                                                </c:if>
                                            </font>
                                        </span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Address</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" name="address" required="required">
                                        <span class="help-block">
                                            <font color='red'>
                                                <c:if test="${not empty param.emptyAddress}" >
                                                    <c:out value="${param.emptyAddress}"/>
                                                </c:if>
                                            </font>
                                        </span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Phone Number</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" name="phone" maxlength="10" minlength="10">
                                        <span class="help-block">
                                            <font color='red'>
                                                <c:if test="${not empty param.notPhoneNumber}" >
                                                    <c:out value="${param.notPhoneNumber}"/>
                                                </c:if>
                                            </font>
                                        </span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Username</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" id="focusedInput" type="text" name="uName" required="required">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Password</label>
                                    <div class="col-sm-10">
                                        <input type="password"  id="focusedInput" class="form-control" name="password" required="required">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Confirm Password</label>
                                    <div class="col-sm-10">
                                        <input type="password"  class="form-control" name="passwordconf">
                                        <span class="help-block">
                                            <font color='red'>
                                                    <c:if test="${not empty param.notMatch}" >
                                                        <c:out value="${param.notMatch}"/>
                                                    </c:if>
                                            </font>
                                        </span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Branch</label>
                                    <!-- First get the branches -->
                                    <sql:setDataSource var="db" scope="session" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/kayenetshops" user="root" password=""></sql:setDataSource>
                                    <sql:query dataSource="${db}" var="branchesResult">
                                        select branchId,branchName from branches;
                                    </sql:query>
                                    <div class="col-sm-10">
                                        <select class="form-control" name="branch">
                                            <c:forEach var="col" items="${branchesResult.rows}">
                                                <option value='<c:out value="${col.branchId}"></c:out>'>
                                                    <c:out value="${col.branchName}"></c:out>
                                                </option>
                                            </c:forEach>    
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Referee</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" name="referee" required="required">
                                    </div>
                                </div>
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
      </section><!-- /MAIN CONTENT -->
      <jsp:include page="footer.jsp"></jsp:include>

