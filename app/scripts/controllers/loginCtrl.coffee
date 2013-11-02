angular.module('asdfApp')

  .controller 'LoginCtrl', ($scope, $http, $state, $stateParams, Session) ->

    $scope.login = () ->
      loginData = 
        email: $scope.email
        password: $scope.password
      $http.post('/api/v1/login', loginData).success((data) ->
        console.log 'data: ', data
        Session.isLoggedIn = true
        $state.go 'admin'
      ).error((err) ->
        console.log 'Error authenticating: ', err
      )