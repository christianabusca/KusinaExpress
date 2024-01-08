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

    
});