<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Log in</title>
    <link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/stylesheets/index.css">
    <script src="/JS/jquery/jquery.js"></script>
    <script src="/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
            margin-right: 100px;
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

        .alerttext{
            color: red;
            font-size: 16px;
            margin-bottom: 0;

        }

        .logotext{
            margin-left: 35px;
            color: rgb(255,56,102);
        }
        .forgetpass{
            display: block;
            font-size: 16px;
            text-decoration: underline;
            color: black;
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
<div class="loginform" >
    <label for="email" class="logintext">Email Address:</label>
    <p id="alert1" class="alerttext">It's not a valid email</p>
    <input id="email" placeholder="name@pitt.edu" type="email" />
    <label for="password" class="longintext">Password:</label>
    <p id="alert2" class="alerttext">The password doesn't match the account</p>
    <input type="password" id="password" placeholder="Password" maxlength="18"/>
    <a href="/forget" class="forgetpass">Forget password?</a>
    <input type="submit" value="Log In" onclick="checksubmit()"/>
</div>
<script>
    var checksubmit = function () {
        //checking all the stuff
        var email = $('#email').val();
        var pass = $('#password').val();
        var re = new RegExp(".*(@pitt.edu)$");
        if (re.test(email)) {//check if the email address is a pitt email
            $("#alert2").hide();
            $("#alert1").hide();
            var user = {
                email : email,
                password: pass};
            $.ajax({
                type: "POST",
                url: "/checkuser",
                data: JSON.stringify(user),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(data){
                    id = data.id;
                    //alert(id);
                    if (id == 0) {
                        $("#alert2").show();
                    } else {
                        sessionStorage.setItem("uid", id);
                        location.href="/home";
                    }

                },
                failure: function(errMsg) {
                    alert(errMsg);
                }
            });
        } else {
            $("#alert1").show();
        }

    };
    $(".alerttext").hide();
</script>
</body>
</html>