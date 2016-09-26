'use strict'

describe 'Controller: IndexCtrl', ->

  # load the controller's module
  beforeEach module 'doneistApp'

  IndexCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    IndexCtrl = $controller 'IndexCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(IndexCtrl.awesomeThings.length).toBe 3
