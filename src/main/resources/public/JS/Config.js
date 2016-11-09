/**
 * Created by victorzhao on 11/5/16.
 */
'use strict';
var myapp = angular.module('CupidApp', ['ngRoute','DataService']);

myapp.config(['$routeProvider', function($routeProvider){
    $routeProvider.
    when('/welcome/',{
        templateUrl:'welcome.html'
        //controller: 'DataCtrl'
    }).
    when('/person/sample',{
        templateUrl:'sampleperson.html'
        //controller: 'DataCtrl'
    }).
    when('/home/',{
        templateUrl:'home.html'
        //controller: 'DataCtrl'
    }).
    when('/login/',{
        templateUrl:'login.html'
        //controller: 'DataCtrl'
    }).
    when('/signup/',{
        templateUrl:'signup.html',
        controller: 'DataCtrl'
    }).
    otherwise({
        redirectTo :'/welcome/'
    });
}]);