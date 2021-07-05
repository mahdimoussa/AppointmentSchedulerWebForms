<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AppointmentWebForms._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div style="margin-top:160px; margin-left:100px">
       <p1 style="font-size:50px; color:darkgray ">Welcome To The Admin Panel. </p1>
    </div>

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


    </script>

</asp:Content>
