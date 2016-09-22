'use strict'

describe 'Service: service/token', ->

  # load the service's module
  beforeEach module 'doneistApp'

  # instantiate service
  service/token = {}
  beforeEach inject (_service/token_) ->
    service/token = _service/token_

  it 'should do something', ->
    expect(!!service/token).toBe true
