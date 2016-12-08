<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cupid</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="/JS/jquery/jquery.js"></script>
    <style>
        body {
            background: url("/image/bg3.jpg") no-repeat;
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

        .show{
            float: left;
            width: 29%;
            margin: 10px 2%;
            padding-bottom: 20px;
        }

        .show div p{
            text-align: center;
        }

        .showphoto{
            width: 200px;
            height: 300px;
        }
        .shownote{
            text-align: left;
            font-size: 24px;
            font-weight: bold;
            color: deeppink;
        }
        .text{
            float: left;
            margin:auto 0;
            width: 100%;
            text-align:center;
            font-weight: bold;
            font-size: 35px;
        }
        #head{
            text-align:center;
            margin:auto 0;
        }
        #alert{
            color: red;
            font-size: 20px;
        }
        input[type="button"]{
            border:none;
            border-radius: 4px;
            color: #ffffff;
            background-color: rgb(255,56,102);
        }
        #yes{
            margin-right: 150px;
        }
    </style>

</head>
<body>
<div class="motack"></div>
<div id="head">
<#list users as user>
    <div class="show">
        <div>
            <img class="showphoto" src="${user.photo}" alt="">
        </div>
        <div>
            <p class="shownote">${user.note}</p>
        </div>
    </div>
</#list>
</div>
<#assign test= "victor@pitt.edu">


<div class="text">
    <p>This web app is only for students at University of Pittsburgh.</p>
    <p>Are you a PITT student?</p>

    <#if pitt == 0>
        <input id="yes" type="button" value="Yes" onclick="location.href='/1'"/>
        <input id="no" type="button" value="No" onclick="location.href='/2'"/>
    <#elseif pitt == 1>
        <a href="/index">click here to enter</a>
    <#elseif pitt == 2>
        <p id = "alert">Sorry, this web app is for pitt students only!</p>
    </#if>

</div>

</body>
</html>