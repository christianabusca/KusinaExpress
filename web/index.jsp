<%-- Document : index Created on : Apr 4, 2023, 6:16:37 AM Author : Christian --%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- NOTES! 
        
        Institute of Technology
        Diploma in Computer Engineering Technology 1-1
        Web Technology and Programming 2
        
        Group Members:
        Abusca, Christian Drey S.
        Buhisan, Arianne Mae A.
        Dueñas, James M.
        
        Phase 1 Objectives -----
        Homepage ✔
        Login and Registration Form ✔
        
        -----
        
        Exercise 2 Objectives -----
        Validation of Registration Form ✔
        
        -----
        
        Exercise 3 Objectives -----
        Servlets ✔
        
        Exercise 4 Objectives -----
        DAOS and Models ✔
        
        -->

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Kusina Express</title>

        <!-- bootstrap 5.3.0-alpha3 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <!-- icons-->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <!-- local files -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css.map">
        <script src="${pageContext.request.contextPath}/js/jquery-3.6.4.min.js"></script>  
        <script src="${pageContext.request.contextPath}/js/js.js"></script>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
    <!-- icons -->
    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/img/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/img/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/img/favicon_io/favicon-16x16.png">
    <link rel="manifest" href="${pageContext.request.contextPath}/favicon_io/site.webmanifest">

    <script>
        $(document).ready(function () {
            $("#mainname").focusout(function () {
                check_mainname();
            });

            $("#mainpass").focusout(function () {
                check_mainpass();
            });

            $("#mainname_error").hide();
            $("#mainpass_error").hide();

            var error_mainname = false;
            var error_mainpass = false;

            var collage = "<c:out value='${collage}' />"

            function check_mainname() {
                var mainname = $("#mainname").val();
                if (mainname !== '') {
                    $("#mainname_error").hide();
                    $("#mainname").css("border", "2px solid #34F458");
                } else {
                    $("#mainname_error").html("User Name cannot be Blank");
                    $("#mainname_error").show();
                    $("#mainname").css("border", "2px solid #F90A0A");
                    error_mainname = true;
                }
            }

            function check_mainpass() {
                var mainpass = $("#mainpass").val();
                if (mainpass !== '') {
                    $("#mainpass_error").hide();
                    $("#mainpass").css("border", "2px solid #34F458");
                } else {
                    $("#mainpass_error").html("Password cannot be Blank");
                    $("#mainpass_error").show();
                    $("#mainpass").css("border", "2px solid #F90A0A");
                    error_mainpass = true;
                }
            }

            $("#loginss").submit(function () {
                error_mainname = false;
                error_mainpass = false;


                check_mainname();
                check_mainpass();
                if (error_mainname === false && error_mainpass === false) {
                    return true;
                } else {
                    alert("Please fill the form correctly");
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
            </li>
        </ul>
    </div>
    <section class="home-section" id="section-1" style="
             background-image: url(${pageContext.request.contextPath}/img/newbg.jpg); background-size: cover;  background-position: center;">
        <div class="home-content">
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content" style="background-image: url(${pageContext.request.contextPath}/img/wood.jpg); background-size: cover;  background-position: center;">
                        <div class="modal-header">
                            <i class='bx bxs-check-circle text-success fs-6'></i>
                            <h1 class="modal-title fs-5 ps-3" id="exampleModalLabel">Registration Success!</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body text-center">
                            <c:out value="${registration.userName}" /> has been added.
                        </div>
                        <div class="modal-footer" >
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content" style="background-image: url(${pageContext.request.contextPath}/img/wood.jpg); background-size: cover;  background-position: center;">
                        <div class="modal-header">
                            <i class='bx bxs-x-circle text-danger fs-6'></i>
                            <h1 class="modal-title fs-5 ps-3" id="exampleModalLabel">Login Failed!</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body text-center">
                            <c:out value="${collage}"/>
                        </div>
                        <div class="modal-footer" >
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <i class='bx bx-menu'></i>
            <form action="#" method="get" class="d-flex custom-form search-form flex-fill me-3" role="search">
                <div class="input-group input-group-lg">
                    <input name="query" type="search" class="form-control" id="search"
                           placeholder="Search for Filipino Cuisine" aria-label="Search">
                    <button type="submit" class="btn btn-outline-secondary" id="submit">
                        <i class="bi bi-search"></i>
                    </button>
                </div>
            </form>
            <a class="logo-details-head" href="#">
                <i class='bx bxs-heart'></i>
            </a>
            <a class="logo-details-head" href="#">
                <i class='bx bxs-bell'></i>
            </a>
            <a class="logo-details-head" href="#">
                <i class='bx bxs-cart'></i>
            </a>
            <a class="login-btn" href="#" id="button">Login</a>
            <div class="popup">
                <div class="popup-content">
                    <div class="wrapper text-black" style="background-image: url(${pageContext.request.contextPath}/img/wood.jpg);">
                        <a class="close-button" alt="close"><i class="bi bi-x-circle-fill"></i></a>
                        <img src="${pageContext.request.contextPath}/img/plogo1.png" class="logos-imahe">
                        <div class="title-text">
                            <div class="title login">
                                Login Form
                            </div>
                            <div class="title signup">
                                Signup Form
                            </div>
                        </div>
                        <div class="form-container">
                            <div class="slide-controls">
                                <input type="radio" name="slide" id="login" checked>
                                <input type="radio" name="slide" id="signup">
                                <label for="login" class="slide login">Login </label>
                                <label for="signup" class="slide signup">Signup</label>
                                <div class="slider-tab"></div>
                            </div>
                            <div class="form-inner">
                                <form method="POST" action="${pageContext.request.contextPath}/main/home" class="login" id="loginss">
                                    <div class="field">

                                        <input name="mainname" type="text" placeholder="Username" id="mainname" required  >
                                        <span class="error_form" id="mainname_error"></span>
                                    </div>
                                    <div class="field">
                                        <input name="mainpass" type="password" placeholder="Password" id="mainpass" <c:if test="${'true' == readonly}">readonly</c:if> required>
                                            <span class="error_form" id="mainpass_error"></span>
                                        </div>

                                        <div class="field btn">
                                            <div class="btn-layer"></div>
                                            <button type="submit">Login</button>
                                        </div>
                                        <div class="pass-link">
                                            <a href="${pageContext.request.contextPath}/main/forgotPass">Forgot Password</a>
                                    </div>
                                    <div class="signup-link">
                                        Not a member? <a href="#">Signup now</a>
                                    </div>
                                </form>
                                <form method="POST" action="${pageContext.request.contextPath}/Home/guest" class="signup" id="form">
                                    <div class="fields">
                                        <div class="field">
                                            <input type="text" placeholder="Preferred Username" name="userName" id="usern"
                                                   value="<c:out value="${registration.userName}" />" required>
                                            <span class="error_form" id="usern_error_message"></span>
                                        </div>
                                        <div class="field">
                                            <input type="password" placeholder="Password" name="password" id="pass"
                                                   value="<c:out value='${registration.password}'/>" required>

                                            <span class="error_form" id="password_error_message"></span>
                                        </div>
                                        <div class="field">
                                            <input type="password" placeholder="Confirm Password" name="confirmPassword" id="confirmPass"
                                                   value="<c:out value='${registration.confirmPassword}'/>" required>

                                            <span class="error_form" id="confirmPass_error_message"></span>
                                        </div>
                                        <div class="field">
                                            <input type="text" placeholder="First Name" name="firstName" id="fname" 
                                                   value="<c:out value='${registration.firstName}'/>" required>
                                            <span class="error_form" id="fname_error_message"></span>
                                        </div>
                                        <div class="field">
                                            <input type="text" placeholder="Middle Name" name="middleName" id="mname"
                                                   value="<c:out value='${registration.middleName}'/>">
                                            <span class="error_form" id="mname_error_message"></span>
                                        </div>
                                        <div class="field">
                                            <input type="text" placeholder="Last Name" name="lastName" id="lname"
                                                   value="<c:out value='${registration.lastName}'/>" required>
                                            <span class="error_form" id="lname_error_message"></span>
                                        </div>
                                        <div class="field">
                                            <input type="text" placeholder="Complete Address" name="location" id="location"
                                                   value="<c:out value='${registration.location}'/>" required>
                                            <span class="error_form" id="location_error_message"></span>
                                        </div>
                                        <div class="field">
                                            <input type="text" placeholder="Birthday" class="textbox-n"
                                                   onfocus="(this.type = 'date')" name="birthday" id="date"
                                                   value="<c:out value='${registration.birthday}'/>" required>
                                            <span class="error_form" id="date_error_message"></span>
                                        </div>
                                        <div class="field">
                                            <input type="number" placeholder="Mobile Number" name="number" id="number"
                                                   value="<c:out value='${registration.number}'/>" required>
                                            <span class="error_form" id="number_error_message"></span>
                                        </div>
                                        <div class="field btn">
                                            <div class="btn-layer"></div>
                                            <button type="submit" class="btn btn-primary" value="Signup" id="signup">
                                                Sign Up
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
        <div class="mb-2 pb-2 container position-relative">
            <div class="row py-5 gy-3 justify-content-center">
                <div class="col-sm-9 col-md-7">
                    <div class="card bg-transparent align-items-center" style="border: 1px solid transparent;" "id="card">
                        <div id="logo">
                            <img src="${pageContext.request.contextPath}/img/plogo1.png" class="card-img-top me-3" alt="...">
                        </div>
                        <div class="card-body">
                            <h1 class="card-title text-black text-center" style="font-weight: 600;">Kusina
                                Express</h1>
                            <div class="d-flex text-center">
                                <p class="text-black">From our kitchen to your table, <br>taste the deliciousness from Kusina Express!
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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