<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,javax.servlet.http.*" %>
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

            <!-- navigation-top-right -->
            <div class="navigation-top-right">
                <div class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
                        <i class="fa fa-user"></i>
                        <span class="user-label">
                            <% Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
                            if (isLoggedIn != null && isLoggedIn) { %>
                                Logged In
                            <% } else { %>
                                Not Logged In
                            <% } %>
                        </span>
                    </button>
                    <ul class="dropdown-menu">
                        <%
                        if (isLoggedIn != null && isLoggedIn) {
                        %>
                        <!-- Show only if logged in -->
                        <li><a href="#">Profile</a></li>
                        <li><a href="#">Bookings</a></li>
                        <li><a href="guestController?action=logout">Logout</a></li>
                        <% } else { %>
                        <!-- Show only if not logged in -->
                        <li>
                            <!-- Include the login modal content directly here -->
                            <button class="btn btn-link btn-block text-white" onclick="showLoginModal();">Login</button>
                        </li>
                        <% } %>
                    </ul>
                </div>
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
                        <a href="about.jsp">About us</a>
                    </li>
                    <li>
                        <a href="contact.jsp">Contact</a>
                    </li>
                </ul>

            </div> <!--/navigation-block-->

        </nav>
    </div> <!--/container-->
<%@ include file="loginmodal.jsp" %>
</header>
