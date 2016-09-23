'use strict'

###*
 # @ngdoc function
 # @name doneistApp.controller:CalendarCtrl
 # @description
 # # CalendarCtrl
 # Controller of the doneistApp
###
angular.module 'doneistApp'
  .controller 'ListCtrl', ($rootScope, $scope, $q, Todoist, Token) ->

    $scope.projects = []

    $scope.load = ->
      $scope.loading = true
      Todoist.getProjects()
        .then (projects) ->
          $scope.projects = projects
          Todoist.getCompletedTasks()
        .then (tasks) ->
          $scope.projects.map (project) ->
            project.completed_tasks = tasks.items.filter (task) ->
              if task.project_id == project.id then true
          Todoist.getColors()
        .then (colors) ->
          $scope.loading = false
          $scope.projects.map (project) ->
            project.color = colors[project.color]
            project.completed_tasks.map (task) ->
              task.completed_date = new Date(task.completed_date).toLocaleString().split(' ')[0]

    $scope.load()

    return
