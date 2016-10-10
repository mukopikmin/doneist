'use strict'

###*
 # @ngdoc function
 # @name doneistApp.controller:IndexCtrl
 # @description
 # # IndexCtrl
 # Controller of the doneistApp
###
angular.module 'doneistApp'
  .controller 'IndexCtrl', ($scope, $mdSidenav, $location, Token, Todoist) ->

    token = Token.get()
    if token
      Todoist.getUser(token)
        .then (user) ->
          $scope.user = user

    Todoist.getConfig()
      .then (config) ->
        $scope.authLink = "https://todoist.com/oauth/authorize?client_id=#{config.client_id}&scope=#{config.scope}&state=#{config.state}"

    $scope.toggleLeft = ->
      $mdSidenav('left').toggle()

    $scope.goto = (destination) ->
      $scope.toggleLeft()
      $location.path(destination)

    return
