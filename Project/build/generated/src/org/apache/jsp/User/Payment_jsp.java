package org.apache.jsp.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Payment_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("{% comment %} Created By Suraj K S {% endcomment %}\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("\t<style>\n");
      out.write("\t\t*{\n");
      out.write("\t\t\tmargin: 0;\n");
      out.write("\t\t\tpadding: 0;\n");
      out.write("\t\t\tbox-sizing: border-box;\n");
      out.write("\t\t}\n");
      out.write("\t\tbody{\n");
      out.write("\t\t\tbackground-color: #f5f5f5;\n");
      out.write("\t\t\tfont-family: Arial, Helvetica, sans-serif;\n");
      out.write("\t\t}\n");
      out.write("\t\t.wrapper{\n");
      out.write("\t\t\tbackground-color: #fff;\n");
      out.write("\t\t\twidth: 500px;\n");
      out.write("\t\t\tpadding: 25px;\n");
      out.write("\t\t\tmargin: 25px auto 0;\n");
      out.write("\t\t\tbox-shadow: 0px 0px 20px rgba(0,0,0,0.5);\n");
      out.write("\t\t}\n");
      out.write("\t\t.wrapper h2{\n");
      out.write("\t\t\tbackground-color: #fcfcfc;\n");
      out.write("\t\t\tcolor: #7ed321;\n");
      out.write("\t\t\tfont-size: 24px;\n");
      out.write("\t\t\tpadding: 10px;\n");
      out.write("\t\t\tmargin-bottom: 20px;\n");
      out.write("\t\t\ttext-align: center;\n");
      out.write("\t\t\tborder: 1px dotted #333;\n");
      out.write("\t\t}\n");
      out.write("\t\th4{\n");
      out.write("\t\t\tpadding-bottom: 5px;\n");
      out.write("\t\t\tcolor: #7ed321;\n");
      out.write("\t\t}\n");
      out.write("\t\t.input-group{\n");
      out.write("\t\t\tmargin-bottom: 8px;\n");
      out.write("\t\t\twidth: 100%;\n");
      out.write("\t\t\tposition: relative;\n");
      out.write("\t\t\tdisplay: flex;\n");
      out.write("\t\t\tflex-direction: row;\n");
      out.write("\t\t\tpadding: 5px 0;\n");
      out.write("\t\t}\n");
      out.write("\t\t.input-box{\n");
      out.write("\t\t\twidth: 100%;\n");
      out.write("\t\t\tmargin-right: 12px;\n");
      out.write("\t\t\tposition: relative; \n");
      out.write("\t\t}\n");
      out.write("\t\t.input-box:last-child{\n");
      out.write("\t\t\tmargin-right: 0;\n");
      out.write("\t\t}\n");
      out.write("\t\t.name{\n");
      out.write("\t\t\tpadding: 14px 10px 14px 50px;\n");
      out.write("\t\t\twidth: 100%;\n");
      out.write("\t\t\tbackground-color: #fcfcfc;\n");
      out.write("\t\t\tborder: 1px solid #00000033;\n");
      out.write("\t\t\toutline: none;\n");
      out.write("\t\t\tletter-spacing: 1px;\n");
      out.write("\t\t\ttransition: 0.3s;\n");
      out.write("\t\t\tborder-radius: 3px;\n");
      out.write("\t\t\tcolor: #333;\n");
      out.write("\t\t}\n");
      out.write("\t\t.name:focus, .dob:focus{\n");
      out.write("\t\t\t-webkit-box-shadow:0 0 2px 1px #7ed32180;\n");
      out.write("\t\t\t-moz-box-shadow:0 0 2px 1px #7ed32180;\n");
      out.write("\t\t\tbox-shadow: 0 0 2px 1px #7ed32180;\n");
      out.write("\t\t\tborder: 1px solid #7ed321;\n");
      out.write("\t\t}\n");
      out.write("\t\t.input-box .icon{\n");
      out.write("\t\t\twidth: 48px;\n");
      out.write("\t\t\tdisplay: flex;\n");
      out.write("\t\t\tjustify-content: center;\n");
      out.write("\t\t\tposition: absolute;\n");
      out.write("\t\t\tpadding: 15px;\n");
      out.write("\t\t\ttop: 0px;\n");
      out.write("\t\t\tleft: 0px;\n");
      out.write("\t\t\tbottom: 0px;\n");
      out.write("\t\t\tcolor: #333;\n");
      out.write("\t\t\tbackground-color: #f1f1f1;\t\n");
      out.write("\t\t\tborder-radius: 2px 0 0 2px;\n");
      out.write("\t\t\ttransition: 0.3s;\n");
      out.write("\t\t\tfont-size: 20px;\n");
      out.write("\t\t\tpointer-events: none;\n");
      out.write("\t\t\tborder: 1px solid #000000033;\n");
      out.write("\t\t\tborder-right: none;\n");
      out.write("\t\t}\n");
      out.write("\t\t\n");
      out.write("\t\t\n");
      out.write("\t\t.name:focus + .icon{\n");
      out.write("\t\t\tbackground-color: #7ed321;\n");
      out.write("\t\t\tcolor: #fff;\n");
      out.write("\t\t\tborder-right: 1px solid #7ed321;\n");
      out.write("\t\t\tborder-right: none;\n");
      out.write("\t\t\ttransition: 1s;\n");
      out.write("\t\t}\n");
      out.write("\t\t.radio:checked + label {\n");
      out.write("\t\t\tbackground-color: #7ed321;\n");
      out.write("\t\t\tcolor: #fcfcfc\t;\n");
      out.write("\t\t\tborder-right: 1px solid #7ed321;\n");
      out.write("\t\t\tborder-right: none;\n");
      out.write("\t\t\ttransition: 1s;\n");
      out.write("\t\t}\n");
      out.write("\t\t.dob{\n");
      out.write("\t\t\twidth: 30%;\n");
      out.write("\t\t\tpadding: 14px;\n");
      out.write("\t\t\ttext-align: center;\n");
      out.write("\t\t\tbackground-color: #fcfcfc;\n");
      out.write("\t\t\ttransition: 0.3s;\n");
      out.write("\t\t\toutline: none;\n");
      out.write("\t\t\tborder: 1px solid #c0bfbf;\n");
      out.write("\t\t\tborder-radius: 3px;\n");
      out.write("\t\t}\n");
      out.write("\t\t.radio{\n");
      out.write("\t\t\tdisplay: none;\n");
      out.write("\t\t}\n");
      out.write("\t\t.input-box label{\n");
      out.write("\t\t\twidth: 50%;\n");
      out.write("\t\t\tpadding: 13px;\n");
      out.write("\t\t\tbackground-color: #fcfcfc;\n");
      out.write("\t\t\tdisplay: inline-block;\n");
      out.write("\t\t\tfloat: left;\n");
      out.write("\t\t\ttext-align: center;\n");
      out.write("\t\t\tborder: 1px solid #c0bfbf; \n");
      out.write("\t\t}\n");
      out.write("\t\t.input-box label:first-of-type{\n");
      out.write("\t\t\tborder-top-left-radius: 3px;\n");
      out.write("\t\t\tborder-bottom-left-radius: 3px;\n");
      out.write("\t\t\tborder-right: none;\n");
      out.write("\t\t}\n");
      out.write("\t\t.input-box label:last-of-type{\n");
      out.write("\t\t\tborder-top-left-radius: 3px;\n");
      out.write("\t\t\tborder-bottom-left-radius: 3px;\n");
      out.write("\t\t}\n");
      out.write("\t\t\n");
      out.write("\t\t.radio:checked{\n");
      out.write("\t\t\tbackground-color:green;\n");
      out.write("\t\t\tcolor: #fff;\n");
      out.write("\t\t}\n");
      out.write("\t\t\n");
      out.write("\t\tinput[type=submit]{\n");
      out.write("\t\t\twidth: 100%;\n");
      out.write("\t\t\tbackground: transparent;\n");
      out.write("\t\t\tborder: none;\n");
      out.write("\t\t\tbackground: #7ed321;\n");
      out.write("\t\t\tcolor: #fff;\n");
      out.write("\t\t\tpadding: 15px;\n");
      out.write("\t\t\tborder-radius: 4px;\n");
      out.write("\t\t\tfont-size: 16px;\n");
      out.write("\t\t\ttransition: all 0.35s ease;\n");
      out.write("\t\t}\n");
      out.write("\t\tinput[type=submit]:hover{\n");
      out.write("\t\t\tcursor: pointer;\n");
      out.write("\t\t\tbackground: #5eb105;\n");
      out.write("\t\t}\n");
      out.write("\n");
      out.write("\t</style>\n");
      out.write("\t<meta charset=\"UTF-8\">\n");
      out.write("\t<meta name=\"viewport\" content=\"width=device-width,initial-scale=1.0\">\n");
      out.write("\t<link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.4.2/css/all.css\">\n");
      out.write("\t<title>Payement Gateway</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\t<div class=\"wrapper\">\n");
      out.write("\t\t<h2>Payment Gateway</h2>\n");
      out.write("\t\t<form method=\"POST\">\n");
      out.write("\t\t\t<h4>Account</h4>\n");
      out.write("\t\t\t<div class=\"input-group\">\n");
      out.write("\t\t\t\t<div class=\"input-box\">\n");
      out.write("\t\t\t\t\t<input class=\"name\" type=\"text\" name=\"txtname\" id=\"txtname\" placeholder=\"Full Name\" required=\"required\">\n");
      out.write("\t\t\t\t\t<i class=\"fa fa-user icon\" aria-hidden=\"true\"></i>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"input-box\">\n");
      out.write("\t\t\t\t\t<input class=\"name\" type=\"text\" name=\"txtnname\" id=\"txtnname\" placeholder=\"Nick Name\" required=\"required\">\n");
      out.write("\t\t\t\t\t<i class=\"fa fa-user icon\" aria-hidden=\"true\"></i>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"input-group\">\n");
      out.write("\t\t\t\t<div class=\"input-box\">\n");
      out.write("\t\t\t\t\t<input class=\"name\" type=\"email\" name=\"txtemail\" id=\"txtemail\" placeholder=\"Email Address\" required=\"required\">\n");
      out.write("\t\t\t\t\t<i class=\"fa fa-envelope icon\" aria-hidden=\"true\"></i>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\t\n");
      out.write("\t\t\t<div class=\"input-group\">\n");
      out.write("\t\t\t\t<div class=\"input-box\">\n");
      out.write("\t\t\t\t\t<h4>Date of Birth</h4>\n");
      out.write("\t\t\t\t\t<input class=\"dob\" type=\"text\" data-mask=\"00\" name=\"txtdate\" id=\"txtdate\" placeholder=\"DD\">\n");
      out.write("\t\t\t\t\t<input class=\"dob\" type=\"text\" data-mask=\"00\" name=\"txtmonth\" id=\"txtmonth\" placeholder=\"MM\">\n");
      out.write("\t\t\t\t\t<input class=\"dob\" type=\"text\" data-mask=\"0000\" name=\"txtyear\" id=\"txtyear\" placeholder=\"YYYY\">\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"input-box\">\n");
      out.write("\t\t\t\t\t<h4>Gender</h4>\n");
      out.write("\t\t\t\t\t<input type=\"radio\" name=\"rdbgender\" id=\"male\" checked  class=\"radio\">\n");
      out.write("\t\t\t\t\t<label for=\"male\">Male</label>\n");
      out.write("\t\t\t\t\t<input type=\"radio\" name=\"rdbgender\" id=\"female\" class=\"radio\">\n");
      out.write("\t\t\t\t\t<label for=\"female\">Female</label>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"input-group\">\n");
      out.write("\t\t\t\t<div class=\"input-box\">\n");
      out.write("\t\t\t\t\t<h4>Payment Details</h4>\n");
      out.write("\t\t\t\t\t<input type=\"radio\" name=\"rdbpay\" id=\"cc\" checked class=\"radio\">\n");
      out.write("\t\t\t\t\t<label for=\"cc\">\n");
      out.write("\t\t\t\t\t\t<span><i class=\"fa fa-cc-visa\" aria-hidden=\"true\"></i>Credit Card</span>\n");
      out.write("\t\t\t\t\t</label>\n");
      out.write("\t\t\t\t\t<input type=\"radio\" name=\"rdbpay\" id=\"dc\" class=\"radio\">\n");
      out.write("\t\t\t\t\t<label for=\"dc\">\n");
      out.write("\t\t\t\t\t\t<span><i class=\"fa fa-cc-visa\" aria-hidden=\"true\"></i>Debit Card</span>\n");
      out.write("\t\t\t\t\t</label>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"input-group\">\n");
      out.write("\t\t\t\t<div class=\"input-box\">\n");
      out.write("\t\t\t\t\t<input class=\"name\" type=\"tel\" id=\"txtcardno\" name=\"txtcardno\" required=\"required\" data-mask=\"0000 0000 0000 0000\" placeholder=\"Card Number\">\n");
      out.write("\t\t\t\t\t<i class=\"fa fa-credit-card icon\" aria-hidden=\"true\"></i>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"input-group\">\n");
      out.write("\t\t\t\t<div class=\"input-box\">\n");
      out.write("\t\t\t\t\t<input class=\"name\" type=\"text\" name=\"txtcvc\" id=\"txtcvc\" data-mask=\"000\" placeholder=\"CVC\" required=\"required\">\n");
      out.write("\t\t\t\t\t<i class=\"fa fa-user icon\" aria-hidden=\"true\"></i>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"input-box\">\n");
      out.write("\t\t\t\t\t<input class=\"name\" type=\"text\" name=\"txtdate\" id=\"txtdate\" data-mask=\"00 / 00\" placeholder=\"EXP DATE\" required=\"required\">\n");
      out.write("\t\t\t\t\t<i class=\"fa fa-calendar icon\" aria-hidden=\"true\"></i>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t<div class=\"input-group\">\n");
      out.write("\t\t\t\t<div class=\"input-box\">\n");
      out.write("\t\t\t\t\t<input type=\"submit\"  value=\"PAY NOW\">\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</form>\n");
      out.write("\t</div>\n");
      out.write("</body>\n");
      out.write(" <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>\n");
      out.write("<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js'></script>\n");
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