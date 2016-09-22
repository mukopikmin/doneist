'use strict'

###*
 # @ngdoc function
 # @name doneistApp.controller:SignoutCtrl
 # @description
 # # SignoutCtrl
 # Controller of the doneistApp
###
angular.module 'doneistApp'
  .controller 'SignoutCtrl', ($location, Todoist, Token) ->

    Todoist.revokeToken()
      .then (response) ->
        $location.path '/'
        Token.remove()

    return
