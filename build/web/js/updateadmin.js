/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

/* global date, message, messageFromJava, registration */

//Sidemenu
$(document).ready(function () {
    $('#example').DataTable();
    $('#example1').DataTable();
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

    $("#userID_error").hide();
    $("#password_error_message").hide();
    $("#firstN_error").hide();
    $("#middleN_error").hide();
    $("#lastN_error").hide();
    $("#location_error_message").hide();
    $("#date_error_message").hide();
    $("#number_error_message").hide();
    $("#rUser_error").hide();
    var error_userID = false;
    var error_pass = false;
    var error_firstN = false;
    var error_middleN = false;
    var error_lastN = false;
    var error_location = false;
    var error_date = false;
    var error_number = false;
    var error_rUser = false;
    $("#userID").focusout(function () {
        check_userID();
    });
    $("#pass").focusout(function () {
        check_pass();
    });
    $("#firstN").focusout(function () {
        check_firstN();
    });
    $("#middleN").focusout(function () {
        check_middleN();
    });
    $("#lastN").focusout(function () {
        check_lastN();
    });
    $("#location").focusout(function () {
        check_location();
    });
    $("#date").focusout(function () {
        check_date();
    });
    $("#number").focusout(function () {
        check_number();
    });
    $("#rUser").focusout(function () {
        check_rUser();
    });
    function check_userID() {
        var pattern = /^[A-Za-z0-9]{5}$/;
        var userID = $("#userID").val();
        if (pattern.test(userID) && userID !== '') {
            $("#userID_error").hide();
            $("#userID").css("border", "2px solid #34F458");
        } else if (userID.length !== 5) {
            $("#userID_error").html("It should consist of 5 characters");
            $("#userID_error").show();
            $("#userID").css("border", "2px solid #F90A0A");
            error_userID = true;
        } else {
            $("#userID_error").html("UserID is required");
            $("#userID_error").show();
            $("#userID").css("border", "2px solid #F90A0A");
            error_userID = true;
        }
    }

    function check_pass() {
        var pattern = /^[a-zA-Z0-9!@#$%^&*()+=._-]{8,16}$/;
        var pass = $("#pass").val().trim();
        if (pattern.test(pass) && pass !== '') {
            $("#password_error_message").hide();
            $("#pass").css("border", "2px solid #34F458");
        } else if (/\s/.test(pass) && pass.length >= 8) {
            $("#password_error_message").html("Password should not contain spaces");
            $("#password_error_message").show();
            $("#pass").css("border", "2px solid #F90A0A");
            error_pass = true;
        } else if (!/[A-Z]/.test(pass)) {
            $("#password_error_message").html("1 capital letter is required in Password");
            $("#password_error_message").show();
            $("#pass").css("border", "2px solid #F90A0A");
            error_pass = true;
        } else if (!/[a-z]/.test(pass)) {
            $("#password_error_message").html(" 1 small letter is required in Password");
            $("#password_error_message").show();
            $("#pass").css("border", "2px solid #F90A0A");
            error_pass = true;
        } else if (!/\d/.test(pass)) {
            $("#password_error_message").html("1 number is required in Password");
            $("#password_error_message").show();
            $("#pass").css("border", "2px solid #F90A0A");
            error_pass = true;
        } else if (!/[!@#$%^&*()+=._-]/.test(pass)) {
            $("#password_error_message").html("1 special character is required in Password");
            $("#password_error_message").show();
            $("#pass").css("border", "2px solid #F90A0A");
            error_pass = true;
        } else if (pass.length > 16) {
            $("#password_error_message").html("Password must be no more than 16 characters");
            $("#password_error_message").show();
            $("#pass").css("border", "2px solid #F90A0A");
            error_pass = true;
        } else {
            $("#password_error_message").html("Password must be atleast 8 characters");
            $("#password_error_message").show();
            $("#pass").css("border", "2px solid #F90A0A");
            error_pass = true;
        }
    }

    function check_firstN() {
        var pattern = /^[a-zA-Z\s]+$/;
        var firstN = $("#firstN").val();
        if (pattern.test(firstN) && firstN !== '') {
            $("#firstN_error").hide();
            $("#firstN").css("border", "2px solid #34F458");
        } else {
            $("#firstN_error").html("First Name is required");
            $("#firstN_error").show();
            $("#firstN").css("border", "2px solid #F90A0A");
            error_firstN = true;
        }
    }

    function check_middleN() {
        var pattern = /^[a-zA-Z\s]+$/;
        var middleN = $("#middleN").val();
        if (middleN === '') {
            $("#middleN_error").hide();
            $("#middleN").css("border", "1px solid #ccc");
        } else if (pattern.test(middleN)) {
            $("#middleN_error").hide();
            $("#middleN").css("border", "2px solid #34F458");
        } else {
            $("#middleN_error").html("Please input the correct format for Middle Name");
            $("#middleN_error").show();
            $("#middleN").css("border", "2px solid #F90A0A");
            error_middleN = true;
        }
    }

    function check_lastN() {
        var pattern = /^[a-zA-Z\s]+$/;
        var lastN = $("#lastN").val();
        if (pattern.test(lastN) && lastN !== '') {
            $("#lastN_error").hide();
            $("#lastN").css("border", "2px solid #34F458");
        } else {
            $("#lastN_error").html("Last Name is required");
            $("#lastN_error").show();
            $("#lastN").css("border", "2px solid #F90A0A");
            error_lastN = true;
        }
    }

    function check_location() {
        var pattern = /^[A-Za-z0-9'\.\-\s,]+$/;
        var location = $("#location").val();
        if (pattern.test(location.trim()) && location !== '') {
            $("#location_error_message").hide();
            $("#location").css("border", "2px solid #34F458");
        } else {
            $("#location_error_message").html("Address is required");
            $("#location_error_message").show();
            $("#location").css("border", "2px solid #F90A0A");
            error_location = true;
        }
    }

    function check_date() {
        $("#date").attr("min", new Date(new Date().getFullYear() - 100, 0, 1).toISOString().slice(0, 10));
        $("#date").attr("max", new Date().toISOString().slice(0, 10));

        var date = $("#date").val();
        var currentDate = new Date().toISOString().slice(0, 10);
        var miniDate = new Date(new Date().getFullYear() - 100, 0, 1).toISOString().slice(0, 10);

        if (date !== '') {
            if (date < miniDate) {
                $("#date_error_message").html("Too ancient, change it!");
                $("#date_error_message").show();
                $("#date").css("border", "2px solid #F90A0A");
                error_date = true;
            } else if (date > currentDate) {
                $("#date_error_message").html("Too advance, change it!");
                $("#date_error_message").show();
                $("#date").css("border", "2px solid #F90A0A");
                error_date = true;
            } else {
                $("#date_error_message").hide();
                $("#date").css("border", "2px solid #34F458");
            }
        } else {
            $("#date_error_message").html("Birthday is required");
            $("#date_error_message").show();
            $("#date").css("border", "2px solid #F90A0A");
            error_date = true;
        }
    }


    function check_number() {
        var pattern = /^\d{11}$/;
        var number = $("#number").val();
        if (pattern.test(number) && number !== '') {
            $("#number_error_message").hide();
            $("#number").css("border", "2px solid #34F458");
        } else {
            $("#number_error_message").html("11 digit number is required");
            $("#number_error_message").show();
            $("#number").css("border", "2px solid #F90A0A");
            error_number = true;
        }
    }


    function check_rUser() {
        var rUser = $("#rUser").val();
        var validRoles = ["Administrator", "Customer"];
        if (validRoles.includes(rUser) && rUser !== '') {
            $("#rUser_error").hide();
            $("#rUser").css("border", "2px solid #34F458");
        } else {
            $("#rUser_error").html("Please type either Administrator or Customer.");
            $("#rUser_error").show();
            $("#rUser").css("border", "2px solid #F90A0A");
            error_rUser = true;
        }
    }

    $("#form3").submit(function () {
        error_userID = false;
        error_pass = false;
        error_firstN = false;
        error_middleN = false;
        error_lastN = false;
        error_location = false;
        error_date = false;
        error_number = false;
        error_rUser = false;

        check_userID();
        check_pass();
        check_firstN();
        check_middleN();
        check_lastN();
        check_location();
        check_date();
        check_number();
        check_rUser();

        if (error_userID === false && error_pass === false && error_firstN === false &&
                error_middleN === false && error_lastN === false && error_location === false
                && error_date === false && error_number === false && error_rUser === false) {
            return true;

        } else {
            alert("Please fill the form correctly");
            return false;
        }
    });
});