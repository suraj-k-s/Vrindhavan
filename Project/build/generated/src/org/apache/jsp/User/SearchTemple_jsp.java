package org.apache.jsp.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class SearchTemple_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/User/Head.jsp");
    _jspx_dependants.add("/User/Foot.jsp");
  }

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

      out.write('\n');
      DB.ConnectionClass con = null;
      synchronized (_jspx_page_context) {
        con = (DB.ConnectionClass) _jspx_page_context.getAttribute("con", PageContext.PAGE_SCOPE);
        if (con == null){
          con = new DB.ConnectionClass();
          _jspx_page_context.setAttribute("con", con, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Search Land</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"../Assets/Template/form.css\">\n");
      out.write("        <style>\n");
      out.write("            .zoom {\n");
      out.write("                padding: 50px;\n");
      out.write("                background-color: palegreen;\n");
      out.write("                transition: transform .2s; \n");
      out.write("                width: 300px;\n");
      out.write("                height: 200px;\n");
      out.write("                margin: 0 auto;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .zoom:hover {\n");
      out.write("                transform: scale(1.5); \n");
      out.write("            }\n");
      out.write("            .btn {\n");
      out.write("                background-color: null ;\n");
      out.write("                border: none;\n");
      out.write("                color: white;\n");
      out.write("                padding: 16px 32px;\n");
      out.write("                text-align: center;\n");
      out.write("                font-size: 16px;\n");
      out.write("                margin: 4px 2px;\n");
      out.write("                opacity: 0.6;\n");
      out.write("                transition: 0.3s;\n");
      out.write("                text-decoration: none;\n");
      out.write("            }\n");
      out.write("            a{\n");
      out.write("                text-decoration: none;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .btn:hover {opacity: 1}\n");
      out.write("        </style>\n");
      out.write("        <script src=\"../Assets/JQuery/jQuery.js\"></script>\n");
      out.write("        <script>\n");
      out.write("            function getPlace(did)\n");
      out.write("            {\n");
      out.write("                $.ajax({\n");
      out.write("                    url: \"../Assets/Ajaxpages/Ajaxplace.jsp?did=\" + did,\n");
      out.write("                    success: function(html) {\n");
      out.write("                        $(\"#place\").html(html);\n");
      out.write("                    }\n");
      out.write("                });\n");
      out.write("            }\n");
      out.write("            function getLocation(did)\n");
      out.write("            {\n");
      out.write("                $.ajax({\n");
      out.write("                    url: \"../Assets/Ajaxpages/Ajaxlocation.jsp?did=\" + did,\n");
      out.write("                    success: function(html) {\n");
      out.write("                        $(\"#location\").html(html);\n");
      out.write("                    }\n");
      out.write("                });\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            function getLand()\n");
      out.write("            {\n");
      out.write("                var did = document.getElementById(\"district\").value;\n");
      out.write("                var pid = document.getElementById(\"place\").value;\n");
      out.write("                var lid = document.getElementById(\"location\").value;\n");
      out.write("                $.ajax({\n");
      out.write("                    url: \"../Assets/Ajaxpages/AjaxLandSearch.jsp?did=\" + did + \"&pid=\" + pid + \"&lid=\" + lid,\n");
      out.write("                    success: function(html) {\n");
      out.write("                        $(\"#search\").html(html);\n");
      out.write("                    }\n");
      out.write("                });\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        ");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <title>Vrindhavan</title>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css?family=Poppins:200,300,400,700,900\"> \n");
      out.write("        <link rel=\"stylesheet\" href=\"../Assets/Template/main/fonts/icomoon/style.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"../Assets/Template/main/css/bootstrap.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"../Assets/Template/main/css/magnific-popup.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"../Assets/Template/main/css/jquery-ui.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"../Assets/Template/main/css/owl.carousel.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"../Assets/Template/main/css/owl.theme.default.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelementplayer.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"../Assets/Template/main/css/aos.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"../Assets/Template/main/css/style.css\">        \n");
      out.write("        <link rel=\"stylesheet\" href=\"../Assets/Template/form.css\">\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"site-wrap\">\n");
      out.write("            <div class=\"site-mobile-menu\">\n");
      out.write("                <div class=\"site-mobile-menu-header\">\n");
      out.write("                    <div class=\"site-mobile-menu-close mt-3\">\n");
      out.write("                        <span class=\"icon-close2 js-menu-toggle\"></span>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"site-mobile-menu-body\"></div>\n");
      out.write("            </div>\n");
      out.write("            <header class=\"site-navbar py-4\" role=\"banner\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <div class=\"row align-items-center\">\n");
      out.write("                        <div class=\"col-3\">\n");
      out.write("                            <h1 class=\"site-logo\"><a href=\"index.html\" class=\"h2\">Vrindhavan<span class=\"text-primary\">.</span> </a></h1>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-9\">\n");
      out.write("                            <nav class=\"site-navigation position-relative text-right text-md-right\" role=\"navigation\">\n");
      out.write("\n");
      out.write("                                <div class=\"d-block d-lg-none ml-md-0 mr-auto\"><a href=\"#\" class=\"site-menu-toggle js-menu-toggle text-black\"><span class=\"icon-menu h3\"></span></a></div>\n");
      out.write("\n");
      out.write("                                <ul class=\"site-menu js-clone-nav d-none d-lg-block\">\n");
      out.write("                                    <li class=\"active\">\n");
      out.write("                                        <a href=\"../index.html\">Home</a>\n");
      out.write("                                    </li>\n");
      out.write("                                    <!--                                    <li class=\"has-children\">\n");
      out.write("                                                                            <a href=\"#\">Dropdown</a>\n");
      out.write("                                                                            <ul class=\"dropdown arrow-top\">\n");
      out.write("                                                                                <li><a href=\"#\">Menu One</a></li>\n");
      out.write("                                                                                <li><a href=\"#\">Menu Two</a></li>\n");
      out.write("                                                                                <li><a href=\"#\">Menu Three</a></li>\n");
      out.write("                                                                            </ul>\n");
      out.write("                                                                        </li>-->\n");
      out.write("                                    <li><a href=\"TempleRegistration.jsp\">Temple</a></li>\n");
      out.write("                                    <li><a href=\"UserRegistration.jsp\">User</a></li>\n");
      out.write("                                    <li><a href=\"Login.jsp\">Login</a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </nav>\n");
      out.write("\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </header>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            <div class=\"container pt-5 hero\">\n");
      out.write("                <div class=\"row align-items-center text-center text-md-left\" align=\"center\">\n");
      out.write("                    <div id=\"tab\" class=\"col-md-6 offset-md-3\" align=\"center\"><br><br>");
      out.write("\n");
      out.write("        <h1>Search Temple</h1>\n");
      out.write("        <div id=\"tab\">\n");
      out.write("            <form name=\"frmsearch\" method=\"post\">\n");
      out.write("                <table border=\"1\" align=\"center\" cellpadding=\"10\" style=\"border-collapse: collapse\">\n");
      out.write("                    <tr>\n");
      out.write("                        <td>District\n");
      out.write("\n");
      out.write("                            <select name=\"district\" required id=\"district\" onchange=\"getPlace(this.value)\">\n");
      out.write("                                <option value=\"\" selected>--Select--</option>\n");
      out.write("                                ");

                                    String st = "select * from tbl_district";
                                    ResultSet r = con.selectCommand(st);

                                    while (r.next()) {

                                
      out.write("\n");
      out.write("                                <option value=\"");
      out.print(r.getString("district_id"));
      out.write('"');
      out.write('>');
      out.print(r.getString("district_name"));
      out.write("</option>\n");
      out.write("                                ");

                                    }
                                
      out.write("\n");
      out.write("                            </select>    \n");
      out.write("                        </td>\n");
      out.write("\n");
      out.write("                        <td>Place\n");
      out.write("                            <select name=\"place\" id=\"place\" required onchange=\"getLocation(this.value), getLand()\">\n");
      out.write("                                <option value=\"\" selected>--Select--</option>\n");
      out.write("\n");
      out.write("                            </select>    \n");
      out.write("                        </td>\n");
      out.write("                    </tr> \n");
      out.write("\n");
      out.write("                </table>\n");
      out.write("\n");
      out.write("                <hr>\n");
      out.write("                <br>\n");
      out.write("                <div id=\"search\">\n");
      out.write("                    <table align=\"center\">\n");
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("                            ");

                                String sel = "select * from tbl_land la inner join tbl_location l on la.location_id=l.location_id inner join tbl_place p on p.place_id=l.place_id inner join tbl_district d on d.district_id=p.district_id inner join tbl_landlord lr on la.landlord_id=lr.landlord_id ";
                                ResultSet rw = con.selectCommand(sel);
                                int i = 0;
                                while (rw.next()) {
                                    i++;
                            
      out.write("\n");
      out.write("                            <td class=\"zoom\"><p style=\"text-align:center;border:1px solid #999;margin:22px;padding:10px\"><img src=\"../Assets/Land/");
      out.print(rw.getString("land_image"));
      out.write("\" width=\"100\" height=\"100\"><br>\n");
      out.write("                                    Token Amount:");
      out.print(rw.getString("land_tokenamount"));
      out.write("<br>\n");
      out.write("                                    Owner:");
      out.print(rw.getString("landlord_name"));
      out.write("<br>\n");
      out.write("                                    Contact:");
      out.print(rw.getString("landlord_contact"));
      out.write("<br>\n");
      out.write("                                    Address:");
      out.print(rw.getString("land_address"));
      out.write("<br>\n");
      out.write("                                    <br>\n");
      out.write("                                    <button class=\"btn\"> <a href=\"LandViewMore.jsp?lid=");
      out.print(rw.getString("land_id"));
      out.write("\">View More</a></button>\n");
      out.write("\n");
      out.write("                                </p></td>\n");
      out.write("                                ");

                                        if (i % 4 == 0) {
                                            out.println("</tr>");

                                            out.println("<tr>");
                                            i = 0;
                                        }
                                    }
                                
      out.write("\n");
      out.write("\n");
      out.write("                    </table>\n");
      out.write("                </div>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("    ");
      out.write("<br><br><br><br><br>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("<footer class=\"site-footer\">\n");
      out.write("    <div class=\"container\">\n");
      out.write("\n");
      out.write("        <div class=\"row pt-5 mt-5 text-center\">\n");
      out.write("            <div class=\"col-md-12\">\n");
      out.write("                <p>\n");
      out.write("                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->\n");
      out.write("                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved Vrindhavan\n");
      out.write("                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->\n");
      out.write("                </p>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</footer>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<script src=\"../Assets/Template/main/js/jquery-3.3.1.min.js\"></script>\n");
      out.write("<script src=\"../Assets/Template/main/js/jquery-migrate-3.0.1.min.js\"></script>\n");
      out.write("<script src=\"../Assets/Template/main/js/jquery-ui.js\"></script>\n");
      out.write("<script src=\"../Assets/Template/main/js/popper.min.js\"></script>\n");
      out.write("<script src=\"../Assets/Template/main/js/bootstrap.min.js\"></script>\n");
      out.write("<script src=\"../Assets/Template/main/js/owl.carousel.min.js\"></script>\n");
      out.write("<script src=\"../Assets/Template/main/js/jquery.stellar.min.js\"></script>\n");
      out.write("<script src=\"../Assets/Template/main/js/jquery.countdown.min.js\"></script>\n");
      out.write("<script src=\"../Assets/Template/main/js/jquery.magnific-popup.min.js\"></script>\n");
      out.write("<script src=\"../Assets/Template/main/js/aos.js\"></script>\n");
      out.write("\n");
      out.write("<script src=\"../Assets/Template/main/js/mediaelement-and-player.min.js\"></script>\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("                        document.addEventListener('DOMContentLoaded', function() {\n");
      out.write("                            var mediaElements = document.querySelectorAll('video, audio'), total = mediaElements.length;\n");
      out.write("\n");
      out.write("                            for (var i = 0; i < total; i++) {\n");
      out.write("                                new MediaElementPlayer(mediaElements[i], {\n");
      out.write("                                    pluginPath: 'https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/',\n");
      out.write("                                    shimScriptAccess: 'always',\n");
      out.write("                                    success: function() {\n");
      out.write("                                        var target = document.body.querySelectorAll('.player'), targetTotal = target.length;\n");
      out.write("                                        for (var j = 0; j < targetTotal; j++) {\n");
      out.write("                                            target[j].style.visibility = 'visible';\n");
      out.write("                                        }\n");
      out.write("                                    }\n");
      out.write("                                });\n");
      out.write("                            }\n");
      out.write("                        });\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("\n");
      out.write("<script src=\"../Assets/Template/main/js/main.js\"></script>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>");
      out.write("\n");
      out.write("</html>");
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
