'use strict'

###*
 # @ngdoc function
 # @name doneistApp.controller:CalendarCtrl
 # @description
 # # CalendarCtrl
 # Controller of the doneistApp
###
angular.module 'doneistApp'
  .controller 'CalendarCtrl', ($rootScope, $scope, $filter, $q, $timeout, $http, Todoist, Token) ->

    $rootScope.location = 'Calendar'

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
      $q (resolve, reject) ->
        $http.get("https://todoist.com/API/v7/completed/get_all?token=#{Token.get()}")
          .success (response) ->
            items = response.items.filter (item) ->
              completedDate = new Date(item.completed_date)
              year = completedDate.getFullYear()
              month = completedDate.getMonth()
              day = completedDate.getDate()
              new Date(year, month, day).getTime() == date.getTime()
            items = items.map (item) ->
              "<li>#{item.content}</li>"
            resolve "<ul>#{items.join('')}</ul>"

    return
