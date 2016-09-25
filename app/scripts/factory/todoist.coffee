'use strict'

###*
 # @ngdoc service
 # @name doneistApp.todoist
 # @description
 # # todoist
 # Factory in the doneistApp.
###
angular.module 'doneistApp'
  .factory 'Todoist', ($http, $q, Token) ->

    # api = 'http://localhost:4567/api'
    api = '/api'

    revokeToken: ->
      params = {
        token: Token.get()
      }
      $q (resolve, reject) ->
        $http.post "#{api}/revoke_token", params
          .success (response) ->
            resolve response
          .error (error) ->
            reject error

    getConfig: ->
      $q (resolve, reject) ->
        $http.get "#{api}/auth_config"
          .success (response) ->
            resolve response
          .error (error) ->
            reject error

    getCompletedTasks: (seq) ->
      $q (resolve, reject) ->
        $http.get "#{api}/completed?token=#{Token.get()}"
          .success (response) ->
            response.items.map (item) ->
              item.title = item.content
              item.start = new Date item.completed_date
            resolve response
          .error (error) ->
            reject error

    getProjects: ->
      $q (resolve, reject) ->
        $http.get "#{api}/projects?token=#{Token.get()}"
          .success (response) ->
            # console.log response
            # projects = response.Projects.sort (a, b) ->
            #   if a.item_order > b.item_order
            #     return 1
            #   else if a.item_order < b.item_order
            #     return -1
            #   else
            #     return 0
            resolve response.projects
          .error (error) ->
            reject error

    getColors: ->
      $q (resolve, reject) ->
        $http.get "#{api}/colors"
          .success (response) ->
            resolve response
          .error (error) ->
            reject error
