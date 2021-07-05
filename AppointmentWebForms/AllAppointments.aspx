<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllAppointments.aspx.cs" Inherits="AppointmentWebForms.AllAppointments" %>

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

<div style="margin-left: 20px; margin-top: 60px">
    <h3 style="color: #ffffff">List Of Appointments:</h3>
</div>
<body style="background-image: url(https://kauaidentalcare.com/wp-content/uploads/2015/12/Make-An-Appointment-Background-Img.png)" onload="GetAllAppointments()">
    <form id="form1" runat="server">
        <div>
            <div>
                <div class="panel-body">
                    <table class="table table-bordered" id="Table">
                        <tr style="color: aliceblue; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif">
                            <th style="background-color:#4863A0">First Name</th>
                            <th style="background-color:#4863A0">Middle Name</th>
                            <th style="background-color:#4863A0">Last Name</th>
                            <th style="background-color:#4863A0">Mobile</th>
                            <th style="background-color:#4863A0">Email</th>
                            <th style="background-color:#4863A0">Date</th>
                            <th style="background-color:#4863A0">Start Time</th>
                            <th style="background-color:#4863A0">End Time</th>
                            <th style="background-color:#4863A0">Duration</th>
                            <th style="background-color:#4863A0">Modify</th>
                        </tr>
                    </table>
                </div>
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
            if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
        }
        return null
    }

    function DeleteAppointment(Id) {
        var URL = "https://localhost:44383/api/appointments/DeleteAppointment?Id=" + Id;
        $.ajax({
            url: URL,
            type: 'DELETE',
            contentType: "application/json",
            success: function (response) {
                console.log(response);
            },
            error: function (error) {
                console.log(error)
            }
        });
    }

    function GetAllAppointments() {

        var URL = "https://localhost:44383/api/appointments/GetAllAppointments";
        $.ajax({
            url: URL,
            type: 'GET',
            contentType: "application/json",

            success: function (data) {
                $("#DIV").html('');
                var DIV = '';
                $.each(data, function (i, item) {
                    var rows = "<tr>" +
                        "<td id='FirstName' style='color:#FFFFFF'>" + item.firstName + "</td>" +
                        "<td id='MiddleName' style='color:#FFFFFF'>" + item.middleName + "</td>" +
                        "<td id='LastName' style='color:#FFFFFF'>" + item.lastName + "</td>" +
                        "<td id='Mobile' style='color:#FFFFFF'>" + item.mobile + "</td>" +
                        "<td id='Email' style='color:#FFFFFF'>" + item.email + "</td>" +
                        "<td id='Date' style='color:#FFFFFF'>" + item.date + "</td>" +
                        "<td id='StartTime' style='color:#FFFFFF'>" + item.startTime + "</td>" +
                        "<td id='EndTime' style='color:#FFFFFF'>" + item.endTime + "</td>" +
                        "<td id='Duration' style='color:#FFFFFF'>" + item.duration + "</td>" +
                        "<td style='width:10px'><button class='btn btn-danger' onclick='DeleteAppointment(" + item.id + ")'>Delete</button></td>" +
                        "</tr>";
                    $('#Table').append(rows);
                });
            },
            error: function (error) {
                window.location.href='Login.aspx';
            }
        });
    }
</script>
</html>
