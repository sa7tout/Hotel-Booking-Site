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
    <title>Reservation - 3 | VAGO - Hotel, Resort & Accommodation Website Template</title>

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

        <%@ include file="header.jsp" %>

        <!-- ========================  Checkout ======================== -->

        <section class="page">

            <!-- ===  Page header === -->

            <div class="page-header" style="background-image:url(assets/images/header-1.jpg)">

                <div class="container">
                    <h2 class="title">Reservation completed</h2>
                    <p>Thank you!</p>
                </div>

            </div>

            <!-- ===  Step wrapper === -->

            <div class="step-wrapper">
                <div class="container">

                    <div class="stepper">
                        <ul class="row">
                            <li class="col-md-4 active">
                                <a href="bookingstep1.jsp"><span data-text="Room & rates"></span></a>
                            </li>
                            <li class="col-md-4 active">
                                <a href="bookingstep2.jsp"><span data-text="Reservation"></span></a>
                            </li>
                            <li class="col-md-4 active">
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

                        <!-- ========================  Note block ======================== -->

                        <div class="cart-wrapper">

                            <div class="note-block">

                                <div class="row">
                                    <!-- === left content === -->

                                    <div class="col-md-6">

                                        <div class="white-block">

                                            <div class="h4">Guest information</div>

                                            <hr />

                                            <div class="row">

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <strong>Name</strong> <br />
                                                        <span>John Doe</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <strong>Email</strong><br />
                                                        <span>johndoe@company.com</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <strong>Phone</strong><br />
                                                        <span>+122 523 352</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <strong>Zip</strong><br />
                                                        <span>94107</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <strong>City</strong><br />
                                                        <span>San Francisco, California</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <strong>Address</strong><br />
                                                        <span>795 Folsom Ave, Suite 600</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <strong>Company name</strong><br />
                                                        <span>Your company name</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <strong>Company phone</strong><br />
                                                        <span>+122 333 6665</span>
                                                    </div>
                                                </div>

                                            </div>

                                        </div> <!--/col-md-6-->

                                    </div>

                                    <!-- === right content === -->

                                    <div class="col-md-6">
                                        <div class="white-block">

                                            <div class="h4">Reservation details</div>

                                            <hr />

                                            <div class="row">

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <strong>Order no.</strong> <br />
                                                        <span>52522-63259226</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <strong>Transaction ID</strong> <br />
                                                        <span>2265996</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <strong>Order date</strong> <br />
                                                        <span>06/30/2017</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <strong>Shipping arrival</strong> <br />
                                                        <span>07/30/2017</span>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="h4">Payment details</div>

                                            <hr />

                                            <div class="row">

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <strong>Transaction time</strong> <br />
                                                        <span>06/30/2017 at 00:59</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <strong>Amount</strong><br />
                                                        <span>$ 1259,00</span>
                                                    </div>
                                                </div>



                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <strong>Cart details</strong><br />
                                                        <span>**** **** **** 5446</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <strong>Reservation type</strong><br />
                                                        <span>Luxury Room</span>
                                                    </div>
                                                </div>

                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


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
                                        <div>
                                            <strong>Arrival date</strong> <a href="#">(September 22, 2017)</a>
                                        </div>
                                        <div>
                                            <strong>Guests</strong> 2 Adults, 1 Child
                                        </div>
                                        <div>
                                            <strong>Nights</strong> 7
                                        </div>
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
                                        Promo code included!
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
                                        <a href="bookingstep1.jsp" class="btn btn-clean-dark">Back</a>
                                    </div>
                                    <div>
                                        <a onclick="window.print()" class="btn btn-main">Print <span class="icon icon-printer"></span></a>
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

        <%@ include file="footer.jsp" %>

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