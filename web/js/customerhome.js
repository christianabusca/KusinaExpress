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
});