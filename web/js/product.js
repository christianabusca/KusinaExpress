/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

/* global date, message, messageFromJava, registration */

//Sidemenu
$(document).ready(function () {
    $('#example').DataTable();
    $(".arrow").click(function (e) {
        let arrowParent = $(e.target).parent().parent();
        arrowParent.toggleClass("showMenu");
    });

    let sidebar = $(".sidebar");
    let sidebarBtn = $(".bx-menu");
    console.log(sidebarBtn);
    sidebarBtn.click(function () {
        sidebar.toggleClass("close");
    });

    const loginText = $(".title-text .login");
    const loginForm = $("form.login");
    const loginBtn = $("label.login");
    const signupBtn = $("label.signup");
    const signupLink = $("form .signup-link a");

    signupBtn.on("click", function () {
        loginForm.css("marginLeft", "-50%");
        loginText.css("marginLeft", "-50%");
    });

    loginBtn.on("click", function () {
        loginForm.css("marginLeft", "0%");
        loginText.css("marginLeft", "0%");
    });

    signupLink.on("click", function () {
        signupBtn.click();
        return false;
    });

    $("#button, #button1, #button2").on("click", function () {
        $(".popup").css("display", "flex");
    });

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
        var pattern = /^[a-zA-Z\s]{3,}$/;
        var pName = $("#pName").val();
        if (pattern.test(pName) && pName !== '') {
            $("#pName_message").hide();
            $("#pName").css("border", "2px solid #34F458");
        } else if (pName.length < 3) {
            $("#pName_message").html("More than 3 letters is required");
            $("#pName_message").show();
            $("#pName").css("border", "2px solid #F90A0A");
            error_pName = true;
        } else {
            $("#pName_message").html("Product Name is required");
            $("#pName_message").show();
            $("#pName").css("border", "2px solid #F90A0A");
            error_pName = true;
        }
    }

    function check_description() {
        var pattern = /^[a-zA-Z\s]{3,}$/;
        var description = $("#description").val();
        if (pattern.test(description) && description !== '') {
            $("#description_error_message").hide();
            $("#description").css("border", "2px solid #34F458");
        } else if (description.split(" ").length < 3) {
            $("#description_error_message").html("More than 3 letters is required");
            $("#description_error_message").show();
            $("#description").css("border", "2px solid #F90A0A");
            error_description = true;
        } else {
            $("#description_error_message").html("Description is required");
            $("#description_error_message").show();
            $("#description").css("border", "2px solid #F90A0A");
            error_description = true;
        }
    }

    function check_price() {
        var pattern = /^\d+\.\d{2}$/;
        var price = $("#price").val();
        if (pattern.test(price) && price !== '' && parseFloat(price) > 0) {
            $("#price_error_message").hide();
            $("#price").css("border", "2px solid #34F458");
        } else if (!pattern.test(price)) {
            $("#price_error_message").html("The Price must follow the 0.00 format");
            $("#price_error_message").show();
            $("#price").css("border", "2px solid #F90A0A");
            error_price = true;
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
        if (type !== '') {
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

        if (error_pID === false && error_pName === false && 
                error_description === false && error_size === false
                && error_price === false && error_quantity === false && error_type === false) {
            return true;
        } else {
            alert("Please fill the form correctly");
            return false;
        }
    });
});
