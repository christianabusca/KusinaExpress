<%-- 
    Document   : product
    Created on : May 15, 2023, 4:27:38 PM
    Author     : Christian
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Forgot Password</title>

        <!-- bootstrap 5.3.0-alpha3 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0-alpha3/css/bootstrap.min.css">

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <!-- icons-->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <!-- local files -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/updateuser.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css.map">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dataTables.bootstrap5.min.css">
        <script src="${pageContext.request.contextPath}/js/jquery-3.6.4.min.js"></script>  
        <script src="${pageContext.request.contextPath}/js/dataTables.bootstrap5.min.js"></script>  
        <script src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script> 
        <script src="${pageContext.request.contextPath}/js/forgotPass.js"></script>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.7.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- icons -->
    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/img/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/img/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/img/favicon_io/favicon-16x16.png">
    <link rel="manifest" href="favicon_io/site.webmanifest">
    <script>
        $(document).ready(function () {
            var message = "<c:out value='${message}'/>";
            if (message.trim().length > 0) {
                $(".alert").fadeIn();
                setTimeout(function () {
                    $(".alert").fadeOut();
                }, 5000);
            }
            $("#usern_error_message").hide();
            $("#oldpassword_error_message").hide();
            $("#newpassword_error_message").hide();
            $("#confirmPass_error_message").hide();

            var error_usern = false;
            var error_oldpass = false;
            var error_newpass = false;
            var error_confirmpass = false;


            $("#usern").focusout(function () {
                check_usern();
            });
            $("#oldpass").focusout(function () {
                check_oldpass();
            });
            $("#newpass").focusout(function () {
                check_newpass();
            });
            $("#confirmPass").focusout(function () {
                check_confirmPass();
            });


            function check_usern() {
                var pattern = /^[a-zA-Z0-9]{5}$/;
                var usern = $("#usern").val();
                if (pattern.test(usern) && usern !== '') {
                    $("#usern_error_message").hide();
                    $("#usern").css("border", "2px solid #34F458");
                } else if (usern.length !== 5) {
                    $("#usern_error_message").html("It should consist of 5 characters");
                    $("#usern_error_message").show();
                    $("#usern").css("border", "2px solid #F90A0A");
                    error_usern = true;
                } else {
                    $("#usern_error_message").html("Username invalid");
                    $("#usern_error_message").show();
                    $("#usern").css("border", "2px solid #F90A0A");
                    error_usern = true;
                }
            }

            function check_oldpass() {
                var pattern = /^[a-zA-Z0-9!@#$%^&*()+=._-]{8,16}$/;
                var pass = $("#oldpass").val().trim();
                if (pattern.test(pass) && pass !== '') {
                    $("#oldpassword_error_message").hide();
                    $("#oldpass").css("border", "2px solid #34F458");
                } else if (/\s/.test(pass) && pass.length >= 8) {
                    $("#oldpassword_error_message").html("Password should not contain spaces");
                    $("#oldpassword_error_message").show();
                    $("#oldpass").css("border", "2px solid #F90A0A");
                    error_oldpass = true;
                } else if (!/[A-Z]/.test(pass)) {
                    $("#oldpassword_error_message").html("1 capital letter is required in Password");
                    $("#oldpassword_error_message").show();
                    $("#oldpass").css("border", "2px solid #F90A0A");
                    error_oldpass = true;
                } else if (!/[a-z]/.test(pass)) {
                    $("#oldpassword_error_message").html(" 1 small letter is required in Password");
                    $("#oldpassword_error_message").show();
                    $("#oldpass").css("border", "2px solid #F90A0A");
                    error_oldpass = true;
                } else if (!/\d/.test(pass)) {
                    $("#oldpassword_error_message").html("1 number is required in Password");
                    $("#oldpassword_error_message").show();
                    $("#oldpass").css("border", "2px solid #F90A0A");
                    error_oldpass = true;
                } else if (!/[!@#$%^&*()+=._-]/.test(pass)) {
                    $("#oldpassword_error_message").html("1 special character is required in Password");
                    $("#oldpassword_error_message").show();
                    $("#oldpass").css("border", "2px solid #F90A0A");
                    error_oldpass = true;
                } else if (pass.length > 16) {
                    $("#oldpassword_error_message").html("Password must be no more than 16 characters");
                    $("#oldpassword_error_message").show();
                    $("#oldpass").css("border", "2px solid #F90A0A");
                    error_oldpass = true;
                } else {
                    $("#oldpassword_error_message").html("Password must be atleast 8 characters");
                    $("#oldpassword_error_message").show();
                    $("#oldpass").css("border", "2px solid #F90A0A");
                    error_oldpass = true;
                }
            }
            function check_newpass() {
                var pattern = /^[a-zA-Z0-9!@#$%^&*()+=._-]{8,16}$/;
                var pass = $("#newpass").val().trim();
                var pass2 = $("#oldpass").val();

                if (pattern.test(pass) && pass !== pass2) {
                    $("#newpassword_error_message").hide();
                    $("#newpass").css("border", "2px solid #34F458");
                } else if (/\s/.test(pass) && pass.length >= 8) {
                    $("#newpassword_error_message").html("Password should not contain spaces");
                    $("#newpassword_error_message").show();
                    $("#newpass").css("border", "2px solid #F90A0A");
                    error_newpass = true;
                } else if (pass2 === pass) {
                    $("#newpassword_error_message").html("New password must be different from the old password.");
                    $("#newpassword_error_message").show();
                    $("#newpass").css("border", "2px solid #F90A0A");
                    error_newpass = true;
                } else if (!/[A-Z]/.test(pass)) {
                    $("#newpassword_error_message").html("1 capital letter is required in Password");
                    $("#newpassword_error_message").show();
                    $("#newpass").css("border", "2px solid #F90A0A");
                    error_newpass = true;
                } else if (!/[a-z]/.test(pass)) {
                    $("#newpassword_error_message").html("1 small letter is required in Password");
                    $("#newpassword_error_message").show();
                    $("#newpass").css("border", "2px solid #F90A0A");
                    error_newpass = true;
                } else if (!/\d/.test(pass)) {
                    $("#newpassword_error_message").html("1 number is required in Password");
                    $("#newpassword_error_message").show();
                    $("#newpass").css("border", "2px solid #F90A0A");
                    error_newpass = true;
                } else if (!/[!@#$%^&*()+=._-]/.test(pass)) {
                    $("#newpassword_error_message").html("1 special character is required in Password");
                    $("#newpassword_error_message").show();
                    $("#newpass").css("border", "2px solid #F90A0A");
                    error_newpass = true;
                } else if (pass.length > 16) {
                    $("#newpassword_error_message").html("Password must be no more than 16 characters");
                    $("#newpassword_error_message").show();
                    $("#newpass").css("border", "2px solid #F90A0A");
                    error_newpass = true;
                } else {
                    $("#newpassword_error_message").html("Password must be at least 8 characters");
                    $("#newpassword_error_message").show();
                    $("#newpass").css("border", "2px solid #F90A0A");
                    error_newpass = true;
                }
            }

            function check_confirmPass() {
                var pass = $("#newpass").val();
                var confirmPass = $("#confirmPass").val();
                if (pass === confirmPass && confirmPass !== '') {
                    $("#confirmPass_error_message").hide();
                    $("#confirmPass").css("border", "2px solid #34F458");
                } else {
                    $("#confirmPass_error_message").html("Passwords do not match");
                    $("#confirmPass_error_message").show();
                    $("#confirmPass").css("border", "2px solid #F90A0A");
                    error_confirmpass = true;
                }
            }


            $("#form").submit(function () {
                error_usern = false;
                error_oldpass = false;
                error_newpass = false;
                error_confirmpass = false;

                check_usern();
                check_oldpass();
                check_newpass();
                check_confirmPass();

                if (error_usern === false && error_oldpass === false && error_newpass === false && error_confirmpass === false) {

                    return true;
                } else {
                    alert("Please Fill the form Correctly");
                    return false;
                }


            });

        });
    </script>

</head>
<body>
    <div class="sidebar close">
        <div class="logo-details">
            <i class='bx bxs-bowl-hot'></i>
            <span class="logo_name">Kusina Express</span>
        </div>
        <hr class="text-white d-none d-sm-block" />
        <ul class="nav-links">
            <li>
                <a href="${pageContext.request.contextPath}">
                    <i class='bx bxs-home-smile'></i>
                    <span class="link_name" name="home">Home</span>
                </a>
                <ul class="sub-menu blank">
                    <li><a class="link_name" href="${pageContext.request.contextPath}">Home</a></li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class='bx bxs-info-circle'></i>
                    <span class="link_name">About</span>
                </a>
                <ul class="sub-menu blank">
                    <li><a class="link_name" href="#">About</a></li>
                </ul>
            </li>
            <li>
            <li>
                <div class="iocn-link">
                    <a href="#menu">
                        <i class='bx bxs-dish'></i>
                        <span class="link_name">Menu</span>
                    </a>
                    <i class='bx bxs-chevron-down arrow'></i>
                </div>
                <ul class="sub-menu">
                    <li><a class="link_name" href="#menu">Menu</a></li>
                    <li><a href="#">Breads</a></li>
                    <li><a href="#">Meals</a></li>
                    <li><a href="#">Stick Foods</a></li>
                    <li><a href="#">Desserts</a></li>
                    <li><a href="#">Drinks</a></li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class='bx bxs-heart'></i>
                    <span class="link_name">Favourites</span>
                </a>
                <ul class="sub-menu blank">
                    <li><a class="link_name" href="#">Favourites</a></li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class='bx bxs-cart'></i>
                    <span class="link_name">Orders</span>
                </a>
                <ul class="sub-menu blank">
                    <li><a class="link_name" href="#">Orders</a></li>
                </ul>
            </li>
            <li>
                <div class="iocn-link">
                    <a href="#">
                        <i class='bx bxs-cog'></i>
                        <span class="link_name">Settings</span>
                    </a>
                    <i class='bx bxs-chevron-down arrow'></i>
                </div>
                <ul class="sub-menu">
                    <li><a class="link_name" href="#">Settings</a></li>
                    <li><a href="#">Profile</a></li>
                    <li><a href="#">Terms and Conditions</a></li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class='bx bxs-help-circle'></i>

                    <span class="link_name">Contact</span>
                </a>
                <ul class="sub-menu blank">
                    <li><a class="link_name" href="#">Contact</a></li>
                </ul>
            </li>
            <li>
                <div class="profile-details">
                    <div class="profile-content">
                        <i class='bx bx-user-circle'></i>
                    </div>

                    <div class="profile-details">
                        <div class="profile-content">
                            <i class='bx bx-user-circle'></i>
                        </div>

                        <div class="name-job">
                            <a href="#" class="profile_name" id="button1">Login</a>
                        </div>
                        <a href="#" id="button2">
                            <i class='bx bx-log-in'></i>
                        </a>
                    </div>
                </div>
            </li>
        </ul>
    </div>
    <div class="home-section" id="section-1" style="
         background-image: url(${pageContext.request.contextPath}/img/woodss.png); background-size: cover;  background-position: center;">
        <div class="home-content">
            <i class='bx bx-menu'></i>
        </div>
        <div>
            <div class="text-center mb-2 pb-2">
                <div id="logo" class="pb-3">
                    <div class="container">
                        <img src="${pageContext.request.contextPath}/img/pass.png" class="card-img-top me-3 img-fluid" alt="..." style="max-width: 200px;">
                    </div>
                </div>
                <div>
                    <h1 class="text-black fw-bold">Forgot Password</h1>
                </div>
            </div>
        </div>  
        <div class="container d-flex flex-column min-vh-100">
            <div class="row">
                <div class="col text-center">
                    <div class="d-flex justify-content-center">
                        <div class="wrapper text-black" style="background-image: url(${pageContext.request.contextPath}/img/wood.jpg);">
                            <div class="form-container">
                                <div class="form-inner">
                                    <div class="alert simple-alert" style="display:none;">
                                        <h3><c:out value="${message}" /></h3>
                                    </div>
                                    <form method="POST" action="${pageContext.request.contextPath}/main/forgotten" class="signup" id="form" onsubmit="return formValidation()>
                                        <div class="fields">
                                            <div class="field">
                                                <input type="text" placeholder="Existing User ID" name="userName" id="usern"
                                                       value="<c:out value="${registration.userName}" />" required>
                                                <span class="error_form" id="usern_error_message"></span>
                                            </div>
                                            <div class="field">
                                                <input type="password" placeholder="Old Password" name="oldPassword" id="oldpass"
                                                       value="<c:out value='${registration.password}'/>" required>

                                                <span class="error_form" id="oldpassword_error_message"></span>
                                            </div>
                                            <div class="field">
                                                <input type="password" placeholder="New Password" name="newPassword" id="newpass"
                                                       value="<c:out value='${registration.password}'/>" required>

                                                <span class="error_form" id="newpassword_error_message"></span>
                                            </div>
                                            <div class="field">
                                                <input type="password" placeholder="Confirm Password" name="confirmPassword" id="confirmPass"
                                                       value="<c:out value='${registration.confirmPassword}'/>" required>

                                                <span class="error_form" id="confirmPass_error_message"></span>
                                            </div>
                                            <div class="field btn">
                                                <div class="btn-layer"></div>
                                                <button name="edituser" type="submit" class="btn btn-primary" value="Signup" id="signup">
                                                    Change Password
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
        </div>

    </div>
    <section class="home-section" style="
             background-image: url(${pageContext.request.contextPath}/img/woodss.png); background-size: cover;  background-position: center;">
    </section>
</body>
<footer class="footer-section">
    <div class="bottom-details">
        <div class="bottom_text">
            <span class="copyright_text">Copyright © 2023 <a href="#">KusinaExpress.</a>All rights reserved</span>
            <span class="policy_terms">
                <a href="#">Privacy policy</a>
                <a href="#">Terms & condition</a>
            </span>
        </div>
    </div>
</footer>
</html>
