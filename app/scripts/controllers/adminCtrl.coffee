angular.module('asdfApp')

  .controller 'AdminCtrl', ($rootScope, $scope, $state, $stateParams, $http, Session) ->

    if Session.isLoggedIn is false
      $state.go 'admin.login'
    else
      console.log 'logged in'

    $rootScope.$state = $state
    $rootScope.$stateParams = $stateParams

    $scope.logout = () ->
      $http.get('/api/v1/logout').success(() ->
        console.log 'successfully logging out'
        Session.isLoggedIn = false
        $state.go 'admin.login'
      ).error(() ->
        console.log 'error logging out'
      )