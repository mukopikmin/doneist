'use strict'

###*
 # @ngdoc function
 # @name doneistApp.controller:SignoutCtrl
 # @description
 # # SignoutCtrl
 # Controller of the doneistApp
###
angular.module 'doneistApp'
  .controller 'SignoutCtrl', ($location, $rootScope, Todoist, Token) ->

    Todoist.revokeToken(Token.get())
      .then (response) ->
        Token.remove()
        $rootScope.user = null
        $location.path '/'

    return
