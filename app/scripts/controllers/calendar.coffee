'use strict'

###*
 # @ngdoc function
 # @name doneistApp.controller:CalendarCtrl
 # @description
 # # CalendarCtrl
 # Controller of the doneistApp
###
angular.module 'doneistApp'
  .controller 'CalendarCtrl', ($scope, $filter, $q, $timeout, Todoist, Token) ->

    $scope.dayFormat = 'd'
    $scope.selectedDate = null
    $scope.firstDayOfWeek = 0

    $scope.setDirection = (direction) ->
      $scope.direction = direction
      $scope.dayFormat = if direction == 'vertical' then 'EEEE, MMMM d' else 'd'

    $scope.dayClick = (date) ->
      $scope.msg = 'You clicked ' + $filter('date')(date, 'MMM d, y h:mm:ss a Z')

    $scope.prevMonth = (data) ->
      $scope.msg = 'You clicked (prev) month ' + data.month + ', ' + data.year

    $scope.nextMonth = (data) ->
      $scope.msg = 'You clicked (next) month ' + data.month + ', ' + data.year

    $scope.tooltips = true

    $scope.setDayContent = (date, content) ->
      # You would inject any HTML you wanted for
      # that particular date here.
      # console.log date
      # console.log content
      return "<p>#{content}</p>"
      # You could also use an $http function directly.
      return $http.get('/some/external/api')
      # You could also use a promise.
      deferred = $q.defer()
      $timeout (->
        deferred.resolve '<p></p>'
      ), 1000
      deferred.promise

    Todoist.getCompletedTasks(Token.get())
      .then (tasks) ->
        tasks.items.forEach (item) ->
          console.log item.content
          console.log new Date(item.completed_date)
          $scope.setDayContent(new Date(item.completed_date), item.content)
      .then () ->
        console.log "end"

    return
