'use strict'

###*
 # @ngdoc function
 # @name doneistApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the doneistApp
###
angular.module 'doneistApp'
  .controller 'AboutCtrl', ($rootScope) ->

    $rootScope.location = 'about'

    return
