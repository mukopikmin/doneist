'use strict'

###*
 # @ngdoc function
 # @name doneistApp.controller:AuthorizedCtrl
 # @description
 # # AuthorizedCtrl
 # Controller of the doneistApp
###
angular.module 'doneistApp'
  .controller 'AuthorizedCtrl', ($routeParams, $rootScope, $location, Token, Todoist) ->

    Token.set $location.search()['token']

    Todoist.getUser(Token.get())
      .then (user) ->
        $rootScope.user = user
        $location.path('/').search({})

    return
