<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-blur"></div>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">Login or Create Account</h4>
                </div>
                <div class="modal-body">
                    <div class="login-wrapper">
                        <div class="white-block">
                            <!--signin-->
                                <div class="login-block login-block-signin">
                                    <div class="h4">Sign in <a href="javascript:void(0);" class="btn btn-main btn-xs btn-register pull-right">create an account</a></div>
                                    <hr />
                                    <form id="loginForm" action="loginServlet" method="post" onsubmit="return submitLoginForm();">
                                        <!-- Form fields -->
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <input type="text" id="loginUserId" name="loginUserId" class="form-control" placeholder="User ID" required>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <input type="password" id="loginPassword" name="loginPassword" class="form-control" placeholder="Password" required>
                                                </div>
                                            </div>
                                            <div class="col-xs-6">
                                                <span class="checkbox">
                                                    <input type="checkbox" id="checkBoxId3">
                                                    <label for="checkBoxId3">Remember me</label>
                                                </span>
                                            </div>
                                            <div class="col-xs-6 text-right">
                                                <button type="submit" class="btn btn-main">Login</button>
                                            </div>
                                            <div class="col-md-12">
                                                <!-- Display login error messages here -->
                                                <div id="loginErrorContainer" style="color: red; display: none;"></div>
                                            </div>
                                        </div>
                                    </form>
                                </div> <!--/signin-->
                            <!--signup-->
                            <div class="login-block login-block-signup">
                                <div class="h4">Register now <a href="javascript:void(0);" class="btn btn-main btn-xs btn-login pull-right">Log in</a></div>
                                <hr />
                                <form id="signupForm" action="createaccount" method="post" onsubmit="return submitSignupForm();">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <input type="text" id="firstName" name="first_name" class="form-control" placeholder="First name: *" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <input type="text" id="lastName" name="last_name" class="form-control" placeholder="Last name: *" required>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <input type="email" id="email" name="email" class="form-control" placeholder="Email: *" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <input type="password" id="password" name="password" class="form-control" placeholder="Password: *" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <input type="password" id="retypePassword" name="retypePassword" class="form-control" placeholder="Retype Password: *" required>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <hr />
                                            <span class="checkbox">
                                                <input type="checkbox" id="checkBoxId1" name="acceptTerms">
                                                <label for="checkBoxId1">I have read and accepted the <a href="#">terms</a>, as well as read and understood our terms of <a href="#">business conditions</a></label>
                                            </span>
                                            <span class="checkbox">
                                                <input type="checkbox" id="checkBoxId2" name="subscribeNewsletter">
                                                <label for="checkBoxId2">Subscribe to exciting newsletters and great tips</label>
                                            </span>
                                            <hr />
                                            <div id="termsError"></div>
                                        </div>
                                        <div class="col-md-12">
                                            <input type="submit" class="btn btn-main btn-block" value="Create account">
                                        </div>
                                    </div>
                                </form>
                            </div> <!--/signup-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function submitLoginForm() {
            // Remove previous error messages
            $("#loginErrorContainer").html("").hide();

            // Get the user ID and password from the form
            var userId = $("#loginUserId").val();
            var password = $("#loginPassword").val();

            // Check if Remember Me is selected
            var rememberMe = $("#checkBoxId3").is(":checked");
            // Perform an asynchronous request to your server for authentication
            $.ajax({
                type: "POST",
                url: "loginServlet",
                data: { loginUserId: userId, loginPassword: password, rememberMe: rememberMe },
                success: function (response) {
                    if (response.trim() === "success") {
                        // Authentication succeeded, redirect or perform other actions
                        location.reload();
                    } else {
                        // Authentication failed, show error message
                        $("#loginErrorContainer").html("Invalid credentials").show();
                    }
                },
                error: function () {
                    // Handle AJAX error, show a generic error message
                    $("#loginErrorContainer").html("An error occurred during login").show();
                }
            });

            // Prevent the form from submitting immediately
            return false;
        }

        function submitSignupForm() {
            // Remove previous error messages
            $(".error-message").remove();

            // Add form validation logic
            var isValid = true;

            // Validate email format
            var emailInput = $("#email");
            if (!isValidEmail(emailInput.val())) {
                emailInput.after('<div class="error-message" style="color: red;">Please enter a valid email address.</div>');
                isValid = false;
            }

            // Validate strong password format
            var passwordInput = $("#password");
            if (!isValidPassword(passwordInput.val())) {
                passwordInput.after('<div class="error-message" style="color: red;">Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, one number, and one special character.</div>');
                isValid = false;
            }

            // Validate password match
            var retypePasswordInput = $("#retypePassword");
            if (passwordInput.val() !== retypePasswordInput.val()) {
                retypePasswordInput.after('<div class="error-message" style="color: red;">Passwords do not match.</div>');
                isValid = false;
            }

            // Validate that terms are accepted
            var acceptTermsInput = $("#checkBoxId1");
            if (!acceptTermsInput.is(":checked")) {
                $("#termsError").html('<div class="error-message" style="color: red;">You must accept the terms and conditions to create an account.</div>');
                isValid = false;
            }

            // Display a general error message if the form is not valid
            if (!isValid) {
                return false;
            }

            // Perform an asynchronous request to your server for registration
            $.ajax({
                type: "POST",
                url: "createaccount",  // Adjust the URL as needed
                data: $("#signupForm").serialize(),
                success: function (response) {
                    if (response.trim() === "success") {
                        // Show alert on successful registration
                        swal("Registration Successful", "You can now login!", "success");

                        // Optionally, clear the form fields
                        $("#firstName, #lastName, #email, #password, #retypePassword, #checkBoxId1, #checkBoxId2").val("");

                        // Optionally, close the modal
                        $("#loginModal").modal("hide");
                    } else {
                        // Registration failed, show error message
                        $("#termsError").html('<div class="error-message" style="color: red;">Failed to create an account. Please try again.</div>');
                    }
                },
                error: function () {
                    // Handle AJAX error, show a generic error message
                    $("#termsError").html('<div class="error-message" style="color: red;">An error occurred during registration. Please try again.</div>');
                }
            });

            // Prevent the form from submitting immediately
            return false;
        }


        function isValidEmail(email) {
            // Add your email validation logic here
            // For simplicity, we'll use a basic check
            return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
        }

        function isValidPassword(password) {
            // Add your strong password validation logic here
            // For simplicity, we'll check if it meets the specified criteria
            var strongPasswordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
            return strongPasswordRegex.test(password);
        }
    </script>

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/sweetalert/dist/sweetalert.css">



</body>
</html>
