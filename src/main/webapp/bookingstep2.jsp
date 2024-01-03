<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.hotelweb.Booking" %>


<%
    // Retrieve the Booking object from the session
    Booking booking = (Booking) session.getAttribute("booking");

    // Check if the Booking object is not null
    if (booking == null) {
        // Handle the case where the Booking object is not found
        response.sendRedirect("404.jsp");
    }
    // Now you can use the booking object as needed in your page
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
    <title>Reservation - 2 | VAGO - Hotel, Resort & Accommodation Website Template</title>

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
    <!-- Include SweetAlert CSS and JS files -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/sweetalert2@10"/>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

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
                    <h2 class="title">Confirm your reservation</h2>
                    <p>Guest information</p>
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
                            <li class="col-md-4">
                                <a href="bookingstep3.jsp" onclick="return checkLoginAndProceed();"><span data-text="Checkout"></span></a>
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
                                        <!-- === login-wrapper === -->
                                        <% if (!(isLoggedIn != null && isLoggedIn)) { %>
                                          <!-- User is not logged in, show login and signup forms -->

                                        <div class="col-md-6">
                                                <div class="white-block">
                                                    <!--signin-->
                                                    <div class="login-block login-block-signin">
                                                        <div class="h4">Sign in <a href="javascript:void(0);" class="btn btn-main btn-xs btn-register pull-right" onclick="showLoginModal();">create an account</a></div>
                                                        <hr />
                                                        <div class="row">
                                                            <div class="col-md-12 text-center">
                                                                <p>Please login to continue.</p>
                                                            </div>
                                                            <div class="col-md-12 text-center">
                                                                <div class="col-xs-12">
                                                                    <button type="button" class="btn btn-main" onclick="showLoginModal()">Login</button>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <!-- Display login error messages here -->
                                                                    <div id="loginErrorContainer" style="color: red; display: none;"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div> <!--/signin-->
                                                </div>
                                        </div> <!--/col-md-6-->
                                        <% } %>

                                    <!-- === right content === -->

                                    <div class="col-md-6">

                                        <div class="white-block">

                                            <div class="h4">Choose payment</div>

                                            <hr />

                                            <span class="checkbox">
                                                <input type="radio" id="paymentPayPal" name="paymentOption">
                                                <label for="paymentPayPal">
                                                    <strong>PayPal</strong> <br />
                                                    <small>Purchase with your fingertips. Look for us the next time you're paying from a mobile app, and checkout faster on thousands of mobile websites.</small>
                                                </label>
                                            </span>

                                            <div class="payment payment-paypal">
                                                <p><strong>Note:</strong></p>
                                                <p>Please allow three working days for the payment confirmation to reflect in your <a href="#">online account</a>. Once your payment is confirmed, we will generate your e-invoice, which you can view/print from your account or email.</p>
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
                                    <!-- Dynamically display image based on the selected room type -->
                                        <%
                                            String imagePath = "";
                                            switch (booking.getSelectedRoomType()) {
                                                case "StandardBookingRoom":
                                                case "Standard":
                                                    imagePath = "assets/images/vagoroom-1.jpg";
                                                    break;
                                                case "DeluxeBookingRoom":
                                                case "Deluxe":
                                                    imagePath = "assets/images/vagoroom-2.jpg";
                                                    break;
                                                case "SuiteBookingRoom":
                                                case "Suite":
                                                    imagePath = "assets/images/vagoroom-3.jpg";
                                                    break;
                                                default:
                                                    imagePath = "path/to/default-room-image.jpg";
                                                    break;
                                            }
                                        %>
                                        <a href="room-overview.html"><img src="<%= imagePath %>" alt="" /></a>
                                    </div>
                                    <div class="title">
                                        <div class="h2"><a href="room-overview.html"><%= booking.getSelectedRoomType() %></a></div>
                                        <div>
                                            <strong>Arrival date</strong><br /> <a href="#">(<%= booking.getCheckInDate() %>)</a>
                                        </div>
                                        <div>
                                            <strong>Guests</strong><br /> <%= booking.getNumGuests() %>
                                        </div>
                                        <div>
                                            <strong>Nights</strong> <br /> <%= booking.getNights() %>
                                        </div>
                                    </div>
                                    <div class="price">
                                        <span class="final h3">$ <%= booking.getTotalPrice() %></span>
                                        <!-- Add discount and delete-this-item if needed -->
                                    </div>
                                    <!--delete-this-item-->
                                    <!-- Add a delete icon if needed -->
                                </div>
                            </div>

                            <!--cart prices -->
                            <div class="clearfix">
                                <div class="cart-block cart-block-footer clearfix">
                                    <div>
                                        <strong>TAX</strong>
                                    </div>
                                    <div>
                                        <span> 7% </span>
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
                                        <div class="h2 title">$ <%= booking.getTotalPriceWithTax() %></div>
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
                                        <a href="bookingstep3.jsp" class="btn btn-main" onclick="return checkLoginAndProceed();">Checkout <span class="icon icon-chevron-right"></span></a>
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

    <!-- Add the following script in the head section of your HTML -->
    <script>
        function checkLoginAndProceed() {
            // Check if the user is logged in (you need to adjust this condition based on your actual login logic)
            var isLoggedIn = <%= (isLoggedIn != null && isLoggedIn) %>;

            // If the user is not logged in, show a SweetAlert error message
            if (!isLoggedIn) {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'You must be logged in to proceed. Please login or create an account.',
                });
                return false; // Prevent the default action (redirecting to the next page)
            }

            // If the user is logged in, proceed to the checkout page
            return true;
        }
    </script>

</body>

</html>