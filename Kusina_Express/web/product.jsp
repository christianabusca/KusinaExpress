<%-- 
    Document   : product
    Created on : May 15, 2023, 4:27:38 PM
    Author     : Christian
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Menu</title>

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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css.map">
        <script src="${pageContext.request.contextPath}/js/jquery-3.6.4.min.js"></script>  
        <script src="${pageContext.request.contextPath}/js/js.js"></script>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.7.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- icons -->
    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/img/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/img/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/img/favicon_io/favicon-16x16.png">
    <link rel="manifest" href="favicon_io/site.webmanifest">

    <style>
        .close-button-1 {
            display: block;
            margin-left: auto;
            padding-left: 19rem !important;
        }

        .close-button-1 i {

            font-size: 1.5rem;
            color: black;
        }
        .form-inner form .field select {
            height: 100%;
            width: 100%;
            outline: none;
            padding-left: 15px;
            border-radius: 5px;
            border: 1px solid black;
            border-bottom-width: 2px;
            font-size: 17px;
            transition: all 0.3s ease;
        }

        .form-inner form .field select:focus {
            border-color: #050100;
            /* box-shadow: inset 0 0 3px #fb6aae; */
        }
    </style>
    <script>
        $(document).ready(function () {
            $(".close-button-1").on("click", function () {
                $(".popup").css("display", "none");
            });

            $("#pID_error_message").hide();
            $("#pName_message").hide();
            $("#description_error_message").hide();
            $("#size_error_message").hide();
            $("#price_error_message").hide();
            $("#quantity_error_message").hide();
            $("#menu_error_message").hide();
            var error_pID = false;
            var error_pName = false;
            var error_description = false;
            var error_size = false;
            var error_price = false;
            var error_quantity = false;
            var error_type = false;
            $("#pID").focusout(function () {
                check_pID();
            });
            $("#pName").focusout(function () {
                check_pName();
            });
            $("#description").focusout(function () {
                check_description();
            });
            $("#size").focusout(function () {
                check_size();
            });
            $("#price").focusout(function () {
                check_price();
            });
            $("#quantity").focusout(function () {
                check_quantity();
            });
            $("#type").focusout(function () {
                check_type();
            });
            function check_pID() {
                var pattern = /^[1-9]\d*$/;
                var pID = $("#pID").val();
                if (pattern.test(pID) && pID !== '') {
                    $("#pID_error_message").hide();
                    $("#pID").css("border", "2px solid #34F458");
                } else {
                    $("#pID_error_message").html("Product ID is required");
                    $("#pID_error_message").show();
                    $("#pID").css("border", "2px solid #F90A0A");
                    error_pID = true;
                }
            }

            function check_pName() {
                var pattern = /^[a-zA-Z]{3,}$/;
                var pName = $("#pName").val();
                if (pattern.test(pName) && pName !== '') {
                    $("#pName_message").hide();
                    $("#pName").css("border", "2px solid #34F458");
                } else {
                    $("#pName_message").html("Product Name is required");
                    $("#pName_message").show();
                    $("#pName").css("border", "2px solid #F90A0A");
                    error_pName = true;
                }
            }

            function check_description() {
                var pattern = /^[a-zA-Z]{3,}$/;
                var description = $("#description").val();
                if (pattern.test(description) && description !== '') {
                    $("#description_error_message").hide();
                    $("#description").css("border", "2px solid #34F458");
                } else {
                    $("#description_error_message").html("Description is required");
                    $("#description_error_message").show();
                    $("#description").css("border", "2px solid #F90A0A");
                    error_description = true;
                }
            }

            function check_price() {
                var pattern = /^\d+(\.\d{2})?$/;
                var price = $("#price").val();
                if (pattern.test(price) && price !== '' && parseFloat(price) > 0) {
                    $("#price_error_message").hide();
                    $("#price").css("border", "2px solid #34F458");
                } else {
                    $("#price_error_message").html("Price is required");
                    $("#price_error_message").show();
                    $("#price").css("border", "2px solid #F90A0A");
                    error_price = true;
                }
            }

            function check_quantity() {
                var pattern = /^\d+$/;
                var quantity = $("#quantity").val();
                if (pattern.test(quantity) && quantity !== '') {
                    $("#quantity_error_message").hide();
                    $("#quantity").css("border", "2px solid #34F458");
                } else {
                    $("#quantity_error_message").html("Quantity is required");
                    $("#quantity_error_message").show();
                    $("#quantity").css("border", "2px solid #F90A0A");
                    error_quantity = true;
                }
            }

            function check_type() {
                var type = $("#type").val();
                if (type !== 'Type of Menu') {
                    $("#type_error_message").hide();
                    $("#type").css("border", "2px solid #34F458");
                } else {
                    $("#type_error_message").html("Type of Menu is required");
                    $("#type_error_message").show();
                    $("#type").css("border", "2px solid #F90A0A");
                    error_type = true;
                }
            }

            function check_size() {
                var pattern = /^[a-zA-Z0-9\s]+$/;
                var size = $("#size").val();
                if (size === '') {
                    $("#size_error_message").hide();
                    $("#size").css("border", "1px solid #ccc");
                } else if (pattern.test(size.trim()) && size !== '') {
                    $("#size_error_message").hide();
                    $("#size").css("border", "2px solid #34F458");
                } else {
                    $("#size_error_message").html("Size is required");
                    $("#size_error_message").show();
                    $("#size").css("border", "2px solid #F90A0A");
                    error_size = true;
                }
            }

            $("#form2").submit(function () {
                error_pID = false;
                error_pName = false;
                error_description = false;
                error_size = false;
                error_price = false;
                error_quantity = false;
                error_type = false;
                check_pID();
                check_pName();
                check_description();
                check_size();
                check_price();
                check_quantity();
                check_type();

                if (error_pID === false && error_pName === false && error_description === false && error_size === false && error_price === false && error_quantity === false && error_type === false) {
           
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
                <a href="${pageContext.request.contextPath}/home.jsp">
                    <i class='bx bxs-home-smile'></i>
                    <span class="link_name">Home</span>
                </a>
                <ul class="sub-menu blank">
                    <li><a class="link_name" href="${pageContext.request.contextPath}/home.jsp">Home</a></li>
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
                <div class="iocn-link">
                    <a href="${pageContext.request.contextPath}/product">
                        <i class='bx bxs-dish'></i>
                        <span class="link_name">Menu</span>
                    </a>
                    <i class='bx bxs-chevron-down arrow'></i>
                </div>
                <ul class="sub-menu">
                    <li><a class="link_name" href="${pageContext.request.contextPath}/product">Menu</a></li>
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
    <div class="home-section" id="section-1" style="
         background-image: url(${pageContext.request.contextPath}/img/menupro.png);">
        <div class="home-content">
            <i class='bx bx-menu'></i>
        </div>
        <div>
            <div class="text-center mb-2 pb-2">
                <div id="logo">
                    <div class="container">
                        <img src="${pageContext.request.contextPath}/img/plogo1.png" class="card-img-top me-3 img-fluid" alt="..." style="max-width: 200px;">
                    </div>
                </div>
                <a class="text-decoration-none d-flex justify-content-center">
                    <h1 class="text-black pt-5" style="font-weight: 600;" id="menu">Search <span
                            class="text-danger">Menu</span></h1>
                </a>
                <form class="needs-validation d-inline-block">
                    <div class="form-group was-validated py-3">
                        <input class="form-control" type="search" id="productID" placeholder="Product ID" required>

                    </div>
                    <div class="form-group was-validated py-3">
                        <input class="form-control" type="search" placeholder="Product Name" id="productName" required>

                    </div>
                    <input class="btn w-100 text-white" style="background-color: #7E5920;" type="submit" value="Search">
                </form>
            </div>
        </div>
    </div>
    <section class="home-section-2" id="section-2">
        <div class="py-4" >
            <table class="table text-white">
                <thead>
                    <tr>
                        <th scope="col">Product ID</th>
                        <th scope="col">Product Name</th>
                        <th scope="col">Description</th>
                        <th scope="col">Size</th>
                        <th scope="col">Prize</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Type</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">-</th>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                    </tr>
                </tbody>
            </table>
            <div class="text-center">
                <a href="#" class="btn btn-warning text-black" id="button">

                    <span>
                        Add Product
                    </span>
                    <i class='bx bxs-cart-add'></i>
                </a>
                <div class="popup">
                    <div class="popup-content">
                        <div class="wrapper text-black" style="background-color: lightgrey;">
                            <a class="close-button-1" alt="close"><i class="bi bi-x-circle-fill"></i></a>
                            <div class="container">
                                <div class=" text-center">
                                    <h1 class="text-black fw-bold">
                                        Product <span class=" text-white bg-danger rounded-pill px-3">Form</span>
                                    </h1>
                                </div>
                            </div>
                            <div class="form-container">
                                <div class="form-inner">
                                    <form method="POST" action="${pageContext.request.contextPath}/products/add" class="signup" id="form2">
                                        <div class="fields">
                                            <div class="field">
                                                <input type="number" name="productID" placeholder="Product ID" id="pID" 
                                                       value="<c:out value="${product.productID}"/>" required>
                                                <span class="error_form" id="pID_error_message"></span>
                                            </div>
                                            <div class="field">
                                                <input type="text" name="productName" placeholder="Product Name" id="pName" 
                                                       value="<c:out value="${product.productName}"/>" required>
                                                <span class="error_form" id="pName_message"></span>
                                            </div>
                                            <div class="field">
                                                <input type="text" name="description" placeholder="Description" id="description"
                                                       value="<c:out value="${product.description}"/>">
                                                <span class="error_form" id="description_error_message"></span>
                                            </div>
                                            <div class="field">
                                                <input type="text" name="size" placeholder="Size" id="size" 
                                                       value="<c:out value="${product.size}"/>" required>
                                                <span class="error_form" id="size_error_message"></span>
                                            </div>
                                            <div class="field">
                                                <input type="number" name="price" placeholder="Price" step="0.01" id="price" 
                                                       value="<c:out value="${product.price}"/>" required>
                                                <span class="error_form" id="price_error_message"></span>
                                            </div>
                                            <div class="field">
                                                <input type="number" name="quantity" placeholder="Quantity" id="quantity" 
                                                       value="<c:out value="${product.quantity}"/>" required>
                                                <span class="error_form" id="quantity_error_message"></span>
                                            </div>
                                            <div class="field">
                                                <select name="type" name="type" id="type" placeholder="Type of Menu" 
                                                        value="<c:out value="${product.type}"/>" required>
                                                    <option value="" disabled selected hidden>Type of Menu</option>
                                                    <option value="meals">Bread</option>
                                                    <option value="meals">Meals</option>
                                                    <option value="meals">Stick-foods</option>
                                                    <option value="meals">Desserts</option>
                                                    <option value="meals">Drinks</option>
                                                </select>
                                                <span class="error_form" id="type_error_message"></span>
                                            </div>
                                            <div class="field btn">
                                                <div class="btn-layer"></div>
                                                <button type="submit" class="btn btn-primary" id="liveToastBtn" value="submit">Save</button>

                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div> 
                    </div>
                </div>
                <div class="py-4" >           
                    <table class="table text-white text-start">
                        <thead>
                            <tr>
                                <th scope="col">History</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row" > The Product Name: <c:out value="${product.productName}"/> , with a Product ID: <c:out value="${product.productID}"/> , 
                                    has been added to the inventory.  </th>
                            </tr>
                        </tbody>
                    </table>
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
