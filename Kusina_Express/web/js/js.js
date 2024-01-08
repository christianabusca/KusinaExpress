/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

/* global date */

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
  $("#fname_error_message").hide();
  $("#mname_error_message").hide();
  $("#lname_error_message").hide();
  $("#location_error_message").hide();
  $("#date_error_message").hide();
  $("#number_error_message").hide();

  var error_usern = false;
  var error_mname = false;
  var error_fname = false;
  var error_lname = false;
  var error_location = false;
  var error_date = false;
  var error_number = false;

  $("#usern").focusout(function () {
    check_usern();
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
    var pattern = /^[a-zA-Z0-9]{4,12}$/;
    var usern = $("#usern").val();
    if (pattern.test(usern) && usern != '') {
      $("#usern_error_message").hide();
      $("#usern").css("border", "2px solid #34F458");
    } else {
      $("#usern_error_message").html("Username is required");
      $("#usern_error_message").show();
      $("#usern").css("border", "2px solid #F90A0A");
      error_usern = true;
    }
  }

  function check_fname() {
    var pattern = /^[a-zA-Z]+$/;
    var fname = $("#fname").val();
    if (pattern.test(fname) && fname != '') {
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
    var pattern = /^[a-zA-Z]+$/;
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
    var pattern = /^[a-zA-Z]+$/;
    var lname = $("#lname").val();
    if (pattern.test(lname) && lname != '') {
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
    var pattern = /^[a-zA-Z0-9\s]+$/;
    var location = $("#location").val();
    if (pattern.test(location.trim()) && location != '') {
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
    if (date !== '') {
      $("#date_error_message").hide();
      $("#date").css("border", "2px solid #34F458");
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
    if (pattern.test(number) && number != '') {
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
    error_fname = false;
    error_mname = false;
    error_lname = false;
    error_location = false;
    error_date = false;
    error_number = false;

    check_usern();
    check_fname();
    check_mname();
    check_lname();
    check_location();
    check_date();
    check_number();

    if (error_usern === false && error_fname === false && error_mname === false && error_lname === false && error_location === false && error_date === false && error_number === false) {
      alert("Success!!");
      return true;
    } else {
      alert("Please Fill the form Correctly");
      return false;
    }


  });

});