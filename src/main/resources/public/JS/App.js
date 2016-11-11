/**
 * Created by victorzhao on 11/5/16.
 */
'use strict';
$(function(){
    var data=[{
        "Fname" : "Taylor",
        "Lname" : "Swift",
        "img" :"../image/sample1.jpg",
        "gender" : "female",
        "flower" : "1308",
        "age" : "36",
        "note" : "Looking for a handsome gentleman.",
        "password" : "password1",
        "email" : "ZEZ7@pitt.edu",
        "id": 1
    },{
        "Fname" : "Yueting",
        "Lname" : "Lang",
        "img" :"../image/sample2.jpg",
        "gender" : "female",
        "flower" : "1456",
        "age" : "25",
        "note" : "Looking for a long-term relationship with a brave and responsible man.",
        "password" : "password1",
        "email" : "QIL76@pitt.edu",
        "id": 2
    },{
        "Fname" : "Robert",
        "Lname" : "Downey",
        "img" :"../image/sample3.jpg",
        "gender" : "male",
        "flower" : "56",
        "age" : "38",
        "note" : "Looking for a short-term relationship with a sexy girl.",
        "password" : "password1",
        "email" : "LIZ76@pitt.edu",
        "id": 3
    }];

    var info = document.getElementById("information");

    function sex(gender){

        if(gender == "all"){
            return data;
        }

        var temp = [];

        for(var i=0;i<data.length;i++){
            if(data[i].gender===gender){
                temp.push(data[i]);
            }
        }

        return temp;

    }

    for(var i =0;i<data.length;i++){
        $("<div class='row' id='rowinfo'><div class='col-sm-2 text-center'><img src='"+data[i].img+"' class='img-circle' height='65' width='65' alt='Avatar'></div><div class='col-sm-10'><a href='../view/sampleperson"+data[i].id+".html'>"+data[i].Fname+" "+data[i].Lname+" </a><p>"+data[i].note+"</p></div></div>").appendTo(info);
    }


    $("#btn").on("click",function(e){
        if(e.target.nodeName.toLowerCase()==="a"){
            $('#btn').find("li").removeClass("active");
            var showData=sex(e.target.getAttribute("id"));
            $(e.target).parent().addClass("active");
            info.innerHTML="";
            for(var i =0;i<showData.length;i++){
                $("<div class='row' id='rowinfo'><div class='col-sm-2 text-center'><img src='"+showData[i].img+"' class='img-circle' height='65' width='65' alt='Avatar'></div><div class='col-sm-10'><a href='../view/sampleperson"+showData[i].id+".html'>"+showData[i].Fname+" "+data[i].Lname + "</a><p>"+showData[i].note+"</p></div></div>").appendTo(info);
            }
        }
    })



});



