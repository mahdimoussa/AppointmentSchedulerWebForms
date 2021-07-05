<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="AppointmentWebForms.Schedule1" %>

<link href="CSS/Schedule.css" rel="stylesheet" type="text/css" />

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" runat="server" href="~/">Appointment Scheduler</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a runat="server" href="~/AllAppointments">Appointments</a></li>
                <li><a runat="server" href="~/AllUsers">Users</a></li>
                <li><a runat="server" href="~/Schedule">Schedule</a></li>
                <li style="margin-left: 340px; "><a type="button" style="background-color:darkred;color:azure"  runat="server" href="Login.aspx" onclick="logout()">Logout</a></li>

            </ul>
        </div>
    </div>
</div>

<body style="background-image: url(https://kauaidentalcare.com/wp-content/uploads/2015/12/Make-An-Appointment-Background-Img.png)">
    <form id="form1" runat="server">
        <div style="margin-left: 200px; margin-top: 100px">
            <table>
                <tr style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode'">
                    <th style="padding:10px">Weekdays</th>
                    <th style="padding:10px">Appointment Duration</th>
                    <th style="padding:10px">Break Between Apps</th>
                    <th style="padding:10px">Number Of Apps</th>
                    <th style="padding:10px">Starting Time</th>
                </tr>
                <tr>
                    <td style=" padding:10px ;color: aliceblue; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode';">Monday</td>
                    <td>
                        <input style=" padding:10px ;background-color: transparent; color: aliceblue; margin: 4px" id="1" type="text"></td>
                    <td>
                        <input style=" padding:10px ;background-color: transparent; color: aliceblue; margin: 4px" id="2" type="text"></td>
                    <td>
                        <input style=" padding:10px ;background-color: transparent; color: aliceblue; margin: 4px" id="3" type="text"></td>
                    <td>
                        <input style=" padding:10px ;background-color: transparent; color: aliceblue; margin: 4px" id="4" type="date"></td>

                </tr>
                <tr>
                    <td style=" padding:10px ;color: aliceblue; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode';">Teusday</td>
                    <td>
                        <input style=" padding:10px ;background-color: transparent; color: aliceblue; margin: 4px" id="5" type="text"></td>
                    <td>
                        <input style=" padding:10px ;background-color: transparent; color: aliceblue; margin: 4px" id="6" type="text"></td>
                    <td>
                        <input style=" padding:10px ;background-color: transparent; color: aliceblue; margin: 4px" id="7" type="text"></td>
                    <td>
                        <input style=" padding:10px ;background-color: transparent; color: aliceblue; margin: 4px" id="8" type="date">

                </tr>
                <tr>
                    <td style=" padding:10px ;color: aliceblue; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode';">Wednesday</td>
                    <td>
                        <input style=" padding:10px ;background-color: transparent; color: aliceblue; margin: 4px" id="9" type="text"></td>
                    <td>
                        <input style=" padding:10px ;background-color: transparent; color: aliceblue; margin: 4px" id="10" type="text"></td>
                    <td>
                        <input style=" padding:10px ;background-color: transparent; color: aliceblue; margin: 4px" id="11" type="text"></td>
                    <td>
                        <input style=" padding:10px ;background-color: transparent; color: aliceblue; margin: 4px" id="12" type="date"></td>

                </tr>
                <tr>
                    <td style=" padding:10px ;color: aliceblue; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode';">Thursday</td>
                    <td>
                        <input style=" padding:10px ;background-color: transparent; color: aliceblue; margin: 4px" id="13" type="text"></td>
                    <td>
                        <input style=" padding:10px ;background-color: transparent; color: aliceblue; margin: 4px" id="14" type="text"></td>
                    <td>
                        <input style=" padding:10px ;background-color: transparent; color: aliceblue; margin: 4px" id="15" type="text"></td>
                    <td>
                        <input style=" padding:10px ;background-color: transparent; color: aliceblue; margin: 4px" id="16" type="date"></td>

                </tr>
                <tr>
                    <td style=" padding:10px ;color: aliceblue; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode';">Friday</td>
                    <td>
                        <input style=" padding:10px ;background-color: transparent; color: aliceblue; margin: 4px" id="17" type="text"></td>
                    <td>
                        <input style=" padding:10px ;background-color: transparent; color: aliceblue; margin: 4px" id="18" type="text"></td>
                    <td>
                        <input style=" padding:10px ;background-color: transparent; color: aliceblue; margin: 4px" id="19" type="text"></td>
                    <td>
                        <input style=" padding:10px ;background-color: transparent; color: aliceblue; margin: 4px" id="20" type="date"></td>

                </tr>
                

            </table>

            <br />
             
            <p1 style="color:aliceblue">* Saturdays and Sundays are OFF</p1>

            <br />
            <br />
            <br />

            <div>
                <input type="button" class="btn btn-primary" value="Submit" onclick="Submit()" />
            </div>
        </div>
    </form>
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
            if (c.indexOf(nameEQ) == 0) {
                return c.substring(nameEQ.length, c.length);
            }
            else {
                window.location.href = 'Login.aspx';
            }
        }
    }


    function Submit() {
        var AppointmentDuration;
        var BreakBetweenApps;
        var NumberOfAppointments;
        var StartingTime;
        var Id;
        var Schedule = [];


        var Monday = new Object();
        Monday.Id = 1;
        Monday.Weekdays = "Monday";
        Monday.AppointmentDuration = document.getElementById("1").value;
        Monday.BreakBetweenApps = document.getElementById("2").value;
        Monday.NumberOfAppointments = document.getElementById("3").value;
        Monday.StartingTime = document.getElementById("4").value;

        var Teusday = new Object();
        Teusday.Id = 2;
        Teusday.Weekdays = "Teusday";
        Teusday.AppointmentDuration = document.getElementById("5").value;
        Teusday.BreakBetweenApps = document.getElementById("6").value;
        Teusday.NumberOfAppointments = document.getElementById("7").value;
        Teusday.StartingTime = document.getElementById("8").value;

        var Wednesday = new Object();
        Wednesday.Id = 3;
        Wednesday.Weekdays = "Wednesday";
        Wednesday.AppointmentDuration = document.getElementById("9").value;
        Wednesday.BreakBetweenApps = document.getElementById("10").value;
        Wednesday.NumberOfAppointments = document.getElementById("11").value;
        Wednesday.StartingTime = document.getElementById("12").value;

        var Thursday = new Object();
        Thursday.Id = 4;
        Thursday.Weekdays = "Thursday";
        Thursday.AppointmentDuration = document.getElementById("13").value;
        Thursday.BreakBetweenApps = document.getElementById("14").value;
        Thursday.NumberOfAppointments = document.getElementById("15").value;
        Thursday.StartingTime = document.getElementById("16").value;

        var Friday = new Object();
        Friday.Id = 5;
        Friday.Weekdays = "Friday";
        Friday.AppointmentDuration = document.getElementById("17").value;
        Friday.BreakBetweenApps = document.getElementById("18").value;
        Friday.NumberOfAppointments = document.getElementById("19").value;
        Friday.StartingTime = document.getElementById("20").value;

        Schedule.push(Monday);
        Schedule.push(Teusday);
        Schedule.push(Wednesday);
        Schedule.push(Thursday);
        Schedule.push(Friday);

        var URL = "https://localhost:44383/api/schedule/SaveSlot";
        $.ajax({
            url: URL,
            type: 'Post',
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify(Schedule),
            success: function (response) {
                console.log(response);
            },
            error: function (error) {
                console.log(Schedule)
            }
        });
    }

</script>

</html>
