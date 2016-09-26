'use strict'

###*
 # @ngdoc function
 # @name doneistApp.controller:IndexCtrl
 # @description
 # # IndexCtrl
 # Controller of the doneistApp
###
angular.module 'doneistApp'
  .controller 'IndexCtrl', ($scope, Todoist) ->

    Todoist.getUser()
      .then (user) ->
        $scope.user = user

    Todoist.getConfig()
      .then (config) ->
        $scope.authLink = "https://todoist.com/oauth/authorize?client_id=#{config.client_id}&scope=#{config.scope}&state=#{config.state}"

    return
