'use strict'

###*
 # @ngdoc function
 # @name doneistApp.controller:CalendarCtrl
 # @description
 # # CalendarCtrl
 # Controller of the doneistApp
###
angular.module 'doneistApp'
  .controller 'CalendarCtrl', ($rootScope, $scope, Todoist) ->

    $scope.events = []
    $scope.eventSources = [$scope.events]

    $scope.addEvent = (event) ->
      $scope.events.push event


    Todoist.getCompletedTasks(1).then (tasks) ->
      items = tasks.items
      projects = tasks.projects
      items.forEach (item) ->
        $scope.addEvent item

    $scope.alertOnEventClick = (date, jsEvent, view) ->
      $scope.alertMessage = (date.title + ' was clicked ')

    $scope.alertOnDrop = (event, delta, revertFunc, jsEvent, ui, view) ->
      $scope.alertMessage = ('Event Droped to make dayDelta ' + delta)

    $scope.alertOnResize = (event, delta, revertFunc, jsEvent, ui, view) ->
      $scope.alertMessage = ('Event Resized to make dayDelta ' + delta)

    $scope.eventRender = (event, element, view) ->
      element.attr
        'tooltip': event.title
        'tooltip-append-to-body': true
      $compile(element)($scope);

    $scope.uiConfig =
      calendar:
        height: 450,
        editable: true,
        header:
          left: 'title',
          center: '',
          right: 'today prev,next'
        eventClick: $scope.alertOnEventClick
        eventDrop: $scope.alertOnDrop
        eventResize: $scope.alertOnResize
        eventRender: $scope.eventRender

    return
