<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Personl Page</title>
    <link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="/JS/jquery/jquery.js"></script>
    <script src="/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style>
        body {
            background: url("/image/bg3.jpg") no-repeat;
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
            background-color: rgba(255,255,255,0.6);
        }

        #mainbody{
            width: 100%;
            padding-top: 50px;
        }

        #picture{
            width:100%;
        }

        #info{
            width: 80%;
            margin-top: 10px;

        }

        #picture img{
            display: block;
            width: 300px;
            border-radius: 10px;
            margin: 0 auto;
        }

        #info p{
            text-align: left;
            font-size: 18px;
        }




        .content span{
            font-size: 20px;
            margin-right:20px;
            color: #bbb;
        }

        .note{
            float: left;
            width: 60%;
            margin-left:20%;
            border-top: 1px solid #000;
            margin-top: 10px;
        }

        #note p{
            float: left;
            margin-top: 5px;
            width: 100%;
            text-align: center;
        }




        .left{
            float: left;
            width: 50%;
            margin-left: 30%;
        }
        .right{
            float: left;
            width: 20%;

        }



    </style>
</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/home">Cupid</a>
        </div>

        <ul class="nav navbar-nav navbar-right">
            <li><a href="/account"><span class="glyphicon"></span> Account</a></li>
        </ul>
    </div>
</nav>
<div class="motack"></div>
<div id="mainbody">
    <div id="picture"><img id="photo" src="#" alt=""></div>
    <div id="info">
        <div class="left">
            <p id="name">Name</p>
            <p id="age">Age</p>
            <p id="type">Looking for</p>
        </div>
        <div class="right">
            <p id="gender">Gender</p>
            <p id="smoke">Smoke</p>
            <p id="flower">Flower</p>
        </div>



    </div>
    <div id="note" class="note">


    </div>

</div>
<script>
    function calAge(byear, bmon, bday) {
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth()+1; //January is 0!
        var yyyy = today.getFullYear();
        var res = yyyy - byear;
        if (mm <= bmon) {
            if ( mm == bmon ) {
                if ( dd <= bday) {
                    res -= 1;
                }
            } else {
                res -= 1;
            }
        }
        return res;
    }
    var uid = sessionStorage.getItem("uid");
    //var uid = 11;
    $.ajax({
        type: "GET",
        url: "/user/"+ uid+".xml",
        success: function(data){
            //console.log(data);
            var $user = $(data).find("User");
            $("#name").html("Name: " + $user.find("firstName").text() + " " + $user.find("lastName").text());
            var age = calAge($user.find("byear").text(),
                    $user.find("bmon").text(),
                    $user.find("bday").text());
            var gender, smoke, type;
            if ($user.find("gender").text() == true) {
                gender = "Male";
            } else {
                gender = "Female";
            }
            if ($user.find("smoke").text() == true) {
                smoke = "Yes";
            } else {
                smoke = "No";
            }
            if ($user.find("relationship").text() == 1) {
                type = "Long term relationship";
            } else if ($user.find("relationship").text() == 2) {
                type = "Short term relationship";
            } else {
                type = "A night sex"
            }
            $("#gender").html("Gender: " + gender);
            $("#age").html("Age: " + age);
            $("#smoke").html("Smoke: " + smoke);
            $("#type").html("Looking for: " + type);
            $("#flower").html("Flower: " + $user.find("flower").text());
            $('#photo').attr("src",$user.find("photo").text());

        },
        dataType: "xml"
    });

    $( document ).ready(function() {
        var info = document.getElementById("note");
        $.ajax({
            type:"GET",
            url:"/list/"+uid,
            success:function(data){
                if (data.empty == false) {
                    var users = data.users;
                    for (var i=0; i< users.length; i++) {
                        var user = users[i];
                        $("<p><a href = '/person/"+user.uid+"'>"+ user.firstName+" "+ user.lastName+"</a> sent you a flower. Email: "+ user.email+"</p>").appendTo(info);
                    }
                }



            }
        });

    });


</script>
</body>
</html>