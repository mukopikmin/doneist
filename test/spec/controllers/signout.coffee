'use strict'

describe 'Controller: SignoutCtrl', ->

  # load the controller's module
  beforeEach module 'doneistApp'

  SignoutCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    SignoutCtrl = $controller 'SignoutCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(SignoutCtrl.awesomeThings.length).toBe 3
