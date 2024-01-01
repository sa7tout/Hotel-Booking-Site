<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>VAGO - Hotel, Resort & Accommodation Website Template</title>

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

        <!-- ========================  Header content ======================== -->

        <section class="frontpage-slider">
            <div class="owl-slider owl-slider-header owl-slider-fullscreen">

                <!-- === slide item === -->

                <div class="item" style="background-image:url(assets/images/vagoslide3.jpg)">
                    <div class="box text-center">
                        <div class="container">
                            <div class="rating animated" data-animation="fadeInDown">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <h2 class="title animated h1" data-animation="fadeInDown">
                                A moment of <br /> <span>pure prestige</span>
                            </h2>
                            <div class="desc animated" data-animation="fadeInUp">
                                Lavish social and business events
                            </div>
                            <div class="desc animated" data-animation="fadeInUp">
                                and unforgettable weddings.
                            </div>
                            <div class="animated" data-animation="fadeInUp">
                                <a href="#" class="btn btn-clean">BOOK NOW</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- === slide item === -->

                <div class="item" style="background-image:url(assets/images/vagoslide1.jpg)">
                    <div class="box text-center">
                        <div class="container">
                            <h2 class="title animated h1" data-animation="fadeInDown">
                                The privacy and <br />
                                individuality of a custom
                            </h2>
                            <div class="desc animated" data-animation="fadeInUp">
                                The Residences have their own dedicated private entrance as well <br />
                                as an anonymous "celebrity" entrance, for ultimate privacy.
                            </div>
                        </div>
                    </div>
                </div>

                <!-- === slide item === -->

                <div class="item" style="background-image:url(assets/images/vagoslide2.jpg)">
                    <div class="box text-center">
                        <div class="container">
                            <div class="rating animated" data-animation="fadeInDown">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <h2 class="title animated h1" data-animation="fadeInDown">Fairmont managed!</h2>
                            <div class="desc animated" data-animation="fadeInUp">The elegant Champagne Bar, the stylish Colina Club.</div>
                            <div class="desc animated" data-animation="fadeInUp">Guestrooms and luxurious suites</div>
                        </div>
                    </div>
                </div>

            </div> <!--/owl-slider-->
        </section>

        <!-- ======================== Booking ======================== -->

        <section class="booking booking-inner">

            <div class="section-header hidden">
                <div class="container">
                    <h2 class="title">Booking & reservations</h2>
                </div>
            </div>

            <div class="booking-wrapper">

                <div class="container">
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
                            <a href="reservation-1.jsp" class="btn btn-clean">
                                Book now
                                <small>Best Prices Guaranteed</small>
                            </a>
                        </div>

                    </div> <!--/row-->
                </div><!--/booking-wrapper-->
            </div> <!--/container-->
        </section>

        <!-- ========================  Rooms ======================== -->

        <section class="rooms rooms-widget">

            <!-- === rooms header === -->

            <div class="section-header">
                <div class="container">
                    <h2 class="title">Rooms accommodation <a href="rooms-category.jsp" class="btn btn-sm btn-clean-dark">View all</a></h2>
                    <p>Designed as a privileged almost private place where you'll feel right at home</p>
                </div>
            </div>

            <!-- === rooms content === -->

            <div class="container">

                <div class="owl-rooms owl-theme">

                    <!-- === rooms item === -->

                    <div class="item">
                        <article>
                            <div class="image">
                                <img src="assets/images/vagoroom-1.jpg" alt="" />
                            </div>
                            <div class="details">
                                <div class="text">
                                    <h3 class="title"><a href="room-overview.jsp">Standard Room</a></h3>
                                    <p>Single room, Essential.</p>
                                </div>
                                <div class="book">
                                    <div>
                                        <a href="room-overview.jsp" class="btn btn-main">Book now</a>
                                    </div>
                                    <div>
                                        <span class="price h4">$ 100,00</span>
                                        <span>per night</span>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>

                    <!-- === rooms item === -->

                    <div class="item">
                        <article>
                            <div class="image">
                                <img src="assets/images/vagoroom-2.jpg" alt="" />
                            </div>
                            <div class="details">
                                <div class="text">
                                    <h3 class="title"><a href="room-overview.jsp">Deluxe Room</a></h3>
                                    <p>Double room, Enhanced and Superior.</p>
                                </div>
                                <div class="book">
                                    <div>
                                        <a href="room-overview.jsp" class="btn btn-main">Book now</a>
                                    </div>
                                    <div>
                                        <span class="price h4">$ 150,00</span>
                                        <span>per night</span>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>

                    <!-- === rooms item === -->

                    <div class="item">
                        <article>
                            <div class="image">
                                <img src="assets/images/vagoroom-3.jpg" alt="" />
                            </div>
                            <div class="details">
                                <div class="text">
                                    <h3 class="title"><a href="">Suite Room</a></h3>
                                    <p>Queen size bed, Spacious and Exclusive.</p>
                                </div>
                                <div class="book">
                                    <div>
                                        <a href="room-overview.jsp" class="btn btn-main">Book now</a>
                                    </div>
                                    <div>
                                        <span class="price h4">$ 200,00</span>
                                        <span>per night</span>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>

                    <!-- === rooms item === -->

                </div><!--/owl-rooms-->

            </div> <!--/container-->

        </section>

        <!-- ========================  Stretcher widget ======================== -->

        <section class="stretcher-wrapper">

            <!-- === stretcher header === -->

            <div class="section-header">
                <div class="container">
                    <h2 class="title">Resort facilities <a class="btn btn-sm btn-clean-dark">Explore more</a></h2>
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

        <!-- ======================== Quotes ======================== -->

        <section class="quotes quotes-slider" style="background-image:url(assets/images/header-1.jpg)">
            <div class="container">

                <!-- === Quotes header === -->

                <div class="section-header">
                    <h2 class="title">Testimonials</h2>
                    <p>What other think about us</p>
                </div>

                <div class="row">

                    <div class="col-md-8 col-md-offset-2">
                        <div class="quote-carousel">

                            <!-- === quoute item === -->

                            <div class="quote">

                                <div class="text">
                                    <h4>HIBA ARBEL</h4>
                                    <p>Our stay at VAGO Hotel was a serene escape, surrounded by the beauty of nature and the tranquility of the island.</p>
                                </div>
                                <div class="more">
                                    <div class="rating">
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                    </div>
                                </div>
                            </div>


                            <!-- === quoute item === -->

                            <div class="quote">
                                <div class="text">
                                    <h4>YOUNESS KASSIDE</h4>
                                    <p>At VAGO, the island vibe seamlessly blends with modern comforts, offering a peaceful haven for a relaxing getaway.</p>
                                </div>
                                <div class="more">
                                    <div class="rating">
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                    </div>
                                </div>
                            </div>

                            <!-- === quoute item === -->

                            <div class="quote">
                                <div class="text">
                                    <h4>AYA ELMGHARI</h4>
                                    <p>Our stay at VAGO was an unforgettable blend of luxurious comfort, impeccable service, and breathtaking views.</p>
                                </div>
                                <div class="more">
                                    <div class="rating">
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                    </div>
                                </div>
                            </div>

                        </div> <!--/quote-carousel-->
                    </div>
                </div> <!--/row-->
            </div> <!--/container-->
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