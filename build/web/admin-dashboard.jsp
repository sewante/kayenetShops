<%-- 
    Document   : admin-dashboard
    Created on : Apr 18, 2019, 2:18:44 PM
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

    <title>Kayenet | admin</title>

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
            <a href="admin-dashboard.jsp" class="logo"><b>KAYENET SHOPS</b></a>
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
                  <h5 class="centered">Admin  
                    <% 
                        try {
                          
                            if(session.getAttribute("adminName").equals(null)) {

                            } 
                            else {
                                  out.print( "| "+session.getAttribute("adminName"));
                              } 
                        }
                        catch (NullPointerException npe){
                            out.print("Session has expired");
                        }
                    %>
                  </h5>
              	  <!-- Dashboard Welcome -->	
                  <li class="mt">
                      <a class="active" href="admin-dashboard.jsp">
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
          <section class="wrapper">

              <div class="row">
                <div class="col-lg-9 main-chart">
                  <!-- Content for Welcome
                </div><!-- /row mt -->	
                  
                      
                      <div class="row mt">
                      <!-- SERVER STATUS PANELS -->
                      	<div class="col-md-4 col-sm-4 mb">
                            <div class="white-panel pn donut-chart">
                                    <div class="white-header">
                                        <h5>SERVER LOAD</h5>
                                    </div>
                                    <div class="row">
                                            <div class="col-sm-6 col-xs-6 goleft">
                                                    <p><i class="fa fa-database"></i> 70%</p>
                                            </div>
                                    </div>
                                    <canvas id="serverstatus01" height="120" width="120"></canvas>
                                    <script>
                                            var doughnutData = [
                                                    {
                                                        value: 70,
                                                        color:"#68dff0"
                                                    },
                                                    {
                                                        value : 30,
                                                        color : "#fdfdfd"
                                                    }
                                                ];
                                            var myDoughnut = new Chart(document.getElementById("serverstatus01").getContext("2d")).Doughnut(doughnutData);
                                    </script>
                            </div><! --/grey-panel -->
                      	</div><!-- /col-md-4-->
                      	

                      	<div class="col-md-4 col-sm-4 mb">
                            <div class="white-panel pn">
                                <div class="white-header">
                                    <h5>TOP PRODUCT</h5>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 col-xs-6 goleft">
                                        <p><i class="fa fa-heart"></i> 122</p>
                                    </div>
                                    <div class="col-sm-6 col-xs-6"></div>
                                </div>
                                <div class="centered">
                                    <img src="/kayenetShops/assets/img/product.png" width="120">
                                </div>
                            </div>
                      	</div><!-- /col-md-4 -->
                      	
                        <div class="col-md-4 mb">
                            <!-- WHITE PANEL - TOP USER -->
                            <div class="white-panel pn">
                                <div class="white-header">
                                    <h5>TOP USER</h5>
                                </div>
                                <p><img src="assets/img/ui-sam.jpg" class="img-circle" width="80"></p>
                                <p><b>Moo</b></p>
                                <div class="row">
                                    <div class="col-md-6">
                                        <p class="small mt">MEMBER SINCE</p>
                                        <p>2018</p>
                                    </div>
                                    <div class="col-md-6">
                                        <p class="small mt">TOTAL SALES</p>
                                        <p> 1,002 bags</p>
                                    </div>
                                </div>
                            </div>
                        </div><!-- /col-md-4 -->
                      	

                    </div><!-- /row -->
                    	
                        <div class="row">

                        </div><!-- /row -->
					
                  </div><!-- /col-lg-9 END SECTION MIDDLE -->
                  
                  
      <!-- **********************************************************************************************************************************************************
      RIGHT SIDEBAR CONTENT
      *********************************************************************************************************************************************************** -->                  
                  
                  <div class="col-lg-3 ds">
                        <!-- CALENDAR-->
                        <div id="calendar" class="mb">
                            <div class="panel green-panel no-margin">
                                <div class="panel-body">
                                    <div id="date-popover" class="popover top" style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
                                        <div class="arrow"></div>
                                        <h3 class="popover-title" style="disadding: none;"></h3>
                                        <div id="date-popover-content" class="popover-content"></div>
                                    </div>
                                    <div id="my-calendar"></div>
                                </div>
                            </div>
                        </div><!-- / calendar -->
                      
                  </div><!-- /col-lg-3 -->
              </div><!-- /row -->
          </section>
      </section>
      <jsp:include page="footer.jsp"></jsp:include>
