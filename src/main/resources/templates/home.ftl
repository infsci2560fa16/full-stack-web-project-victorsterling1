<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="/JS/jquery/jquery.js"></script>
    <script src="/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style>

        .row.content {height: 1500px}

        .sidenav {
            background-color: #f1f1f1;
            height: 100%;
        }

        @media screen and (max-width: 767px) {
            .sidenav {
                height: auto;
                padding: 15px;
            }

        }

        #rowinfo{
            padding:20px 0;
        }

        .navbar{
            margin-bottom: 0;
        }

        .sidenav{
            padding-top: 20px;
        }
        .guide{
            margin-top:10px;
            font-size: 16px;
            color: dodgerblue;
        }
        .element{
            float: left;
            width: 80%;
            margin-right: 10%;
            margin-left: 10%;
            margin-bottom: 5%;
        }

        .element select{
            color: black;
            font-size: 12px;
            width: 100%;
        }
        .element label{
            color: dodgerblue;
            width: 100%;
            font-size: 14px;
            font-weight: 300;
        }
        .element input[type="submit"]{
            margin-top: 10px;
            color: #ffffff;
            background-color: dodgerblue;
            border:none;
            border-radius: 4px;
            font-size: 12px;
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
            <li><a href="/account"> Account</a></li>
        </ul>
    </div>
</nav>

<div class="container-fluid">
    <div class="row content">
        <div class="col-sm-2 sidenav">
            <div class="element">
                <p class = "guide">Looking for...</p>
            </div>
            <div class="element">
                <label for="gender" >Gender</label>
                <select name="gender" id="gender">
                    <option value="0">All</option>
                    <option value="1">Male</option>
                    <option value="2">Female</option>
                </select>
            </div>
            <div class="element">
                <label for="smoke">Smoke</label>
                <select id = "smoke" name="smoke" >
                    <option value="0">Don't care</option>
                    <option value="1">Smoke</option>
                    <option value="2">Don't smoke</option>
                </select>
            </div>
            <div class="element">
                <label for="relationship">Type of relationship</label>
                <select id="relationship" name="relationship">
                    <option value="0">All types</option>
                    <option value="1">Long term relationship</option>
                    <option value="2">Short term relationship</option>
                    <option value="3">A night sex</option>
                </select>
            </div>
            <div class="element">
                <input type="submit" value="Submit" onclick="submit()"/>
            </div>



        </div>

        <div id="information" class="col-sm-10" >


        </div>
    </div>
</div>

<script>
    var uid = sessionStorage.getItem("uid");
    //sessionStorage.removeItem("uid");
    var info = document.getElementById("information");

    $( document ).ready(function() {
        var users;
        $.ajax({
            type: "GET",
            url: "/users",
            success: function(data){
                for(var i =0;i<data.length;i++){
                    $("<div class='row' id='rowinfo'><div class='col-sm-2 text-center'><img src='"+data[i].photo+"' class='img-circle' height='65' width='65' alt='Avatar'></div><div class='col-sm-10'><a href='/person/"+data[i].uid+"'>"+data[i].firstName+" "+data[i].lastName+" </a><p>"+data[i].note+"</p></div></div>").appendTo(info);
                }
            },
            dataType: "json"
        });
    });

    function submit(){
        var gender = $("#gender").val();
        var smoke = $("#smoke").val();
        var type = $("#relationship").val();
        info.innerHTML="";
        $.ajax({
            type: "GET",
            url: "/users",
            success: function(data){
                for(var i =0;i<data.length;i++){
                    if(data[i].gender == true) {
                        data[i].gender = 1;
                    } else {
                        data[i].gender = 2;
                    }
                    if (data[i].smoke == true) {
                        data[i].smoke = 1;
                    } else {
                        data[i].smoke = 2;
                    }

                    if(gender == 0 || (gender == data[i].gender)) {
                        if (smoke == 0 || (smoke == data[i].smoke)) {
                            if (type == 0 || (type == data[i].relationship)){
                                $("<div class='row' id='rowinfo'><div class='col-sm-2 text-center'><img src='"+data[i].photo+"' class='img-circle' height='65' width='65' alt='Avatar'></div><div class='col-sm-10'><a href='/person/"+data[i].uid+"'>"+data[i].firstName+" "+data[i].lastName+" </a><p>"+data[i].note+"</p></div></div>").appendTo(info);
                            }
                        }
                    }
                               }
            },
            dataType: "json"
        });

    }

</script>
</body>
</html>