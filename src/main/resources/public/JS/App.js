/**
 * Created by victorzhao on 11/5/16.
 */
'use strict';
var DCtrl = angular.module('DataService',[]);

DCtrl.controller("DataCtrl", function($scope){
    var mon = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    var day = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];
    var obj={"Jan":31, "Feb":29, 'Mar':31,'Apr':30,'May':31,'Jun':30,'Jul':31,'Aug':31,'Sep':30,
        'Oct':31,'Nov':30,'Dec':31};
    $scope.numLimit = obj[$scope.bmon];
    $scope.months = mon;
    $scope.days = day;
    var getRecentYear = function(){
        var a = new Date();
        var year = a.getFullYear();
        var recentyears = [];
        for(var i = 0; i < 65; i++) {
            recentyears.push(year-i);
        }
        return recentyears;
    };
    $scope.years = getRecentYear();


    $scope.updateDays = function() {
        $scope.numLimit = obj[$scope.bmon];
        //console.log($scope.numLimit);
    };



});
