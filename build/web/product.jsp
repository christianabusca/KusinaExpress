<%-- 
    Document   : product
    Created on : May 15, 2023, 4:27:38 PM
    Author     : Christian
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Products</title>

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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/product.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dataTables.bootstrap5.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css.map">
        <script src="${pageContext.request.contextPath}/js/jquery-3.6.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/dataTables.bootstrap5.min.js"></script>  
        <script src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script> 
        <script src="${pageContext.request.contextPath}/js/product.js"></script>
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
                <a href="${pageContext.request.contextPath}/main/adminhomepage">
                    <i class='bx bxs-home-smile'></i>
                    <span class="link_name">Home</span>
                </a>
                <ul class="sub-menu blank">
                    <li><a class="link_name" href="${pageContext.request.contextPath}/main/adminhomepage">Home</a></li>
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
                <div class="iocn-link">
                    <a>
                        <i class='bx bxs-user-badge'></i>
                        <span class="link_name">Admin</span>
                    </a>
                    <i class='bx bxs-chevron-down arrow'></i>
                </div>
                <ul class="sub-menu">
                    <li><a class="link_name" >Admin</a></li>
                    <li><a href="${pageContext.request.contextPath}/products">Products</a></li>
                    <li><a href="${pageContext.request.contextPath}/admincontrol">User Management</a></li>
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
                            <span class="link_name">Hi! <c:out value='${userID}'/></span>
                        </div>
                        <a href="${pageContext.request.contextPath}/main">
                            <i class='bx bx-log-out' name="enteredUsername"></i>
                        </a>
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
                <div id="logo">
                    <div class="container">
                        <img src="${pageContext.request.contextPath}/img/product.png" class="card-img-top me-3 img-fluid" alt="..." style="max-width: 200px;">
                    </div>
                </div>
                <a class="text-decoration-none d-flex justify-content-center">
                    <h1 class="text-black pt-5" style="font-weight: 600;" id="menu">Search <span
                            class="text-danger">Menu</span></h1>
                </a>

                <form class="needs-validation d-inline-block" action="${pageContext.request.contextPath}/products/search"  method="GET">
                    <div class="form-group py-3">
                        <input class="form-control" type="search" name="productID" id="productID" placeholder="Product ID" required>

                    </div>
                    <div class="form-group py-3">
                        <input class="form-control" type="search" name="productName" placeholder="Product Name" id="productName" required>

                    </div>
                    <input class="btn w-100 text-white" style="background: -webkit-radial-gradient(center, circle, #DA3422, #FF8844, #DA3422);" type="submit" value="Search">
                </form>

            </div>
        </div>
    </div>
    <section class="home-section-2" id="section-2">
        <div class="py-4" >
            <div class="container-fluid text-white text-center">
                <div class="alert simple-alert" style="display:none;">
                    <h3><c:out value="${message}" /></h3>
                </div>
                <c:if test="${not empty allProducts}">
                    <table class="table table-striped table-hover" id='example'>
                        <thead>
                            <tr>
                                <th>Product ID</th>
                                <th>Product Name</th>
                                <th>Description</th>
                                <th>Size</th>
                                <th>Prize</th>
                                <th>Quantity</th>
                                <th>Type</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${allProducts}" var="product">
                                <tr>
                                    <td class="text-center">${product.productID}</td>
                                    <td>${product.productName}</td>
                                    <td>${product.description}</td>
                                    <td>${product.size}</td>
                                    <td class="text-center"><fmt:formatNumber type="number" pattern="0.00" value="${product.price}"/></td>
                                    <td class="text-center">${product.quantity}</td>
                                    <td>${product.type}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/products/update/form?productID=${product.productID}" class="btn btn-sm btn-link">Edit</a>
                                        <a href="${pageContext.request.contextPath}/products/delete?productID=${product.productID}" class="btn btn-sm btn-link">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Product ID</th>
                                <th>Product Name</th>
                                <th>Description</th>
                                <th>Size</th>
                                <th>Prize</th>
                                <th>Quantity</th>
                                <th>Type</th>
                                <th>Action</th>
                            </tr>
                        </tfoot>
                    </table>
                </c:if>
            </div>

            <div class="text-center">
                <a href="#" class="btn btn-warning text-black" id="button">
                    <span>
                        Add Product
                    </span>
                    <i class='bx bxs-cart-add'></i>
                </a>
                <div class="popup">
                    <div class="popup-content">
                        <div class="wrapper text-black" style="background-image: url(${pageContext.request.contextPath}/img/wood.jpg);">
                            <a class="close-button-1" alt="close"><i class="bi bi-x-circle-fill"></i></a>
                            <img src="${pageContext.request.contextPath}/img/product.png" class="logos-imahe">
                            <div class="container pt-2">
                                <div class=" text-center">
                                    <h1 class="text-black fw-bold">
                                        Product Form</span>
                                    </h1>
                                </div>
                            </div>
                            <div class="form-container">
                                <div class="form-inner">
                                    <form method="POST" action="${pageContext.request.contextPath}/products/create" class="signup" id="form2">
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
                                                       value="<c:out value="${product.description}"/>" required>
                                                <span class="error_form" id="description_error_message"></span>
                                            </div>
                                            <div class="field">
                                                <input type="text" name="size" placeholder="Size" id="size" 
                                                       value="<c:out value="${product.size}"/>" >
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
                                                <select name="type" id="type" placeholder="Type of Menu" 
                                                        value="<c:out value="${product.type}"/>" required>
                                                    <option value="" disabled selected hidden>Type of Menu</option>
                                                    <option >Bread</option>
                                                    <option >Meals</option>
                                                    <option>Stick-foods</option>
                                                    <option >Desserts</option>
                                                    <option>Drinks</option>
                                                </select>
                                                <span class="error_form" id="type_error_message"></span>
                                            </div>
                                            <div class="field btn">
                                                <div class="btn-layer"></div>
                                                <button type="submit" class="btn btn-primary" id="liveAlertBtn" value="submit" name="addproduct">Save</button>
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
