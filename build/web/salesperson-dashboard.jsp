<%-- 
    Document   : salesperson-dashboard
    Created on : Apr 18, 2019, 10:35:50 PM
    Author     : robert
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Kayenet | sales person</title>

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
    <% 
       // if(session.getAttribute("salesPersonName").equals(null)){
        //    response.sendRedirect("index.jsp");
        //}
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
            <a href="salesperson-dashboard.jsp" class="logo"><b>KAYENET SHOPS</b></a>
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
                      <a class="active" href="salesperson-dashboard.jsp">
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
                      <a href="javascript:;" >
                        <i class="fa fa-archive"></i>
                        <span>Products</span>
                      </a>
                      <ul class="sub">
                        <li><a  href="add-products.jsp">Add Products</a></li>
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
          	<h3><i class="fa fa-angle-right"></i> Welcome</h3>
          	<div class="row mt">
                    <div class="col-lg-12">
                        <p>Perform your daily activities.</p>
                    </div>
          	</div>
			
            </section><! --/wrapper -->
      </section><!-- /main content -->
      <jsp:include page="footer.jsp"></jsp:include>

