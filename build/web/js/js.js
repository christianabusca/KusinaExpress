/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

/* global date, message, messageFromJava, registration */

//Sidemenu
$(document).ready(function () {
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

    if (window.location.href.endsWith('/Home/guest')) {

        $('#exampleModal').modal('show');
    }
    if (window.location.href.endsWith('/main/home')) {

        $('#exampleModal2').modal('show');
    }

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

    $(".close-button").on("click", function () {
        $(".popup").css("display", "none");
    });

    $("#usern_error_message").hide();
    $("#password_error_message").hide();
    $("#fname_error_message").hide();
    $("#mname_error_message").hide();
    $("#lname_error_message").hide();
    $("#location_error_message").hide();
    $("#date_error_message").hide();
    $("#number_error_message").hide();

    var error_usern = false;
    var error_pass = false;
    var error_confirmpass = false;
    var error_mname = false;
    var error_fname = false;
    var error_lname = false;
    var error_location = false;
    var error_date = false;
    var error_number = false;


    $("#usern").focusout(function () {
        check_usern();
    });
    $("#pass").focusout(function () {
        check_pass();
    });
    $("#confirmPass").focusout(function () {
        check_confirmPass();
    });
    $("#fname").focusout(function () {
        check_fname();
    });
    $("#mname").focusout(function () {
        check_mname();
    });
    $("#lname").focusout(function () {
        check_lname();
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
            $("#usern_error_message").html("Username is required");
            $("#usern_error_message").show();
            $("#usern").css("border", "2px solid #F90A0A");
            error_usern = true;
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

    function check_confirmPass() {
        var pass = $("#pass").val();
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

    function check_fname() {
        var pattern = /^[a-zA-Z\s]+$/;
        var fname = $("#fname").val();
        if (pattern.test(fname) && fname !== '') {
            $("#fname_error_message").hide();
            $("#fname").css("border", "2px solid #34F458");
        } else {
            $("#fname_error_message").html("First Name is required");
            $("#fname_error_message").show();
            $("#fname").css("border", "2px solid #F90A0A");
            error_fname = true;
        }
    }

    function check_mname() {
        var pattern = /^[a-zA-Z\s]+$/;
        var mname = $("#mname").val();
        if (mname === '') {
            $("#mname_error_message").hide();
            $("#mname").css("border", "1px solid #ccc");
        } else if (pattern.test(mname)) {
            $("#mname_error_message").hide();
            $("#mname").css("border", "2px solid #34F458");
        } else {
            $("#mname_error_message").html("Please input the correct format for Middle Name");
            $("#mname_error_message").show();
            $("#mname").css("border", "2px solid #F90A0A");
            error_input = true;
        }
    }

    function check_lname() {
        var pattern = /^[a-zA-Z\s]+$/;
        var lname = $("#lname").val();
        if (pattern.test(lname) && lname !== '') {
            $("#lname_error_message").hide();
            $("#lname").css("border", "2px solid #34F458");
        } else {
            $("#lname_error_message").html("Last Name is required");
            $("#lname_error_message").show();
            $("#lname").css("border", "2px solid #F90A0A");
            error_lname = true;
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

    $("#form").submit(function () {
        error_usern = false;
        error_pass = false;
        error_confirmpass = false;
        error_fname = false;
        error_mname = false;
        error_lname = false;
        error_location = false;
        error_date = false;
        error_number = false;


        check_usern();
        check_pass();
        check_confirmPass();
        check_fname();
        check_mname();
        check_lname();
        check_location();
        check_date();
        check_number();

        if (error_usern === false && error_pass === false && error_confirmpass === false && error_fname === false && error_mname === false &&
                error_lname === false && error_location === false && error_date === false && error_number === false) {

            return true;
        } else {
            alert("Please Fill the form Correctly");
            return false;
        }


    });

});