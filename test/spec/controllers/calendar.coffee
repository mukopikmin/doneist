'use strict'

describe 'Controller: CalendarCtrl', ->

  # load the controller's module
  beforeEach module 'doneistApp'

  CalendarCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    CalendarCtrl = $controller 'CalendarCtrl', {
      # place here mocked dependencies
    }

  # it 'should attach a list of awesomeThings to the scope', ->
  #   expect(CalendarCtrl.awesomeThings.length).toBe 3
