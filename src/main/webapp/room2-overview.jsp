﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,javax.servlet.http.*" %>
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
    <title>Room overview | VAGO - Hotel, Resort & Accommodation Website Template</title>

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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


        <![endif]-->
    </head>

<body>

    <div class="page-loader"></div>

    <div class="wrapper">

        <%@ include file="header.jsp" %>

        <!-- ========================  Room ======================== -->

        <section class="page">

            <!-- ===  Page header === -->

            <div class="page-header" style="background-image:url(assets/images/header-1.jpg)">
                <div class="container">
                    <h2 class="title">Deluxe Room</h2>
                    <p>Available from 150,00$ per night</p>
                </div>
            </div>

            <div class="room">

                <!-- === Room gallery === -->

                <div class="room-gallery">
                    <div class="container">
                        <div class="owl-slider owl-theme owl-slider-gallery">

                            <!-- === slide item === -->

                            <div class="item" style="background-image:url(assets/images/vagoroom-2.jpg)">
                                <img src="assets/images/vagoroom-2.jpg" alt="" />
                            </div>

                        </div> <!--/owl-slider-->

                    </div>
                </div> <!--/room-gallery-->
                <!-- === Booking === -->

                <div class="booking booking-inner">

                    <div class="container">

                        <div class="booking-wrapper">
                            <div class="row">

                                <!--=== date arrival ===-->

                                <div class="col-xs-4 col-sm-3">
                                    <div class="date" id="dateArrival" data-text="Arrival">
                                        <input class="datepicker" readonly="readonly" />
                                        <div class="date-value"></div>
                                    </div>
                                </div>

                                <!--=== date departure ===-->

                                <div class="col-xs-4 col-sm-3">
                                    <div class="date" id="dateDeparture" data-text="Departure">
                                        <input class="datepicker" readonly="readonly" />
                                        <div class="date-value"></div>
                                    </div>
                                </div>

                                <!--=== guests ===-->

                                <div class="col-xs-4 col-sm-2">

                                    <div class="guests" data-text="Guests">
                                        <div class="result">
                                            <input class="qty-result" type="text" value="2" id="qty-result" readonly="readonly" />
                                            <div class="qty-result-text date-value" id="qty-result-text"></div>
                                        </div>
                                        <!--=== guests list ===-->
                                        <ul class="guest-list">

                                            <li class="header">
                                                Please choose number of guests <span class="qty-apply"><i class="icon icon-cross"></i></span>
                                            </li>

                                            <!--=== adults ===-->

                                            <li class="clearfix">

                                                <!--=== Adults value ===-->

                                                <div>
                                                    <input class="qty-amount" value="2" type="text" id="ticket-adult" data-value="2" readonly="readonly" />
                                                </div>

                                                <div>
                                                    <span>Adults <small>16+ years</small></span>
                                                </div>

                                                <!--=== Add/remove quantity buttons ===-->

                                                <div>
                                                    <input class="qty-btn qty-minus" value="-" type="button" data-field="ticket-adult" />
                                                    <input class="qty-btn qty-plus" value="+" type="button" data-field="ticket-adult" />
                                                </div>

                                            </li>

                                            <!--=== chilrens ===-->

                                            <li class="clearfix">

                                                <!--=== Adults value ===-->

                                                <div>
                                                    <input class="qty-amount" value="0" type="text" id="ticket-children" data-value="0" readonly="readonly" />
                                                </div>

                                                <!--=== Label ===-->

                                                <div>
                                                    <span>Children <small>2-11 years</small></span>
                                                </div>


                                                <!--=== Add/remove quantity buttons ===-->

                                                <div>
                                                    <input class="qty-btn qty-minus" value="-" type="button" data-field="ticket-children" />
                                                    <input class="qty-btn qty-plus" value="+" type="button" data-field="ticket-children" />
                                                </div>

                                            </li>

                                            <!--=== Infants ===-->

                                            <li class="clearfix">

                                                <!--=== Adults value ===-->

                                                <div>
                                                    <input class="qty-amount" value="0" type="text" id="ticket-infants" data-value="0" readonly="readonly" />
                                                </div>

                                                <!--=== Label ===-->

                                                <div>
                                                    <span>Infants <small>Under 2 years</small></span>
                                                </div>

                                                <!--=== Add/remove quantity buttons ===-->

                                                <div>
                                                    <input class="qty-btn qty-minus" value="-" type="button" data-field="ticket-infants" />
                                                    <input class="qty-btn qty-plus" value="+" type="button" data-field="ticket-infants" />
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <!--=== button ===-->

                                <div class="col-xs-12 col-sm-4">
                                    <a href="bookingstep1.jsp" class="btn btn-clean">
                                        Book now
                                        <small>Best Prices Guaranteed</small>
                                    </a>
                                </div>

                            </div> <!--/row-->
                        </div><!--/booking-wrapper-->
                    </div> <!--/container-->
                </div> <!--/booking-->
                <!-- ===  Room overview === -->

                <div class="room-overview">

                    <div class="container">
                        <div class="row">

                            <div class="col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">

                                <!-- === Room aminities === -->

                                <div class="room-block room-aminities">

                                    <h2 class="title">Room aminities</h2>

                                    <div class="row">

                                        <!--=== item ===-->

                                        <div class="col-xs-6 col-sm-2">
                                            <figure>
                                                <figcaption>
                                                    <span class="hotelicon hotelicon-air-condition"></span>
                                                    <p>Aircondition</p>
                                                </figcaption>
                                            </figure>
                                        </div>

                                        <!--=== item ===-->

                                        <div class="col-xs-6 col-sm-2">
                                            <figure>
                                                <figcaption>
                                                    <span class="hotelicon hotelicon-king-bed"></span>
                                                    <p>1 Kingsize bed</p>
                                                </figcaption>
                                            </figure>
                                        </div>

                                        <!--=== item ===-->

                                        <div class="col-xs-6 col-sm-2">
                                            <figure>
                                                <figcaption>
                                                    <span class="hotelicon hotelicon-guest"></span>
                                                    <p>3 People</p>
                                                </figcaption>
                                            </figure>
                                        </div>

                                        <!--=== item ===-->

                                        <div class="col-xs-6 col-sm-2">
                                            <figure>
                                                <figcaption>
                                                    <span class="hotelicon hotelicon-wifi"></span>
                                                    <p>Internet</p>
                                                </figcaption>
                                            </figure>
                                        </div>

                                        <!--=== item ===-->

                                        <div class="col-xs-6 col-sm-2">
                                            <figure>
                                                <figcaption>
                                                    <span class="hotelicon hotelicon-washer"></span>
                                                    <p>Washer</p>
                                                </figcaption>
                                            </figure>
                                        </div>

                                        <!--=== item ===-->

                                        <div class="col-xs-6 col-sm-2">
                                            <figure>
                                                <figcaption>
                                                    <span class="hotelicon hotelicon-roomservice"></span>
                                                    <p>Room service</p>
                                                </figcaption>
                                            </figure>
                                        </div>
                                    </div>

                                </div>

                                <!-- === Room block === -->

                                <div class="room-block">
                                    <h2 class="title">Room overview</h2>
                                    <p>
                                        The Superior Rooms pay tribute to fashion and craftsmanship. The rooms are approximately 19m2 with views of Rue d'Alger and Jardin des Tuileries.
                                        The selection and pairing of materials has been carefully chosen to give you a cool experience. The super soft bed topper is simply extravagant!
                                        Every room is different but the colour palette uses unique and expertly matched hues.
                                        An openwork brass screen separates the bathroom from the bedroom. This original feature helps make every room your very own cosy and peaceful haven.
                                        Bathrobes, slippers and SOTHYS toiletries are provided in the bathroom to pamper you.
                                    </p>
                                </div>

                                <!-- === Room block === -->

                                <div class="room-block">

                                    <h2 class="title">House rules</h2>

                                    <!-- === box === -->

                                    <div class="box">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <p><strong>Check-In</strong></p>
                                            </div>
                                            <div class="col-md-8">
                                                <p>14:00 - 22:00</p>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- === box === -->

                                    <div class="box">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <p><strong>Check-out</strong></p>
                                            </div>
                                            <div class="col-md-8">
                                                <p>14:00 - 22:00</p>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- === box === -->

                                    <div class="box">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <p><strong>Luggage storage</strong></p>
                                            </div>
                                            <div class="col-md-8">
                                                <p>14:00 - 22:00</p>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- === box === -->

                                    <div class="box">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <p><strong>Cancellation/prepayment</strong></p>
                                            </div>
                                            <div class="col-md-8">
                                                <p>
                                                    Cancellation and prepayment policies vary according to room type. Please enter the dates of your stay and check the conditions of your required room.
                                                </p>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- === box === -->

                                    <div class="box">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <p><strong>Children and extra beds</strong></p>
                                            </div>
                                            <div class="col-md-8">
                                                <p>All children are welcome.</p>
                                                <p>One child under 6 years is charged EUR 50 per night when using existing beds.</p>
                                                <p>There is no capacity for extra beds in the room.</p>
                                                <p>Supplements are not calculated automatically in the total costs and will have to be paid for separately during your stay.                                        </p>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- === box === -->

                                    <div class="box">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <p><strong>Pets</strong></p>
                                            </div>
                                            <div class="col-md-8">
                                                <p>Pets are not allowed.</p>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- === box === -->

                                    <div class="box">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <p><strong>Additional info</strong></p>
                                            </div>
                                            <div class="col-md-8">
                                                <p>Please note that the restaurant is closed each Sunday.</p>
                                                <p>The restaurant will also be closed during Christmas (25-26 December).</p>
                                                <p>Please note that parking spaces cannot be reserved or guaranteed.</p>
                                                <p>
                                                    For a group booking more than 5 rooms up to 4 weeks prior to arrival cancellation is
                                                    100% free of charge, within 2 until 4 weeks 50% free of charge, and within 2 weeks the
                                                    property will charge you in full. Please note that Ozo hotel always charges city tax
                                                    prior to your arrival with the non-refundable rate or group booking.
                                                </p>
                                                <p>
                                                    Please note that the credit card that is used for the booking needs to be present at check-in.
                                                    When this credit card is not available please bring a photocopy of the credit card with
                                                    authorization of the owner.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div> <!--/col-sm-10-->
                        </div> <!--/row-->
                    </div> <!--/container-->
                </div> <!--/room-overview-->
            </div>

        </section>

        <!-- ========================  Stretcher widget ======================== -->

        <section class="stretcher-wrapper">

            <!-- === stretcher header === -->

            <div class="section-header">
                <div class="container">
                    <h2 class="title">Resort facilities</h2>
                    <p>
                        With the best luxury spa, salon and fitness experiences
                    </p>
                </div>
            </div>

            <!-- === stretcher === -->

            <ul class="stretcher">

                <!-- === stretcher item === -->

                <li class="stretcher-item" style="background-image:url(assets/images/vagoservice-1.jpg);">
                    <!--logo-item-->
                    <div class="stretcher-logo">
                        <div class="text">
                            <span class="text-intro h4">Spa center</span>
                        </div>
                    </div>
                    <!--main text-->
                    <figure>
                        <h4>Spa center</h4>
                        <figcaption>Unparalleled devotion to luxury</figcaption>
                    </figure>
                    <!--anchor-->
                    <a>Anchor link</a>
                </li>

                <!-- === stretcher item === -->

                <li class="stretcher-item" style="background-image:url(assets/images/vagoservice-2.jpg);">
                    <!--logo-item-->
                    <div class="stretcher-logo">
                        <div class="text">
                            <span class="text-intro h4">Gym</span>
                        </div>
                    </div>
                    <!--main text-->
                    <figure>
                        <h4>Gym</h4>
                        <figcaption>Care about results</figcaption>
                    </figure>
                    <!--anchor-->
                    <a>Anchor link</a>
                </li>

                <!-- === stretcher item === -->

                <li class="stretcher-item" style="background-image:url(assets/images/vagoservice-3.jpg);">
                    <!--logo-item-->
                    <div class="stretcher-logo">
                        <div class="text">
                            <span class="text-intro h4">Fitness</span>
                        </div>
                    </div>
                    <figure>
                        <h4>Fitness</h4>
                        <figcaption>Your daily activities</figcaption>
                    </figure>
                    <!--anchor-->
                    <a>Anchor link</a>
                </li>

                <!-- === stretcher item === -->

                <li class="stretcher-item" style="background-image:url(assets/images/vagoservice-4.jpg);">


                    <!--logo-item-->
                    <div class="stretcher-logo">
                        <div class="text">
                            <span class="text-intro h4">Beauty salon</span>
                        </div>
                    </div>
                    <!--main text-->
                    <figure>
                        <h4>Beauty salon</h4>
                        <figcaption>Hair salons and spas</figcaption>
                    </figure>
                    <!--anchor-->
                    <a>Anchor link</a>
                </li>

                <!-- === stretcher item more === -->

                <li class="stretcher-item more">
                    <div class="more-icon">
                        <span data-title-show="Show more" data-title-hide="+"></span>
                    </div>
                    <a>Anchor link</a>
                </li>

            </ul>
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
        <%@ include file="loginmodal.jsp" %>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery-ui.js"></script>
        <script src="assets/js/jquery.bootstrap.js"></script>
        <script src="assets/js/jquery.magnific-popup.js"></script>
        <script src="assets/js/jquery.owl.carousel.js"></script>
        <script src="assets/js/main.js"></script>
    </body>

</html>