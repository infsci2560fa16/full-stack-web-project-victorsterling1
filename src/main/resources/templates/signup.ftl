<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="/JS/jquery/jquery.js"></script>
    <script src="/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style>
        .motack{
            width:100%;
            height:100%;
            position: fixed;
            top: 0;
            z-index: -100;
            background-color: rgba(0,0,0,0.4);
        }

        body {
            background: url("/image/backgroud.gif") no-repeat;
            width:100%;
            height:100%;
            background-size:cover
        }

        .signupform{
            position: relative;
            text-align: left;
            text-decoration: none;
            display: block;
            margin-right: 10%;
            margin-left: 10%;
            color: #fff;
            margin-top: 10%;
            font-size: 24px;
            width: 80%;
            height: 90%;
        }



        .element{
            float: left;
            width: 50%;
            height:85px;
        }

        .element select{
            width:263px;
            height: 36px;
            color: black;
            font-size: 15px;
        }

        input[type="text"]{
            width:263px;
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

        label:hover{
            cursor: default;
        }

        label{
            font-size: 16px;
            margin-bottom: 10px;
            margin-top: 10px;
            margin-right: 250px;
        }
        #date{
            width: 100%;
        }

        #byear{
            margin-right: 10px;
            width:80px;
            height: 30px;
        }
        #bmon{
            width:80px;
            margin-right: 10px;
            height: 30px;
        }
        #bday{
            width:70px;
            height: 30px;
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

<div class="signupform">
    <div class="element">
        <label for="FName">First Name:</label>
        <input type="text" id="FName" name="FName" />
    </div>
    <div class="element">
        <label for="LName">Last Name:</label>
        <input type="text" id="LName" name="LName"/>
    </div>
    <div class="element" >
        <label>Birthday:</label>
        <div id="date">
            <select id="byear" name="year">
                <option value="#">year</option>
            </select>
            <select id="bmon" name="bmon">
                <option value="#">month</option>
            </select>
            <select id="bday" name="bday">
                <option value="#">day</option>
            </select>

        </div>
    </div>
    <div class="element">
        <label for="Gender" >Gender:</label>
        <select name="gender" id="Gender">
            <option value="true">male</option>
            <option value="false">female</option>
        </select>
    </div>
    <div class="element">
        <label for="smoke">Smoke:</label>
        <select id = "smoke" name="smoke" >
            <option value="true">smoke</option>
            <option value="false">don't smoke</option>
        </select>
    </div>
    <div class="element">
        <label for="type" >Looking for:</label>
        <select id="type" name="type">
            <option value="1">Long term relationship</option>
            <option value="2">Short term relationship</option>
            <option value="3">A night sex</option>
        </select>
    </div>
    <div class="element">
        <label for="photo">Photo url:</label>
        <p id="alter" class="alerttext">It's not a valid photo url</p>
        <input type="text" id="photo" name="photo" />
    </div>
    <div class="element">
        <label for="note">Words about yourself:</label>
        <input type="text" id="note" name="note" />
    </div>
    <div class="element">
        <input type="submit" value="Submit" onclick="submit()"/>
    </div>




</div>

<script>
    $("#alter").hide();
    var mon = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    var day = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];
    var getRecentYear = function(){
        var a = new Date();
        var year = a.getFullYear();
        var recentyears = [];
        for(var i = 0; i < 65; i++) {
            recentyears.push(year-i);
        }
        return recentyears;
    };
    var recentyears = getRecentYear();
    $.each(mon, function(key, value) {
        $('#bmon')
                .append($("<option></option>")
                        .attr("value",key+1)
                        .text(value));
    });
    $.each(recentyears, function(key, value) {
        $('#byear')
                .append($("<option></option>")
                        .attr("value",value)
                        .text(value));
    });
    $.each(day, function(key, value) {
        $('#bday')
                .append($("<option></option>")
                        .attr("value",value)
                        .text(value));
    });

    var submit = function () {
        //get all of the value
        var email=sessionStorage.getItem("email");
        var pass=sessionStorage.getItem("pass");
        sessionStorage.removeItem("email");
        sessionStorage.removeItem("pass");

        var firstname = $('#FName').val();
        var lastname = $('#LName').val();
        var byear =$('#byear').val();
        var bmon =$('#bmon').val();
        var bday =$('#bday').val();
        var gender = $('#Gender').val();
        var smoke = $('#smoke').val();
        var relationship = $('#type').val();
        var note = $('#note').val();
        var photo =$('#photo').val();
//        console.log(firstname);
//        console.log(lastname);
//        console.log("year" + byear);
//        console.log("mon" + bmon);
//        console.log("day" + bday);
//        console.log(email);
//        console.log(pass);
//        console.log(smoke);
//        console.log(note);
//        console.log(photo);
//        console.log(gender);
//        console.log(relationship);
        var user = {firstName : firstname,
            lastName: lastname,
            byear: byear,
            bmon: bmon,
            bday: bday,
            email : email,
            password: pass,
            smoke : smoke,
            note : note,
            photo: photo,
            gender: gender,
            flower:0,
            relationship:relationship};
//        var user = {"firstName" : "firstname",
//            "lastName": "lastname",
//            "byear":"2010",
//            "bmon":"12",
//            "bday":"12",
//            "email" : "victor@pitt.edu",
//            "password": "123",
//            "smoke" : "true",
//            "note" : "zzz!",
//            "photo":"sdfdf",
//            "gender": "true",
//            "flower":0,
//            "relationship":"2"};



        //interaction with server
        $.ajax({
            type: "POST",
            url: "/user",
            // The key needs to match your method's input parameter (case-sensitive).
            data: JSON.stringify(user),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(data){
                var id = data.id;
                sessionStorage.setItem("uid", id);
                location.href="/home";
            },
            failure: function(errMsg) {
                alert(errMsg);
            }
        });
    };

</script>
</body>
</html>