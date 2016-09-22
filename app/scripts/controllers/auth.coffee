'use strict'

###*
 # @ngdoc function
 # @name doneistApp.controller:AuthCtrl
 # @description
 # # AuthCtrl
 # Controller of the doneistApp
###
angular.module 'doneistApp'
  .controller 'AuthCtrl', ($scope, Todoist) ->

    Todoist.getConfig()
      .then (config) ->
        $scope.config = config

    return
