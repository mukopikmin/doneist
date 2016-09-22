'use strict'

###*
 # @ngdoc service
 # @name doneistApp.service/token
 # @description
 # # service/token
 # Service in the doneistApp.
###
angular.module 'doneistApp'
  .service 'Token', ($cookies) ->

    key = 'doneist-token'
    expires = new Date()
    expires.setMonth(expires.getMonth() + 3)
    options =
      expires: expires

    get: ->
      $cookies.get key

    set: (token) ->
      $cookies.put key, token, options

    remove: ->
      $cookies.remove key
