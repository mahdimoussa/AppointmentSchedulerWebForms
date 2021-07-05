<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="AppointmentWebForms.Welcome" %>

<link href="CSS/Welcome.css" rel="stylesheet" type="text/css" />
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>

    <div class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" runat="server">Appointment Scheduler</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a runat="server">About Us</a></li>
                <li><a runat="server">Help</a></li>
                <li><a runat="server">FAQs</a></li>
                <li style="margin-left: 340px; "><a type="button" style="background-color:#0b1d8d;color:azure"  runat="server" href="Reservations.aspx" >Go To Reservations</a></li>

            </ul>
        </div>
    </div>
</div>

    <body style="background-image: url(https://kauaidentalcare.com/wp-content/uploads/2015/12/Make-An-Appointment-Background-Img.png)" >


<div style="margin-top:100px" class="slideshow-container">

<div class="mySlides fade">
  <img src="https://blog.hubspot.com/hs-fs/hubfs/customer-service-quote-laura-ashley-3.png?width=598&name=customer-service-quote-laura-ashley-3.png" style="width:100%">
  <div class="text">Caption Text</div>
</div>

<div class="mySlides fade">
  <img src="https://blog.hubspot.com/hs-fs/hubfs/customer-service-quote-jeff-bezos.png?width=598&name=customer-service-quote-jeff-bezos.png" style="width:100%">
  <div class="text">Caption Two</div>
</div>

<div class="mySlides fade">
  <img src="https://dogtrainingobedienceschool.com/pic/8757299_full-proactive-quotes-business-customer-service-15-great-customer-service-quotes-to-inspire-you.png" style="width:100%">
  <div class="text">Caption Three</div>
</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>

</body>

    <script>
        var slideIndex = 0;
        showSlides();

        function showSlides() {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slideIndex++;
            if (slideIndex > slides.length) { slideIndex = 1 }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].className += " active";
            setTimeout(showSlides, 3500);
        }
    </script>

</html>
