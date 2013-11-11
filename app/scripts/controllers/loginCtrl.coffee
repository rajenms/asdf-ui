angular.module('asdfApp')

  .controller 'LoginCtrl', ($scope, $http, $state, $stateParams, Session) ->

    console.log 'about to update in login ctrl...'
    Session.update().then (session) ->
      if session.isLoggedIn is true
        $state.go 'admin.users'

    $scope.login = () ->
      loginData =
        email: $scope.email
        password: $scope.password
      $http.post('/api/v1/login', loginData).success((data) ->
          $http.get('/api/v1/session').success((sessionData) ->
            console.log 'session data: ', sessionData.data.user
            user = sessionData.data.user
            Session.isLoggedIn = true
            Session.isAdmin = user.isAdmin
            Session.firstName = user.firstName
            Session.lastName = user.lastName
            Session.email = user.email
            Session.userId = user.id
            $state.go 'admin'
          )
      ).error((err) ->
        console.log 'Error authenticating: ', err
      )