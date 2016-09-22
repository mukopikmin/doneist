'use strict'

describe 'Controller: AuthorizedCtrl', ->

  # load the controller's module
  beforeEach module 'doneistApp'

  AuthorizedCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    AuthorizedCtrl = $controller 'AuthorizedCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(AuthorizedCtrl.awesomeThings.length).toBe 3
