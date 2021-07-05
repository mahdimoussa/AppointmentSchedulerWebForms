<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="AppointmentWebForms.Register" %>

<link href="CSS/Register.css" rel="stylesheet" type="text/css" />

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="body"></div>
        <div class="grad"></div>
        <div class="header">
            <div>Appointment<span>Scheduler</span></div>
        </div>
        <br>
        <div class="login">
            <input type="text" placeholder="Username" id="txtUserName" name="user" required>
            <br />
            <br />
            <input type="text" placeholder="Email" id="txtEmail" name="email" required>
            <br />
            <input type="password" placeholder="Password" id="txtPassword" name="password" required>
            <br />
            <input type="password" placeholder="Password Confirmation" id="txtPasswordConfirmation" name="passwordconfirmation" required>
            <br />
            <br />

            <input type="submit" class="btn btn-primary" value="Register" onclick="Register();">
            <br />
            <br />
            <a href="Login.aspx" style="font-family: 'Exo', sans-serif">Go Back</a>
        </div>
    </form>
</body>
<script>
    $(document).ready(function () {
        $('#form1').on("submit", function (evt) {
            evt.preventDefault();
        });
    });

    function Register() {
        var UserName = document.getElementById("txtUserName").value;
        var Email = document.getElementById("txtEmail").value;
        var Password = document.getElementById("txtPassword").value;
        var PasswordConfirmation = document.getElementById("txtPasswordConfirmation").value;

        var UserModel = new Object();
        UserModel.Username = UserName;
        UserModel.Email = Email;
        UserModel.Password = Password;

        var URL = "https://localhost:44383/api/Authenticate/register";


        if (Password != PasswordConfirmation) {
            alert("Invalid Credentials !");
        }

        else {
            $.ajax({
                url: URL,
                type: 'POST',
                data: JSON.stringify(UserModel),
                contentType: "application/json",
                success: function (response) {
                    if (response.success) {
                        alert(response.message)
                        window.location.href = 'Login.aspx'
                    }
                //    alert('You Are Successfully Registered !');
                },
                error: function (error) {

                    alert(response.message)
                }
            });
        }

       
    }

</script>
</html>
