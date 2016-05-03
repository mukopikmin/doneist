'use strict'

###*
 # @ngdoc service
 # @name doneistApp.todoist
 # @description
 # # todoist
 # Factory in the doneistApp.
###
angular.module 'doneistApp'
  .factory 'Todoist', ($http, $q) ->

    api = 'http://localhost:4567/api'
    # api = '/api'

    getCompletedTasks: (seq)->
      $q (resolve, reject) ->
        $http.get "#{api}/completed/#{seq}"
          .success (response) ->
            response.items.map (item) ->
              item.title = item.content
              item.start = new Date item.completed_date
            resolve response
          .error (error) ->
            reject error

    getProjects: ->
      $q (resolve, reject) ->
        $http.get "#{api}/projects"
          .success (response) ->
            projects = response.Projects.sort (a, b) ->
              if a.item_order > b.item_order
                return 1
              else if a.item_order < b.item_order
                return -1
              else
                return 0
            resolve projects
          .error (error) ->
            reject error

    getColors: ->
      $q (resolve, reject) ->
        $http.get "#{api}/colors"
          .success (response) ->
            resolve response
          .error (error) ->
            reject error
