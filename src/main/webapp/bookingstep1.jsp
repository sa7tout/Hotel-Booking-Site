﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- Mobile Web-app fullscreen -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="mobile-web-app-capable" content="yes">

    <!-- Meta tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">

    <!--Title-->
    <title>Reservation | VAGO - Hotel, Resort & Accommodation Website Template</title>

    <!--CSS styles-->
    <link rel="stylesheet" media="all" href="assets/css/bootstrap.css" />
    <link rel="stylesheet" media="all" href="assets/css/animate.css" />
    <link rel="stylesheet" media="all" href="assets/css/font-awesome.css" />
    <link rel="stylesheet" media="all" href="assets/css/linear-icons.css" />
    <link rel="stylesheet" media="all" href="assets/css/hotel-icons.css" />
    <link rel="stylesheet" media="all" href="assets/css/magnific-popup.css" />
    <link rel="stylesheet" media="all" href="assets/css/owl.carousel.css" />
    <link rel="stylesheet" media="all" href="assets/css/datepicker.css" />
    <link rel="stylesheet" media="all" href="assets/css/theme.css" />

    <!--Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,500&amp;subset=latin-ext" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700&amp;subset=latin-ext" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

    <div class="page-loader"></div>

    <div class="wrapper">

        <header>

            <!-- ======================== Navigation ======================== -->

            <div class="container">

                <!-- === navigation-top === -->

                <nav class="navigation-top clearfix">

                    <!-- navigation-top-left -->

                    <div class="navigation-top-left">
                        <a class="box" href="#">
                            <i class="fa fa-facebook"></i>
                        </a>
                        <a class="box" href="#">
                            <i class="fa fa-twitter"></i>
                        </a>
                        <a class="box" href="#">
                            <i class="fa fa-youtube"></i>
                        </a>
                    </div>

                </nav>

                <!-- === navigation-main === -->

                <nav class="navigation-main clearfix">

                    <!-- logo -->

                    <div class="logo animated fadeIn">
                        <a href="index.jsp">
                            <img class="logo-desktop" src="assets/images/vagologo.png" alt="Alternate Text" />
                        </a>
                    </div>

                    <!-- toggle-menu -->

                    <div class="toggle-menu"><i class="icon icon-menu"></i></div>

                    <!-- navigation-block -->

                    <div class="navigation-block clearfix">

                        <!-- navigation-left -->

                        <ul class="navigation-left">
                            <li>
                                <a href="index.jsp">Home</a>
                            </li>

                            <li>
                                <a href="bookingstep1.jsp">Booking</a>
                            </li>

                            <li>
                                <a href="about.jsp">About us</a>

                            </li>
                        </ul>

                        <!-- navigation-right -->

                        <ul class="navigation-right">
                            <li>
                                <a href="contact.jsp">Contact</a>
                            </li>
                        </ul>

                    </div> <!--/navigation-block-->

                </nav>
            </div> <!--/container-->

        </header>

        <!-- ========================  Checkout ======================== -->

        <section class="page">

            <!-- ===  Page header === -->

            <div class="page-header" style="background-image:url(assets/images/header-1.jpg)">
                <div class="container">
                    <h2 class="title">Make a reservation</h2>
                    <p>Proceed to booking step 2</p>
                </div>
            </div>

            <!-- ===  Checkout steps === -->

            <div class="step-wrapper">
                <div class="container">
                    <div class="stepper">
                        <ul class="row">
                            <li class="col-md-4 active">
                                <a href="bookingstep1.jsp"><span data-text="Room & rates"></span></a>
                            </li>
                            <li class="col-md-4">
                                <a href="bookingstep2.jsp"><span data-text="Reservation"></span></a>
                            </li>
                            <li class="col-md-4">
                                <a href="bookingstep3.jsp"><span data-text="Checkout"></span></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- ===  Checkout === -->

            <div class="checkout">

                <div class="container">

                    <div class="clearfix">

                        <!-- ========================  Cart wrapper ======================== -->

                        <div class="cart-wrapper">

                            <!--cart header -->

                            <div class="cart-block cart-block-header clearfix">
                                <div>
                                    <span>Room type</span>
                                </div>
                                <div class="text-right">
                                    <span>Price</span>
                                </div>
                            </div>

                            <!--cart items-->

                            <div class="clearfix">

                                <div class="cart-block cart-block-item clearfix">
                                    <div class="image">
                                        <a href="room-overview.html"><img src="assets/images/room-4.jpg" alt="" /></a>
                                    </div>
                                    <div class="title">
                                        <div class="h2"><a href="room-overview.html">Luxury appartment</a></div>
                                        <p>
                                            <strong>Arrival date</strong> <br /> <a href="#">(September 22, 2017)</a>
                                        </p>
                                        <p>
                                            <strong>Guests</strong> <br />  2 Adults, 1 Child
                                        </p>
                                        <p>
                                            <strong>Nights</strong> <br /> 7
                                        </p>
                                    </div>
                                    <div class="price">
                                        <span class="final h3">$ 1.998</span>
                                        <span class="discount">$ 2.666</span>
                                    </div>
                                    <!--delete-this-item-->
                                    <span class="icon icon-cross icon-delete"></span>
                                </div>

                            </div>

                            <!--cart prices -->

                            <div class="clearfix">
                                <div class="cart-block cart-block-footer clearfix">
                                    <div>
                                        <strong>Discount 15%</strong>
                                    </div>
                                    <div>
                                        <span>$ 159,00</span>
                                    </div>
                                </div>

                                <div class="cart-block cart-block-footer clearfix">
                                    <div>
                                        <strong>TAX</strong>
                                    </div>
                                    <div>
                                        <span>$ 59,00</span>
                                    </div>
                                </div>
                            </div>

                            <!--cart final price -->

                            <div class="clearfix">
                                <div class="cart-block cart-block-footer cart-block-footer-price clearfix">
                                    <div>
                                        <span class="checkbox">
                                            <input type="checkbox" id="couponCodeID">
                                            <label for="couponCodeID">Promo code</label>
                                            <input type="text" class="form-control form-coupon" value="" placeholder="Enter your coupon code" />
                                        </span>
                                    </div>
                                    <div>
                                        <div class="h2 title">$ 1259,00</div>
                                    </div>
                                </div>
                            </div>

                            <!-- ========================  Cart navigation ======================== -->

                            <div class="clearfix">
                                <div class="cart-block cart-block-footer cart-block-footer-price clearfix">
                                    <div>
                                        <a href="#" class="btn btn-clean-dark">Change</a>
                                    </div>
                                    <div>
                                        <a href="bookingstep2.jsp" class="btn btn-main">Reservation <span class="icon icon-chevron-right"></span></a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div> <!--/container-->
            </div> <!--/checkout-->

        </section>



        <!-- ========================  Subscribe ======================== -->

        <section class="subscribe">
            <div class="container">
                <div class="box">
                    <h2 class="title">Subscribe</h2>
                    <div class="text">
                        <p>& receive free premium gifts</p>
                    </div>
                    <div class="form-group">
                        <input type="text" value="" placeholder="Subscribe" class="form-control" />
                        <button class="btn btn-sm btn-main">Go</button>
                    </div>
                </div>
            </div>
        </section> 

        <!-- ================== Footer  ================== -->

        <footer>
            <div class="container">

                <!--footer social-->

                <div class="footer-social">
                    <div class="row">
                        <div class="col-sm-12 text-center hidden">
                            <a href="" class="footer-logo"><img src="assets/images/vagologo.png" alt="Alternate Text" /></a>
                        </div>
                        <div class="col-sm-12 icons">
                            <ul>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#"><i class="fa fa-youtube"></i></a></li>
                                <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                            </ul>
                        </div>
                        <div class="col-sm-12 copyright">
                            <small>VAGO HOTEL. Copyright &copy; 2023 &nbsp;</small>
                        </div>
                        <div class="col-sm-12 text-center">
                            <img src="assets/images/vagologo-footer.png" alt="" />
                        </div>
                    </div>
                </div>
            </div>
        </footer>

    </div> <!--/wrapper-->

    <!--JS files-->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery-ui.js"></script>
    <script src="assets/js/jquery.bootstrap.js"></script>
    <script src="assets/js/jquery.magnific-popup.js"></script>
    <script src="assets/js/jquery.owl.carousel.js"></script>
    <script src="assets/js/main.js"></script>
</body>

</html>