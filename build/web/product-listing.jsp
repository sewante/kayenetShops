<%-- 
    Document   : product-listing
    Created on : Apr 21, 2019, 8:28:08 AM
    Author     : rober
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>Kayenet | product lists</title>

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
              <a href="resource.jsp" class="logo"><b>KAYENET SHOPS</b></a>
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
                      <a class="active" href="javascript:;" >
                        <i class="fa fa-archive"></i>
                        <span>Products</span>
                      </a>
                      <ul class="sub">
                        <li class="active" ><a  href="product-listing.jsp">Product Listing</a></li>
                        <li><a  href="gallery.jsp">Product Gallery</a></li>
                      </ul>
                  </li>
                  <!-- Users -->
                  <li class="sub-menu">
                      <a href="javascript:;" >
                        <i class="fa fa-user"></i>
                        <span>Users</span>
                      </a>
                      <ul class="sub">
                        <li><a  href="add-user.jsp">Add User</a></li>
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
          	<h3><i class="fa fa-angle-right"></i> Product Listing</h3>
          	<div class="row mt">
                    <div class="col-lg-12">
                        <p>Place your content here.</p>
                    </div>
          	</div>
			
            </section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->
      <jsp:include page="footer.jsp"></jsp:include>

