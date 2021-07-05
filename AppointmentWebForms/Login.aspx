<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AppointmentWebForms.Login" %>

<link href="CSS/Login.css" rel="stylesheet" type="text/css" />

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title></title>
</head>
<body>
    <form id="form1" runat="server" >
        <div class="body"></div>
        <div class="grad"></div>
        <div class="header">
            <div>Appointment<span>Scheduler</span></div>
        </div>
        <br>
        <div class="login">
            <input type="text" placeholder="Username" id="txtUserName" name="user" required><br>
            <input type="password" placeholder="Password" id="txtPassword" name="password" required><br><br>
            <input type="submit" class="btn btn-primary" value="Login"  onclick="Login();">
            <br />
            <br />
            <a href="Register.aspx" style="font-family: 'Exo', sans-serif">You don't have an account? Click here to Register</a>



        </div>
    </form>
</body>
<script>

    $(document).ready(function () {
        $('#form1').on("submit", function (evt) {
            evt.preventDefault();
        });
    });

    function SetCookie(cname, cvalue, exdays) {
        var d = new Date();
        d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
        var expires = "expires=" + d.toGMTString();
        document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
    }

    function Login() {
        var UserName = document.getElementById("txtUserName").value;
        var Password = document.getElementById("txtPassword").value;


        var UserModel = new Object();
        UserModel.Username = UserName;
        UserModel.Password = Password;

        var URL = "https://localhost:44383/api/Authenticate/login";
        $.ajax({
            url: URL,
            type: 'POST',
            data: JSON.stringify(UserModel),
            contentType: "application/json",
            success: function (response) {
                if (response.success) {

                    SetCookie('Appointment_token', response.token, 100);
                    alert("You are logged in ! Press OK to continue.")
                    window.location.href = 'Default.aspx';
                } else {
                    alert(response.message)
                }
            },
            error: function (error) {
                console.log(error)
            }
        });
    }
    function getCookie(name) {
        var dc = document.cookie;
        var prefix = name + "=";
        var begin = dc.indexOf("; " + prefix);
        if (begin == -1) {
            begin = dc.indexOf(prefix);
            if (begin != 0) return null;
        }
        else {
            begin += 2;
            var end = document.cookie.indexOf(";", begin);
            if (end == -1) {
                end = dc.length;
            }
        }

        return decodeURI(dc.substring(begin + prefix.length, end));
    }

</script>
</html>
