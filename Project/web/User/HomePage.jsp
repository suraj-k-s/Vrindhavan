<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Vrindhavan</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,700,900"> 
        <link rel="stylesheet" href="../Assets/Template/main/fonts/icomoon/style.css">
        <link rel="stylesheet" href="../Assets/Template/main/css/bootstrap.min.css">
        <link rel="stylesheet" href="../Assets/Template/main/css/magnific-popup.css">
        <link rel="stylesheet" href="../Assets/Template/main/css/jquery-ui.css">
        <link rel="stylesheet" href="../Assets/Template/main/css/owl.carousel.min.css">
        <link rel="stylesheet" href="../Assets/Template/main/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelementplayer.min.css">
        <link rel="stylesheet" href="../Assets/Template/main/css/aos.css">
        <link rel="stylesheet" href="../Assets/Template/main/css/style.css">

    </head>
    <body>
        <div class="site-wrap">
            <div class="site-mobile-menu">
                <div class="site-mobile-menu-header">
                    <div class="site-mobile-menu-close mt-3">
                        <span class="icon-close2 js-menu-toggle"></span>
                    </div>
                </div>
                <div class="site-mobile-menu-body"></div>
            </div>
            <header class="site-navbar py-4" role="banner">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-3">
                            <h1 class="site-logo"><a href="HomePage.jsp" class="h2">Vrindhavan<span class="text-primary">.</span> </a></h1>
                        </div>
                        <div class="col-9">
                            <nav class="site-navigation position-relative text-right text-md-right" role="navigation">

                                <div class="d-block d-lg-none ml-md-0 mr-auto"><a href="#" class="site-menu-toggle js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>

                                <ul class="site-menu js-clone-nav d-none d-lg-block">
                                    <li class="active">
                                        <a href="HomePage.jsp">Home</a>
                                    </li>
                                    <li class="has-children">
                                        <a href="#">Profile</a>
                                        <ul class="dropdown arrow-top">
                                            <li><a href="MyProfile.jsp">My Profile</a></li>
                                            <li><a href="EditProfile.jsp">Edit Profile</a></li>
                                            <li><a href="ChangePassword.jsp">Change Password</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="SearchTemple.jsp">Temple</a></li>
                                    <li class="has-children">
                                        <a href="#">Bookings</a>
                                        <ul class="dropdown arrow-top">
                                            <li><a href="ViewPrasadamBooking.jsp">Prasadam</a></li>
                                            <li><a href="ViewQueueBooking.jsp">Queue</a></li>
                                            <li><a href="ViewVazhipadBooking.jsp">Vazhipad</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="SendComplaint.jsp">Complaint</a></li>
                                    <li><a href="SendFeedback.jsp">Feedback</a></li>
                                    <li><a href="../Guest/Login.jsp">Logout</a></li>
                                </ul>
                            </nav>


                        </div>

                    </div>
                </div>

            </header>



            <div class="container pt-5 hero">
                <div class="row align-items-center text-center text-md-left">

                    <div class="col-lg-4">
                        <h1 class="mb-3 display-3">Tell Your Story to the World</h1>
                        <p>Join with us! Login or Register. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus, ex!</p>
                    </div>
                    <div class="col-lg-8">
                        <img src="../Assets/Template/main/images/1x/asset-1.jpg" alt="Image" class="img-fluid">    
                    </div>
                </div>
            </div>



            <footer class="site-footer">
                <div class="container">

                    <div class="row pt-5 mt-5 text-center">
                        <div class="col-md-12">
                            <p>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved Vrindhavan
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </p>
                        </div>

                    </div>
                </div>
            </footer>
        </div>

        <script src="../Assets/Template/main/js/jquery-3.3.1.min.js"></script>
        <script src="../Assets/Template/main/js/jquery-migrate-3.0.1.min.js"></script>
        <script src="../Assets/Template/main/js/jquery-ui.js"></script>
        <script src="../Assets/Template/main/js/popper.min.js"></script>
        <script src="../Assets/Template/main/js/bootstrap.min.js"></script>
        <script src="../Assets/Template/main/js/owl.carousel.min.js"></script>
        <script src="../Assets/Template/main/js/jquery.stellar.min.js"></script>
        <script src="../Assets/Template/main/js/jquery.countdown.min.js"></script>
        <script src="../Assets/Template/main/js/jquery.magnific-popup.min.js"></script>
        <script src="../Assets/Template/main/js/aos.js"></script>

        <script src="../Assets/Template/main/js/mediaelement-and-player.min.js"></script>

        <script>
                                    document.addEventListener('DOMContentLoaded', function() {
                                        var mediaElements = document.querySelectorAll('video, audio'), total = mediaElements.length;

                                        for (var i = 0; i < total; i++) {
                                            new MediaElementPlayer(mediaElements[i], {
                                                pluginPath: 'https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/',
                                                shimScriptAccess: 'always',
                                                success: function() {
                                                    var target = document.body.querySelectorAll('.player'), targetTotal = target.length;
                                                    for (var j = 0; j < targetTotal; j++) {
                                                        target[j].style.visibility = 'visible';
                                                    }
                                                }
                                            });
                                        }
                                    });
        </script>


        <script src="../Assets/Template/main/js/main.js"></script>

    </body>
</html>