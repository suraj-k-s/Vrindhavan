<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width initial-scale=1.0">
        <!-- GLOBAL MAINLY STYLES-->
        <link href="../Assets/Template/admin/assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="../Assets/Template/admin/assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        <link href="../Assets/Template/admin/assets/vendors/themify-icons/css/themify-icons.css" rel="stylesheet" />
        <!-- PLUGINS STYLES-->
        <link href="../Assets/Template/admin/assets/vendors/jvectormap/jquery-jvectormap-2.0.3.css" rel="stylesheet" />
        <!-- THEME STYLES-->
        <link href="../Assets/Template/admin/assets/css/main.min.css" rel="stylesheet" />
        <link href="../Assets/Template/form.css" rel="stylesheet" />
        <!-- PAGE LEVEL STYLES-->
    </head>

    <body class="fixed-navbar">
        <div class="page-wrapper">
            <!-- START HEADER-->
            <header class="header">
                <div class="page-brand">
                    <a class="link" href="index.html">
                        <span class="brand">Vrindha
                            <span class="brand-tip">van</span>
                        </span>
                        <span class="brand-mini">VV</span>
                    </a>
                </div>
                <div class="flexbox flex-1">
                    <!-- START TOP-LEFT TOOLBAR-->
                    <ul class="nav navbar-toolbar">
                        <li>
                            <a class="nav-link sidebar-toggler js-sidebar-toggler"><i class="ti-menu"></i></a>
                        </li>

                    </ul>

                </div>
            </header>
            <!-- END HEADER-->
            <!-- START SIDEBAR-->
            <nav class="page-sidebar" id="sidebar">
                <div id="sidebar-collapse">
                    <div class="admin-block d-flex">
                        <div>
                            <img src="../Assets/Template/admin/assets/img/admin-avatar.png" width="45" />
                        </div>
                        <div class="admin-info">
                            <div class="font-strong">Gouri</div><small>Administrator</small></div>
                    </div>
                    <ul class="side-menu metismenu">
                        <li>
                            <a class="active" href="HomePage.jsp"><i class="sidebar-item-icon fa fa-th-large"></i>
                                <span class="nav-label">Dashboard</span>
                            </a>
                        </li>
                        <li class="heading">FEATURES</li>
                        <li>
                            <a href="javascript:;"><i class="sidebar-item-icon fa fa-edit"></i>
                                <span class="nav-label">Basic Datas</span><i class="fa fa-angle-left arrow"></i></a>
                            <ul class="nav-2-level collapse">
                                <li>
                                    <a href="District.jsp">District</a>
                                </li>
                                <li>
                                    <a href="Place.jsp">Place</a>
                                </li>
                                <li>
                                    <a href="Nakshatram.jsp">Nakshatram</a>
                                </li>
                                <li>
                                    <a href="VazhipadType.jsp">VazhipadType</a>
                                </li>
                                <li>
                                    <a href="QueueType.jsp">Queue Type</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a class="active" href="../Guest/Login.jsp"><i class="sidebar-item-icon fa fa-th-large"></i>
                                <span class="nav-label">Logout</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <div class="content-wrapper">
                <!-- START PAGE CONTENT-->
                <div class="page-content fade-in-up" id="tab" align="center">