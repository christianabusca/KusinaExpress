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
    $("#firstN_error").hide();
    $("#middleN_error").hide();
    $("#lastN_error").hide();
    $("#rUser_error").hide();
    var error_userID = false;
    var error_firstN = false;
    var error_middleN = false;
    var error_lastN = false;
    var error_rUser = false;
    $("#userID").focusout(function () {
        check_userID();
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

    function check_rUser() {
        var rUser = $("#rUser").val();
        if (rUser !== '') {
            $("#rUser_error").hide();
            $("#rUser").css("border", "2px solid #34F458");
        } else {
            $("#rUser_error").html("User Role is required");
            $("#rUser_error").show();
            $("#rUser").css("border", "2px solid #F90A0A");
            error_rUser = true;
        }
    }

    $("#form3").submit(function () {
        error_userID = false;
        error_firstN = false;
        error_middleN = false;
        error_lastN = false;
        error_rUser = false;
        check_userID();
        check_firstN();
        check_middleN();
        check_lastN();
        check_rUser();

        if (error_userID === false && error_firstN === false &&
                error_middleN === false && error_lastN === false && error_rUser === false) {
            return true;

        } else {
            alert("Please fill the form correctly");
            return false;
        }
    });
    if (window.location.href.endsWith('/admincontrol/add')) {
                
                $('#exampleModal').modal('show');
            }
});