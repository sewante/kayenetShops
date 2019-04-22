package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class add_002duser_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <meta name=\"description\" content=\"\">\n");
      out.write("        <meta name=\"author\" content=\"Dashboard\">\n");
      out.write("        <meta name=\"keyword\" content=\"Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina\">\n");
      out.write("\n");
      out.write("        <title>Kayenet | add-user</title>\n");
      out.write("\n");
      out.write("        <!-- Bootstrap core CSS -->\n");
      out.write("        <link href=\"/kayenetShops/assets/css/bootstrap.css\" rel=\"stylesheet\">\n");
      out.write("        <!--external css-->\n");
      out.write("        <link href=\"/kayenetShops/assets/font-awesome/css/font-awesome.css\" rel=\"stylesheet\" />\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"/kayenetShops/assets/css/zabuto_calendar.css\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"/kayenetShops/assets/js/gritter/css/jquery.gritter.css\" />\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"/kayenetShops/assets/lineicons/style.css\">    \n");
      out.write("\n");
      out.write("        <!-- Custom styles for this template -->\n");
      out.write("        <link href=\"/kayenetShops/assets/css/style.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"/kayenetShops/assets/css/style-responsive.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <script src=\"/kayenetShops/assets/js/chart-master/Chart.js\"></script>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("               \n");
      out.write("        <section id=\"container\">\n");
      out.write("        <!-- **********************************************************************************************************************************************************\n");
      out.write("        TOP BAR CONTENT & NOTIFICATIONS\n");
      out.write("        *********************************************************************************************************************************************************** -->\n");
      out.write("        <!--header start-->\n");
      out.write("        <header class=\"header black-bg\">\n");
      out.write("              <div class=\"sidebar-toggle-box\">\n");
      out.write("                  <div class=\"fa fa-bars tooltips\" data-placement=\"right\" data-original-title=\"Toggle Navigation\"></div>\n");
      out.write("              </div>\n");
      out.write("              <!--logo start-->\n");
      out.write("              <a href=\"add-user.jsp\" class=\"logo\"><b>KAYENET SHOPS</b></a>\n");
      out.write("              <!--logo end-->\n");
      out.write("              <div class=\"nav notify-row\" id=\"top_menu\">\n");
      out.write("              <!--  notification end -->\n");
      out.write("              </div>\n");
      out.write("              <div class=\"top-menu\">\n");
      out.write("                  <ul class=\"nav pull-right top-menu\">\n");
      out.write("                      <li><a class=\"logout\" href=\"admin-login.jsp\">Logout</a></li>\n");
      out.write("                  </ul>\n");
      out.write("              </div>\n");
      out.write("          </header>\n");
      out.write("        <!--header end-->\n");
      out.write("        <!-- **********************************************************************************************************************************************************\n");
      out.write("      MAIN SIDEBAR MENU\n");
      out.write("      *********************************************************************************************************************************************************** -->\n");
      out.write("      <!--sidebar start-->\n");
      out.write("      <aside>\n");
      out.write("          <div id=\"sidebar\"  class=\"nav-collapse \">\n");
      out.write("              <!-- sidebar menu start-->\n");
      out.write("              <ul class=\"sidebar-menu\" id=\"nav-accordion\">\n");
      out.write("              \n");
      out.write("              \t  <p class=\"centered\"><img src=\"/kayenetShops/assets/img/friends/fr-05.jpg\" class=\"img-circle\" width=\"60\"></p>\n");
      out.write("                  <h5 class=\"centered\">Admin | ");
 out.print(session.getAttribute("adminName")); 
      out.write("\n");
      out.write("                  </h5>\n");
      out.write("              \t  <!-- Dashboard Welcome -->\t\n");
      out.write("                  <li class=\"mt\">\n");
      out.write("                      <a href=\"admin-dashboard.jsp\">\n");
      out.write("                        <i class=\"fa fa-dashboard\"></i>\n");
      out.write("                        <span>Dashboard</span>\n");
      out.write("                      </a>\n");
      out.write("                  </li>\n");
      out.write("                  <!-- Sales -->\n");
      out.write("                  <li class=\"sub-menu\">\n");
      out.write("                      <a href=\"javascript:;\" >\n");
      out.write("                        <i class=\"fa fa-dollar\"></i>\n");
      out.write("                        <span>Sales</span>\n");
      out.write("                      </a>\n");
      out.write("                      <ul class=\"sub\">\n");
      out.write("                        <li><a  href=\"daily-sales.jsp\">Daily Sales</a></li>\n");
      out.write("                        <li><a  href=\"weekly-sales.jsp\">Weekly Sales</a></li>\n");
      out.write("                        <li><a  href=\"monthly-sales.jsp\">Monthly Sales</a></li>\n");
      out.write("                      </ul>\n");
      out.write("                  </li>\n");
      out.write("                  <!-- Products -->\n");
      out.write("                  <li class=\"sub-menu\">\n");
      out.write("                      <a href=\"javascript:;\" >\n");
      out.write("                        <i class=\"fa fa-archive\"></i>\n");
      out.write("                        <span>Products</span>\n");
      out.write("                      </a>\n");
      out.write("                      <ul class=\"sub\">\n");
      out.write("                        <li><a  href=\"product-listing.jsp\">Product Listing</a></li>\n");
      out.write("                        <li><a  href=\"gallery.jsp\">Product Gallery</a></li>\n");
      out.write("                      </ul>\n");
      out.write("                  </li>\n");
      out.write("                  <!-- Users -->\n");
      out.write("                  <li class=\"sub-menu\">\n");
      out.write("                      <a class=\"active\" href=\"javascript:;\" >\n");
      out.write("                        <i class=\"fa fa-user\"></i>\n");
      out.write("                        <span>Users</span>\n");
      out.write("                      </a>\n");
      out.write("                      <ul class=\"sub\">\n");
      out.write("                        <li class=\"active\"><a href=\"add-user.jsp\">Add User</a></li>\n");
      out.write("                        <li><a  href=\"deactivate-user.jsp\">Deactivate User</a></li>\n");
      out.write("                      </ul>\n");
      out.write("                  </li>\n");
      out.write("\n");
      out.write("              </ul>\n");
      out.write("              <!-- sidebar menu end-->\n");
      out.write("          </div>\n");
      out.write("      </aside>\n");
      out.write("      <!--sidebar end-->\n");
      out.write("      \n");
      out.write("        <!-- **********************************************************************************************************************************************************\n");
      out.write("      MAIN CONTENT\n");
      out.write("      *********************************************************************************************************************************************************** -->\n");
      out.write("      <!--main content start-->\n");
      out.write("      <section id=\"main-content\">\n");
      out.write("            <section class=\"wrapper site-min-height\">\n");
      out.write("          \t<h3><i class=\"fa fa-angle-right\"></i> Add a New User</h3>\n");
      out.write("          \t<div class=\"row mt\">\n");
      out.write("                    <div class=\"col-lg-12\">\n");
      out.write("                        <p>Place your content here.</p>\n");
      out.write("                        <div class=\"form-panel\">\n");
      out.write("                  \t  <h4 class=\"mb\"><i class=\"fa fa-angle-right\"></i> Form Elements</h4>\n");
      out.write("                          <form class=\"form-horizontal style-form\" method=\"get\">\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label class=\"col-sm-2 col-sm-2 control-label\">Default</label>\n");
      out.write("                                    <div class=\"col-sm-10\">\n");
      out.write("                                        <input type=\"text\" class=\"form-control\">\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label class=\"col-sm-2 col-sm-2 control-label\">Help text</label>\n");
      out.write("                                    <div class=\"col-sm-10\">\n");
      out.write("                                        <input type=\"text\" class=\"form-control\">\n");
      out.write("                                        <span class=\"help-block\">A block of help text that breaks onto a new line and may extend beyond one line.</span>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label class=\"col-sm-2 col-sm-2 control-label\">Rounder</label>\n");
      out.write("                                    <div class=\"col-sm-10\">\n");
      out.write("                                        <input type=\"text\" class=\"form-control round-form\">\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label class=\"col-sm-2 col-sm-2 control-label\">Input focus</label>\n");
      out.write("                                    <div class=\"col-sm-10\">\n");
      out.write("                                        <input class=\"form-control\" id=\"focusedInput\" type=\"text\" value=\"This is focused...\">\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label class=\"col-sm-2 col-sm-2 control-label\">Disabled</label>\n");
      out.write("                                    <div class=\"col-sm-10\">\n");
      out.write("                                        <input class=\"form-control\" id=\"disabledInput\" type=\"text\" placeholder=\"Disabled input here...\" disabled>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label class=\"col-sm-2 col-sm-2 control-label\">Placeholder</label>\n");
      out.write("                                    <div class=\"col-sm-10\">\n");
      out.write("                                        <input type=\"text\"  class=\"form-control\" placeholder=\"placeholder\">\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label class=\"col-sm-2 col-sm-2 control-label\">Password</label>\n");
      out.write("                                    <div class=\"col-sm-10\">\n");
      out.write("                                        <input type=\"password\"  class=\"form-control\" placeholder=\"\">\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label class=\"col-lg-2 col-sm-2 control-label\">Static control</label>\n");
      out.write("                                    <div class=\"col-lg-10\">\n");
      out.write("                                      <p class=\"form-control-static\">email@example.com</p>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </form>\n");
      out.write("\t\t\t</div>\n");
      out.write("                    </div>\n");
      out.write("          \t</div>\n");
      out.write("\t\t\t\n");
      out.write("            </section><! --/wrapper -->\n");
      out.write("      </section><!-- /MAIN CONTENT -->\n");
      out.write("      ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write('\n');
      out.write('\n');
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
