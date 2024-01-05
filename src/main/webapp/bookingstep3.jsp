<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.hotelweb.Booking" %>
<%@ page import="com.hotelweb.Reservation" %>
<%@ page import="com.hotelweb.Guest" %>


<%
    Guest guest = (Guest) session.getAttribute("guest");
    Reservation lastreservation = (Reservation) session.getAttribute("reservation");
    Booking booking = (Booking) session.getAttribute("booking");

    // Retrieve the isLoggedIn attribute from the session
    Boolean LoggedIn = (Boolean) session.getAttribute("isLoggedIn");

    // Check if the Booking object is not null and the user is logged in
    if (LoggedIn == null || lastreservation == null || booking == null || guest == null) {
        // Handle the case where the Booking object is not found or the user is not logged in
        response.sendRedirect("404.jsp");
        return;
    } else {
        // Set the userId attribute of the Booking object if the user is logged in
        String userId = (String) session.getAttribute("userId");
        if (userId != null) {
            booking.setUserId(userId);
        }
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
                                                        <strong>First Name</strong> <br />
                                                        <span><%=guest.getFirstName()%></span>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <strong>Last Name</strong> <br />
                                                        <span><%=guest.getLastName()%></span>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <strong>Email</strong><br />
                                                        <span><%=guest.getEmail()%></span>
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
                                                        <strong>Reservation no.</strong> <br />
                                                        <span><%=lastreservation.getReferenceNumber()%></span>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <strong>Order date</strong> <br />
                                                        <span id="transactiondate"></span>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="h4">Payment details</div>

                                            <hr />

                                            <div class="row">

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <strong>Transaction time</strong> <br />
                                                        <span id="transactiontime"></span>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <strong>Amount</strong><br />
                                                        <span>$ <%=booking.getTotalPrice()%></span>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <strong>Paypal</strong><br />
                                                        <span>guest.paypal@email.com</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <strong>Reservation type</strong><br />
                                                        <span><%= booking.getSelectedRoomType() %></span>
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
                                        <a href="rooms-category.jsp"><img src="<%= imagePath %>" alt="" /></a>
                                    </div>
                                    <div class="title">
                                        <div class="h2"><a href="room-overview.html"><%= booking.getSelectedRoomType() %></a></div>
                                        <div>
                                            <strong>Arrival date</strong><br /> <a href="#">(<%= lastreservation.getCheckinDate() %>)</a>
                                        </div>
                                        <div>
                                            <strong>Guests</strong><br /> <%= lastreservation.getNumberOfGuests() %>
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
                                        <a href="bookingstep2.jsp" class="btn btn-clean-dark">Back</a>
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

    <script>
            // Function to format the date
            function formatDate(date, includeTime = false) {
                const options = {
                    year: 'numeric',
                    month: '2-digit',
                    day: '2-digit',
                    hour: 'numeric',
                    minute: 'numeric'
                };

                const formattedDate = new Intl.DateTimeFormat('en-US', options).format(date);

                return includeTime ? formattedDate : formattedDate.split(' ')[0]; // Return only date without time
            }

            // Get the current local date
            const currentDate = new Date();

            // Display the formatted date with time in the specified span
            document.getElementById('transactiontime').innerText = formatDate(currentDate, true);

            // Display the formatted date in the specified span
            document.getElementById('transactiondate').innerText = formatDate(currentDate);
        </script>
</body>

</html>