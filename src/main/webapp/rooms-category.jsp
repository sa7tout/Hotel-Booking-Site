<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,javax.servlet.http.*" %>

<%

    String checkInDate = (String) session.getAttribute("checkInDate");
    String checkOutDate = (String) session.getAttribute("checkOutDate");
    String numGuests = (String) session.getAttribute("numGuests");

%>
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
<title>Room category | VAGO - Hotel, Resort & Accommodation Website Template</title>

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

        <!-- ========================  Rooms ======================== -->

        <section class="page">

            <!-- ========================  Page header ======================== -->

            <div class="page-header" style="background-image:url(assets/images/header-1.jpg)">
                <div class="container">
                    <h2 class="title">Rooms & Suites</h2>
                    <p>At home while on the road. </p>
                </div>
            </div>

            <!-- === rooms content === -->

            <div class="rooms rooms-category">
                <div class="container">

                    <div class="row">

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
                                                <a href="RoomController?roomType=StandardBookingRoom" class="btn btn-main">Book now</a>
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
                                                <a href="RoomController?roomType=DeluxeBookingRoom" class="btn btn-main">Book now</a>
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
                                            <a href="RoomController?roomType=SuiteBookingRoom" class="btn btn-main">Book now</a>
                                        </div>
                                        <div>
                                            <span class="price h4">$ 200,00</span>
                                            <span>per night</span>
                                        </div>
                                    </div>
                                </div>
                            </article>
                        </div>

                    </div>

                </div> <!--/container-->
            </div>
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