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

        #note{
            float: left;
            margin-top: 10px;
            width: 100%;
            text-align: center;
        }

        #btn{
            width: 100px;
            margin:0 auto;
        }

        #btn input[type="button"]{
            width:120px;
            height: 40px;
            border-radius: 2px;
            border: none;
            color: #fff;
            background-color: pink;
        }

        #btn input[type="button"]:hover{
            background-color: plum;
            cursor: pointer;
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
        </div>



    </div>
    <div class="note">
        <p id="note"></p>
    </div>
    <div id="btn">
        <input type="button" id="flower" value="Flowers(1308)">
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
    $.ajax({
        type: "GET",
        url: "/user/"+ "${pid}"+".xml",
        success: function(data){
            //console.log(data);
            var $user = $(data).find("User");
            $("#name").html("Name: " + $user.find("firstName").text() + " " + $user.find("lastName").text());
            $("#note").html($user.find("note").text());
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
            $('#photo').attr("src",$user.find("photo").text());
            $('#flower').attr("value","Flowers("+$user.find("flower").text()+")");
        },
        dataType: "xml"
    });

    $( document ).ready(function() {
        var uid = sessionStorage.getItem("uid");
        var pid = "${pid}";
        //var uid = 11;
        console.log(uid);
        console.log(pid);
        $.ajax({
            type:"GET",
            url:"/concheck/"+uid+"/"+pid,
            success:function(data){
                console.log(data);
                if (data == true) {
                    //disable button
                    console.log("disable");
                    $("#flower").prop("disabled",true).css('background-color','plum');


                } else {

                    $("#flower").one("click",function(e){
                        var tmp = $(this).val();
                        tmp = tmp.substring(8,tmp.length-1);
                        console.log(tmp + "before");
                        tmp = Number(tmp) + 1;
                        console.log(tmp + "after");
                        $(this).val("Flowers("+ tmp+")").css('background-color','plum');
                        var con = {
                            ufrom: uid,
                            uto: pid};

                        $.ajax({
                            type: "POST",
                            url: "/connection",
                            data: JSON.stringify(con),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                //alert(data.id);
                            },
                            failure: function (errMsg) {
                                alert(errMsg);
                            }
                        });
                        $.ajax({
                            type: "POST",
                            url: "/addflower/"+pid,
                            data: JSON.stringify(con),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                //alert(data.id);
                            },
                            failure: function (errMsg) {
                                alert(errMsg);
                            }
                        });
                    })
                }
            }
        });

    });


</script>
</body>
</html>