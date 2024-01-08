<%-- Document : index Created on : Apr 4, 2023, 6:16:37 AM Author : Christian --%>

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
        Validation of Registration Form ✔
        
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
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css.map">
        <script src="js/jquery-3.6.4.min.js"></script>  
        <script src="js/js.js"></script>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
    <!-- icons -->
    <link rel="apple-touch-icon" sizes="180x180" href="img/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="img/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="img/favicon_io/favicon-16x16.png">
    <link rel="manifest" href="favicon_io/site.webmanifest">
    
   
    

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
                <a href="${pageContext.request.contextPath}/home.jsp">
                    <i class='bx bxs-home-smile'></i>
                    <span class="link_name" name="home">Home</span>
                </a>
                <ul class="sub-menu blank">
                    <li><a name="home" class="link_name" href="${pageContext.request.contextPath}/home.jsp">Home</a></li>
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
                    <a href="${pageContext.request.contextPath}/products">
                        <i class='bx bxs-dish'></i>
                        <span class="link_name">Menu</span>
                    </a>
                    <i class='bx bxs-chevron-down arrow'></i>
                </div>
                <ul class="sub-menu">
                    <li><a class="link_name" href="${pageContext.request.contextPath}/products">Menu</a></li>
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
                    <li><a href="#">Address</a></li>
                    <li><a href="#">Privacy</a></li>
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

                        <div class="profile-content">
                            <span class="link_name">Hi! ${sessionScope.userName}</span>
                        </div>
                        <a href="${pageContext.request.contextPath}">
                            <i class='bx bx-log-out'></i>
                        </a>
                    </div>
            </li>
        </ul>
    </div>
    <section class="home-section" id="section-1" style="
             background-image: url(img/bg1.png);">
        <div class="home-content">
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
            <a class="btn btn-warning me-2" disabled>
                <span>
                    Hi! ${sessionScope.userName}
                </span>
            </a>
        </div>
        <div class="mb-2 pb-2 container position-relative">
            <div class="row py-5 gy-3 justify-content-center">
                <div class="col-sm-9 col-md-7">
                    <div class="card align-items-center" style="background-color: rgba(245, 245, 245, 0.4); border: transparent;" id="card">
                        <div id="logo">
                            <img src="img/plogo1.png" class="card-img-top me-3" alt="...">
                        </div>
                        <div class="card-body">
                            <h1 class="card-title text-black text-center" style="font-weight: 600;">Kusina
                                Express</h1>
                            <div class="d-flex text-center">
                                <p class="text-black">From our kitchen to your table, taste the deliciousness from Kusina Express!
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="home-section-2" id="section-2">
        <div>
            <div class="text-center mb-2 pb-2">
                <a href="#menu" class="text-decoration-none">
                    <h1 class="text-warning ms-4 pt-5" style="font-weight: 600;" id="menu">Menu
                    </h1>

                </a>
            </div>
        </div>
        <div class="container position-relative">
            <div class="row py-5 gy-3 justify-content-center">
                <div class="col-sm-5 col-md-2">
                    <div class="card align-items-center" style="background-color: transparent">
                        <a href="#breads">
                            <img src="img/menu3/1.png" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <h5 class="card-title text-center text-white">Breads</h5>
                            <div class="d-flex justify-content-center">
                                <a href="#breads" class="btn btn-outline-warning">
                                    <span>
                                        Check for Breads
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-5 col-md-2">
                    <div class="card align-items-center" style="background-color: transparent;">
                        <a href="#meals">
                            <img src="img/menu3/11.png" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <h5 class="card-title text-center text-white">Meals</h5>
                            <div class="d-flex justify-content-center">
                                <a href="#meals" class="btn btn-outline-warning">
                                    <span>
                                        Check for Meals
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-5 col-md-2">
                    <div class="card align-items-center" style="background-color: transparent;">
                        <a href="#sticks">
                            <img src="img/menu3/31.png" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <h5 class="card-title text-center  text-white">Stick-Foods</h5>
                            <div class="d-flex justify-content-center">
                                <a href="#sticks" class="btn btn-outline-warning">
                                    <span>
                                        Check for Stick-Foods
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-5 col-md-2">
                    <div class="card align-items-center" style="background-color: transparent;">
                        <a href="#desserts">
                            <img src="img/menu3/21.png" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <h5 class="card-title text-center  text-white">Desserts</h5>
                            <div class="d-flex justify-content-center">
                                <a href="#desserts" class="btn btn-outline-warning ">
                                    <span>
                                        Check for Desserts
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-5 col-md-2">
                    <div class="card align-items-center" style="background-color: transparent;">
                        <a href="#drinks">
                            <img src="img/menu3/42.png" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <h5 class="card-title text-center text-white">Drinks</h5>
                            <div class="d-flex justify-content-center">
                                <a href="#desserts" class="btn btn-outline-warning">
                                    <span>
                                        Check for Drinks
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section id="slider" class="home-section-3 pb-5">
    <div>
        <div class="text-start mb-2 pb-2">
            <a href="#menu" class="text-decoration-none">
                <h1 class="text-black ms-4 pt-5" style="font-weight: 600;" id="menu">Hottest <span class="text-danger">Menu</span>
                    This Summer
                </h1>

            </a>
        </div>
    </div>
    <div class="container position-relative">
        <div class="row py-5 gy-3 justify-content-center">
            <div class="col-sm-4 col-md-3">
                <div class="card align-items-center" style="background-color: transparent">
                    <a href="#breads">
                        <img src="img/menu3/20.png" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body text-center">
                        <h5 class="card-title text-center text-black">Ube Halaya</h5>
                        <a href="#" class="btn btn-outline-primary">
                            <i class="bi bi-cart-plus"></i>
                            <span>
                                Add Order
                            </span>
                        </a>
                        <a class="btn btn-outline-danger"><i class="bi bi-heart"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 col-md-3">
                <div class="card align-items-center" style="background-color: transparent;">
                    <a href="#meals">
                        <img src="img/menu3/24.png" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body text-center">
                        <h5 class="card-title text-center text-black">Ice Scramble</h5>
                        <div class="text-center">
                            <a href="#" class="btn btn-outline-primary">
                                <i class="bi bi-cart-plus"></i>
                                <span>
                                    Add Order
                                </span>
                            </a>
                            <a class="btn btn-outline-danger"><i class="bi bi-heart"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 col-md-3">
                <div class="card align-items-center" style="background-color: transparent;">
                    <a href="#sticks">
                        <img src="img/menu3/26.png" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body text-center">
                        <h5 class="card-title text-center  text-black">Ube Halo-Halo</h5>
                        <a href="#" class="btn btn-outline-primary">
                            <i class="bi bi-cart-plus"></i>
                            <span>
                                Add Order
                            </span>
                        </a>
                        <a class="btn btn-outline-danger"><i class="bi bi-heart"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 col-md-3">
                <div class="card align-items-center" style="background-color: transparent;">
                    <a href="#desserts">
                        <img src="img/menu3/13.png" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body text-center">
                        <h5 class="card-title text-center  text-black">Lumpia</h5>
                        <a href="#" class="btn btn-outline-primary">
                            <i class="bi bi-cart-plus"></i>
                            <span>
                                Add Order
                            </span>
                        </a>
                        <a class="btn btn-outline-danger"><i class="bi bi-heart"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 col-md-3">
                <div class="card align-items-center" style="background-color: transparent;">
                    <a href="#desserts">
                        <img src="img/menu3/21.png" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body text-center">
                        <h5 class="card-title text-center  text-black">Buko Pandan</h5>
                        <a href="#" class="btn btn-outline-primary">
                            <i class="bi bi-cart-plus"></i>
                            <span>
                                Add Order
                            </span>
                        </a>
                        <a class="btn btn-outline-danger"><i class="bi bi-heart"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 col-md-3">
                <div class="card align-items-center" style="background-color: transparent;">
                    <a href="#desserts">
                        <img src="img/menu3/16.png" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body text-center">
                        <h5 class="card-title text-center  text-black">Sisig</h5>
                        <a href="#" class="btn btn-outline-primary">
                            <i class="bi bi-cart-plus"></i>
                            <span>
                                Add Order
                            </span>
                        </a>
                        <a class="btn btn-outline-danger"><i class="bi bi-heart"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 col-md-3">
                <div class="card align-items-center" style="background-color: transparent;">
                    <a href="#desserts">
                        <img src="img/menu3/11.png" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body text-center">
                        <h5 class="card-title text-center  text-black">Sinigang</h5>
                        <a href="#" class="btn btn-outline-primary">
                            <i class="bi bi-cart-plus"></i>
                            <span>
                                Add Order
                            </span>
                        </a>
                        <a class="btn btn-outline-danger"><i class="bi bi-heart"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 col-md-3">
                <div class="card align-items-center" style="background-color: transparent;">
                    <a href="#desserts">
                        <img src="img/menu3/9.png" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body text-center">
                        <h5 class="card-title text-center  text-black">Buko Pie</h5>
                        <a href="#" class="btn btn-outline-primary">
                            <i class="bi bi-cart-plus"></i>
                            <span>
                                Add Order
                            </span>
                        </a>
                        <a class="btn btn-outline-danger" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Add to Favourites"><i class="bi bi-heart"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section id="slider" class="home-section-4 pb-5">
    <div>
        <div class="text-start mb-2 pb-2">
            <a href="#menu" class="text-decoration-none">
                <h1 class="text-white ms-4 pt-5" style="font-weight: 600;" id="menu">Popular Filipino <span class="text-warning">Cuisines</span>
                </h1>

            </a>
        </div>
    </div>
    <div class="container position-relative">
        <div class="row py-5 gy-3 justify-content-center">
            <div class="col-sm-4 col-md-3">
                <div class="card align-items-center border border-warning" style="background-color: transparent;">
                    <a href="#breads">
                        <img src="img/menu3/10.png" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body text-center">
                        <h5 class="card-title text-center text-white">Adobo</h5>
                        <a href="#" class="btn btn-outline-warning">
                            <i class="bi bi-cart-plus"></i>
                            <span>
                                Add Order
                            </span>
                        </a>
                        <a class="btn btn-outline-danger"><i class="bi bi-heart"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 col-md-3">
                <div class="card align-items-center border border-warning" style="background-color: transparent;">

                    <a href="#meals">
                        <img src="img/menu3/11.png" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body text-center">
                        <h5 class="card-title text-center text-white">Sinigang</h5>
                        <div class="text-center">
                            <a href="#" type="button" class="btn btn-outline-warning" data-bs-toggle="tooltip" data-bs-placement="top"
                               data-bs-custom-class="custom-tooltip"
                               data-bs-title="Add to Favourites">
                                <i class="bi bi-cart-plus"></i>
                                <span>
                                    Add Order
                                </span>
                            </a>
                            <a class="btn btn-outline-danger"><i class="bi bi-heart"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 col-md-3">
                <div class="card align-items-center border border-warning" style="background-color: transparent;">
                    <a href="#sticks">
                        <img src="img/menu3/12.png" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body text-center">
                        <h5 class="card-title text-center text-white">Kare-Kare</h5>
                        <a href="#" class="btn btn-outline-warning">
                            <i class="bi bi-cart-plus"></i>
                            <span>
                                Add Order
                            </span>
                        </a>
                        <a class="btn btn-outline-danger"><i class="bi bi-heart"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 col-md-3">
                <div class="card align-items-center border border-warning" style="background-color: transparent;">
                    <a href="#desserts">
                        <img src="img/menu3/13.png" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body text-center">
                        <h5 class="card-title text-center  text-white">Lumpia</h5>
                        <a href="#" class="btn btn-outline-warning">
                            <i class="bi bi-cart-plus"></i>
                            <span>
                                Add Order
                            </span>
                        </a>
                        <a class="btn btn-outline-danger"><i class="bi bi-heart"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 col-md-3">
                <div class="card align-items-center border border-warning" style="background-color: transparent;">
                    <a href="#desserts">
                        <img src="img/menu3/14.png" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body text-center">
                        <h5 class="card-title text-center  text-white">Pancit</h5>
                        <a href="#" class="btn btn-outline-warning">
                            <i class="bi bi-cart-plus"></i>
                            <span>
                                Add Order
                            </span>
                        </a>
                        <a class="btn btn-outline-danger"><i class="bi bi-heart"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 col-md-3">
                <div class="card align-items-center border border-warning" style="background-color: transparent;">
                    <a href="#desserts">
                        <img src="img/menu3/16.png" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body text-center">
                        <h5 class="card-title text-center  text-white">Sisig</h5>
                        <a href="#" class="btn btn-outline-warning">
                            <i class="bi bi-cart-plus"></i>
                            <span>
                                Add Order
                            </span>
                        </a>
                        <a class="btn btn-outline-danger"><i class="bi bi-heart"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 col-md-3">
                <div class="card align-items-center border border-warning" style="background-color: transparent;">
                    <a href="#desserts">
                        <img src="img/menu3/15.png" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body text-center">
                        <h5 class="card-title text-center  text-white">Tinola</h5>
                        <a href="#" class="btn btn-outline-warning">
                            <i class="bi bi-cart-plus"></i>
                            <span>
                                Add Order
                            </span>
                        </a>
                        <a class="btn btn-outline-danger"><i class="bi bi-heart"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 col-md-3">
                <div class="card align-items-center border border-warning" style="background-color: transparent;">
                    <a href="#desserts">
                        <img src="img/menu3/17.png" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body text-center">
                        <h5 class="card-title text-center  text-white">Bistek</h5>
                        <a href="#" class="btn btn-outline-warning">
                            <i class="bi bi-cart-plus"></i>
                            <span>
                                Add Order
                            </span>
                        </a>
                        <a class="btn btn-outline-danger"><i class="bi bi-heart"></i></a>
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