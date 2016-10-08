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
    'ui.calendar',
    'ngMaterial',
    'materialCalendar'
  ]
  .config ($routeProvider, $mdIconProvider, $mdThemingProvider) ->
    $routeProvider
      .when '/calendar',
        templateUrl: 'views/calendar.html'
        controller: 'CalendarCtrl'
        controllerAs: 'calendar'
      .when '/list',
        templateUrl: 'views/list.html'
        controller: 'ListCtrl'
        controllerAs: 'list'
      .when '/authorized',
        templateUrl: 'views/authorized.html'
        controller: 'AuthorizedCtrl'
        controllerAs: 'authorized'
      .when '/auth',
        templateUrl: 'views/auth.html'
        controller: 'AuthCtrl'
        controllerAs: 'auth'
      .when '/signout',
        templateUrl: 'views/signout.html'
        controller: 'SignoutCtrl'
        controllerAs: 'signout'
      .otherwise
        redirectTo: '/list'
    # $mdIconProvider.fontSet('ionic', 'ionicons')

    # $mdThemingProvider
    #   .theme('default')
    #   .primaryPalette('indigo')
    #   .accentPalette('pink')
    #   .warnPalette('red')
    #   .backgroundPalette('blue-grey')
