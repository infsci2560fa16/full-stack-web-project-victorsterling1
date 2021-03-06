<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cupid</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="JS/jquery/jquery.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style>
        body {
            background: url("/image/backgroud.gif") no-repeat;
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

        input[type="password"]{
            margin-right: 100px;
            width:250px;
            height: 30px;
            color: black;
            font-size: 15px;
        }
        input[type="email"]{
            width:250px;
            height: 30px;
            margin-right: 20px;
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
        .logotext{
            margin-left: 35px;
            color: rgb(255,56,102);
        }
        .alerttext{
            color: red;
            font-size: 16px;
            margin-bottom: 0;

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
            <li><a href="/login"><span class="glyphicon"></span> Login</a></li>
        </ul>
    </div>
</nav>

<div class="motack"></div>
<div class="logotext">
    <h3>Let's date</h3>
    <p>Find your soul-mate here.</p>
</div>
<div class="loginform" >
    <label for="email" class="logintext">Email Address:</label>
    <p id="alter1" class="alerttext">It's not a valid email</p>
    <p id="alter2" class="alerttext">This email has been used</p>
    <input id="email" placeholder="name@pitt.edu" type="email" />
    <label for="password" class="longintext">Password:</label>
    <input type="password" id="password" placeholder="Password" maxlength="18"/>
    <input type="submit" value="Sign Up" onclick="checksubmit()"/>
</div>
<script>
    var checksubmit = function () {
        //get value from client
        var email = $('#email').val();
        var pass = $('#password').val();
        var re = new RegExp(".*(@pitt.edu)$");

        if (re.test(email)) {//check if the email address is a pitt email
            $("#alter1").hide();
            //interaction with server
            $.get("/check?email="+email, function(data, status){
                if (data == true) {
                    $("#alter2").hide();
                    sessionStorage.setItem("email", email);
                    sessionStorage.setItem("pass", pass);
                    location.href='/signup';

                } else {
                    $("#alter2").show();
                }

            });

        } else {
            $("#alter1").show();

        }
    };
    $(".alerttext").hide();
</script>

</body>
</html>