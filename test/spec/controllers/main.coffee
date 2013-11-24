'use strict'

describe 'Controller: MainCtrl', () ->

  asdfModule = null

  beforeEach () ->
    asdfModule = angular.module 'asdfApp'

  it 'should be registered', () ->
    expect(asdfModule).not.toBeNull()
