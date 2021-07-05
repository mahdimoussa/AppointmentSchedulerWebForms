<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reservations.aspx.cs" Inherits="AppointmentWebForms.Reservations" %>

<link href="CSS/Reservations.css" rel="stylesheet" type="text/css" />

<!DOCTYPE html>
<link href='https://fonts.googleapis.com/css?family=Ubuntu:400,500,700' rel='stylesheet' type='text/css'>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<form id="form1" runat="server">
    <div>
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" runat="server">Weekly Schedule</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li style="margin-left: 650px;"><a type="button" style="background-color: #0b1d8d; color: azure" runat="server" href="Welcome.aspx">Back</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</form>
<body style="background-image: url(https://kauaidentalcare.com/wp-content/uploads/2015/12/Make-An-Appointment-Background-Img.png)">

    <table style="margin-top: 50px">
        <tr style="height: 50px">
            <th>&nbsp;&nbsp;Mon</th>
            <th>&nbsp;&nbsp;Tue</th>
            <th>&nbsp;&nbsp;Wed</th>
            <th>&nbsp;&nbsp;Thu</th>
            <th>&nbsp;&nbsp;Fri</th>
        </tr>
        <tr style="height: 550px">
            <td id="myBtn1" class="day" onclick="tdclick(event)"><span class="number">1</span></td>
            <td id="myBtn2" class="day" onclick="tdclick(event)"><span class="number">2</span></td>
            <td id="myBtn3" class="day" onclick="tdclick(event)"><span class="number">3</span></td>
            <td id="myBtn4" class="day" onclick="tdclick(event)"><span class="number">4</span></td>
            <td id="myBtn5" class="day" onclick="tdclick(event)"><span class="number">5</span></td>
        </tr>

    </table>


    <div onload="GetSchedule();" id="myModal1" class="modal">
        <div style="margin-top:60px" class="modal-content">
            <span class="close">&times;</span>
            <p>Monday Available Appointments:</p>
            <div class="panel-body">
                    <table class="table table-bordered" id="Table">
                        <tr style="color: aliceblue; font-family: 'Franklin Gothic Medium', 'Arial Narrow'">
                            <th style="background-color: #4863A0">Weekdays</th>
                            <th style="background-color: #4863A0">NumberOfAppointments</th>
                            <th style="background-color: #4863A0">StartingTime</th>
                            <th style="background-color: #4863A0">BreakBetweenApps</th>
                            <th style="background-color: #4863A0">AppointmentDuration</th>
                        </tr>
                    </table>
                </div>
            </div>
     </div>       

        <div id="myModal2" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <p>Tuesday Available Appointments:</p>
            </div>
        </div>

    <div id="myModal3" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <p>Wednesday Available Appointments:</p>
        </div>
    </div>

    <div id="myModal4" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <p>Thursday Available Appointments:</p>
        </div>
    </div>

    <div id="myModal5" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <p>Friday Available Appointments:</p>
        </div>
    </div>

</body>
<script>
    $.ajaxSetup({
        headers: {
            Authorization: 'Bearer ' + ReadCookie("Appointment_token"),
            'Accept': 'application/json',
        },
        beforeSend: function (xhr) {
            xhr.setRequestHeader("Accept", "application/vvv.website+json;version=1");
        }
    });

    function ReadCookie(cname) {
        var nameEQ = cname + "=";
        var ca = document.cookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') c = c.substring(1, c.length);
            if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
        }
        return null
    }

    var modal1 = document.getElementById("myModal1");
    var modal2 = document.getElementById("myModal2");
    var modal3 = document.getElementById("myModal3");
    var modal4 = document.getElementById("myModal4");
    var modal5 = document.getElementById("myModal5");


    var btn1 = document.getElementById("myBtn1");
    var btn2 = document.getElementById("myBtn2");
    var btn3 = document.getElementById("myBtn3");
    var btn4 = document.getElementById("myBtn4");
    var btn5 = document.getElementById("myBtn5");



    var span = document.getElementsByClassName("close")[0];

    btn1.onclick = function () {
        modal1.style.display = "block";
        GetSchedule();

    }
    btn2.onclick = function () {
        modal2.style.display = "block";
    }
    btn3.onclick = function () {
        modal3.style.display = "block";
    }
    btn4.onclick = function () {
        modal4.style.display = "block";
    }
    btn5.onclick = function () {
        modal5.style.display = "block";
    }

    span.onclick = function () {
        modal.style.display = "none";
    }

    window.onclick = function (event) {
        if (event.target == modal1) {
            modal1.style.display = "none";
        }
        if (event.target == modal2) {
            modal2.style.display = "none";
        }
        if (event.target == modal3) {
            modal3.style.display = "none";
        }
        if (event.target == modal4) {
            modal4.style.display = "none";
        }
        if (event.target == modal5) {
            modal5.style.display = "none";
        }
    }
    function GetSchedule() {

        var URL = "https://localhost:44383/api/schedule/GetSchedule";
        $.ajax({
            url: URL,
            type: 'GET',
            contentType: "application/json",

            success: function (data) {
                $("#DIV").html('');
                var DIV = '';
                $.each(data, function (i, item) {
                    var rows = "<tr>" +
                        "<td id='Weekdays' style='color:#000000'>" + item.weekdays + "</td>" +
                        "<td id='NumberOfAppointments' style='color:#000000'>" + item.numberOfAppointments + "</td>" +
                        "<td id='StartingTime' style='color:#000000'>" + item.startingTime + "</td>" +
                        "<td id='BreakBetweenApps' style='color:#000000'>" + item.breakBetweenApps + "</td>" +
                        "<td id='AppointmentDuration' style='color:#000000'>" + item.appointmentDuration + "</td>" +
                        "</tr>";

                    $('#Table').append(rows);
                    console.log(item);


                });
            },
            error: function (error) {
            }
        });

    }


</script>

</html>
