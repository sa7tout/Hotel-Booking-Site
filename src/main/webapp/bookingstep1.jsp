<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.concurrent.TimeUnit" %>

<%
    // Retrieve the selected room type from the session
    String selectedRoomType = (String) session.getAttribute("selectedRoomType");
    String checkInDate = (String) session.getAttribute("checkInDate");
    String checkOutDate = (String) session.getAttribute("checkOutDate");
    String numGuests = (String) session.getAttribute("numGuests");

    // Check if the room type is not null
    if (selectedRoomType == null || checkInDate == null || checkOutDate == null || numGuests == null) {
        // Redirect to 404.jsp if the selected room type is null
        response.sendRedirect("404.jsp");
        return;
    }

    // Function to calculate the number of nights
    long nights = 0;
    try {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = sdf.parse(checkInDate);
        Date endDate = sdf.parse(checkOutDate);
        nights = TimeUnit.DAYS.convert(endDate.getTime() - startDate.getTime(), TimeUnit.MILLISECONDS);
    } catch (Exception e) {
        e.printStackTrace();
    }

    // Set the price per night based on the room type
    double pricePerNight = 0;
    switch (selectedRoomType) {
        case "StandardBookingRoom":
        case "Standard":
            pricePerNight = 100;
            break;
        case "DeluxeBookingRoom":
        case "Deluxe":
            pricePerNight = 150;
            break;
        case "SuiteBookingRoom":
        case "Suite":
            pricePerNight = 200;
            break;
        // Add more cases for other room types if needed
        default:
            pricePerNight = 0; // Default price
            break;
    }

    // Calculate the total price based on the number of guests and nights
    double totalPrice = pricePerNight * Integer.parseInt(numGuests) * nights;
    double totalPriceWithTax = totalPrice*1.07;

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


    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- SweetAlert2 CSS and JS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>

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

                            <!--cart items-->
                            <div class="clearfix">

                                <div class="cart-block cart-block-item clearfix">
                                    <div class="image">
                                        <!-- Dynamically display image based on the selected room type -->
                                        <%
                                            String imagePath = "";
                                            switch (selectedRoomType) {
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
                                        <a href="<%= imagePath %>"><img src="<%= imagePath %>" alt="" /></a>
                                    </div>
                                    <div class="title">
                                        <div class="h2"><a href="room-overview.html"><%= selectedRoomType %></a></div>
                                        <p>
                                            <strong>Arrival date</strong> <br /> <a href="#">(<%= checkInDate %>)</a>
                                        </p>
                                        <p>
                                            <strong>Guests</strong> <br /> <%= numGuests %> Guests
                                        </p>
                                        <p>
                                            <strong>Nights</strong> <br /> <%= nights %>
                                        </p>
                                    </div>
                                    <div class="price">
                                        <!-- Display dynamically calculated total price -->
                                        <span class="final h3"><%= totalPrice %>$</span>
                                    </div>
                                    <!--delete-this-item-->
                                    <span class="icon icon-cross icon-delete"></span>
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
                                        <span class="checkbox">
                                            <input type="checkbox" id="couponCodeID">
                                            <label for="couponCodeID">Promo code</label>
                                            <input type="text" class="form-control form-coupon" value="" placeholder="Enter your coupon code" />
                                        </span>
                                    </div>
                                    <div>
                                        <div class="h2 title"><%= totalPriceWithTax %>$</div>
                                    </div>
                                </div>
                            </div>

                            <!-- ========================  Cart navigation ======================== -->
                            <div class="clearfix">
                                <div class="cart-block cart-block-footer cart-block-footer-price clearfix">
                                    <div>
                                    <%
                                        String roomoverviewlink = "";
                                        switch (selectedRoomType) {
                                            case "StandardBookingRoom":
                                            case "Standard":
                                                roomoverviewlink = "room1-overview.jsp";
                                                break;
                                            case "DeluxeBookingRoom":
                                            case "Deluxe":
                                                roomoverviewlink = "room2-overview.jsp";
                                                break;
                                            case "SuiteBookingRoom":
                                            case "Suite":
                                                roomoverviewlink = "room3-overview.jsp";
                                                break;
                                            default:
                                                roomoverviewlink = "path/to/default-room-link.jsp";
                                                break;
                                        }
                                    %>
                                        <a href="<%=roomoverviewlink%>" class="btn btn-clean-dark">Change</a>
                                    </div>
                                    <div>
                                        <button class="btn btn-main" id="reservationButton">Reservation <span class="icon icon-chevron-right"></span></button>
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <script>
        $(document).ready(function () {
            $("#reservationButton").on("click", function () {
                // Make an AJAX call to the ReservationServlet
                $.ajax({
                    type: "POST",
                    url: "ReservationServlet",
                    data: {
                        selectedRoomType: "<%= selectedRoomType %>",
                        checkInDate: "<%= checkInDate %>",
                        checkOutDate: "<%= checkOutDate %>",
                        numGuests: "<%= numGuests %>"
                    },
                    success: function (data) {
                        console.log("AJAX call successful. Response data:", data);
                        if (data === "success") {
                            window.location.href = "bookingstep2.jsp";
                        } else if (data === "noAvailableRoom") {
                            // Display a SweetAlert to inform the user about no available room
                            Swal.fire({
                                icon: 'error',
                                title: 'Oops...',
                                text: 'No available room for the selected dates. Please choose different dates.',
                            });
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("AJAX error: " + status + " - " + error);
                    }
                });
            });
        });
    </script>

</body>

</html>