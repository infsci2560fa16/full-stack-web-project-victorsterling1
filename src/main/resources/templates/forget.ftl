<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Password Service</title>
    <link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/stylesheets/index.css">
    <script src="/JS/jquery/jquery.js"></script>
    <script src="/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style>

        body {
            background: url("../image/backgroud.gif") no-repeat;
            width:100%;
            height:100%;
            background-size:cover
        }

        .motack{
            width:100%;
            height:100%;
            position: fixed;
            top: 0;
            z-index: -100;
            background-color: rgba(0,0,0,0.4);
        }



        .loginform{
            position: relative;
            float: right;
            text-align: left;
            text-decoration: none;
            display: block;
            margin-right: 10%;
            color: #fff;
            margin-top: 10%;
            font-size: 24px;
            width: 30%;
            height: 30%;
        }


        label:hover{
            cursor: default;
        }

        label{
            font-size: 20px;
            margin-bottom: 10px;
            margin-top: 10px;
        }

        input[type="email"]{
            width:250px;
            height: 30px;
            color: black;
            font-size: 15px;
        }
        input[type="submit"] {
            margin-top: 10px;
            color: #ffffff;
            background-color: rgb(255,56,102);
            border:none;
            border-radius: 4px;
            font-size: 20px;

        }


        #result{
            color: rgb(255,56,102);
            font-size: 18px;
            position: relative;
            float: right;
            text-align: left;
            text-decoration: none;
            display: block;
            margin-right: 10%;
            margin-top: 10%;
            width: 30%;
            height: 30%;
        }

        .logotext{
            margin-left: 35px;
            color: rgb(255,56,102);
        }

    </style>
</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/index">Cupid</a>
        </div>

        <ul class="nav navbar-nav navbar-right">
            <li><a href="/index"><span class="glyphicon"></span> Sign Up</a></li>
        </ul>
    </div>
</nav>

<div class="motack"></div>
<div class="logotext">
    <h3>Let's date</h3>
    <p>Find your soul-mate here.</p>
</div>
<p id="result" >The password has been sent to the email address.</p>
<div class="loginform" >
    <label for="email" class="logintext">Email Address:</label>
    <input id="email" placeholder="name@pitt.edu" type="email" />
    <input type="submit" value="Submit" onclick="checksubmit()"/>
</div>
<script>
    var checksubmit = function () {
        var email = $('#email').val();
        var re = new RegExp(".*(@pitt.edu)$");
        if (email == null || !re.test(email)) {
            alert("Please enter a valid email address");
        } else {
            $("#result").show();
            $(".loginform").hide();
        }
    };
    $("#result").hide();
</script>
</body>
</html>