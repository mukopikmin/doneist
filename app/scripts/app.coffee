'use strict'

###*
 # @ngdoc overview
 # @name doneistApp
 # @description
 # # doneistApp
 #
 # Main module of the application.
###
angular
  .module 'doneistApp', [
    'ngAnimate',
    'ngAria',
    'ngCookies',
    'ngMessages',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'ui.calendar'
  ]
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
        controllerAs: 'main'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
        controllerAs: 'about'
      .when '/calendar',
        templateUrl: 'views/calendar.html'
        controller: 'CalendarCtrl'
        controllerAs: 'calendar'
      .when '/list',
        templateUrl: 'views/list.html'
        controller: 'ListCtrl'
        controllerAs: 'list'
      .otherwise
        redirectTo: '/'
