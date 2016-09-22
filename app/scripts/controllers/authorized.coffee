'use strict'

###*
 # @ngdoc function
 # @name doneistApp.controller:AuthorizedCtrl
 # @description
 # # AuthorizedCtrl
 # Controller of the doneistApp
###
angular.module 'doneistApp'
  .controller 'AuthorizedCtrl', ($routeParams, $location, Token) ->

    Token.set $location.search()['token']
    console.log Token.get()

    $location.path('/list').search({})

    return
