angular.module('asdfApp')

  .controller 'LoginCtrl', ($rootScope, $scope, $http, $state, $stateParams, Session) ->

    Session.update().then (session) ->
      if session.isLoggedIn is true
        $state.go 'admin.users'

      $scope.login = () ->
        loginData =
          email: $scope.email
          password: $scope.password
        $http.post('/api/v1/login', loginData).success((data) ->
            $http.get('/api/v1/session').success((sessionData) ->
              user = sessionData.data.user
              Session.isLoggedIn = true
              Session.isAdmin = user.isAdmin
              Session.firstName = user.firstName
              Session.lastName = user.lastName
              Session.email = user.email
              Session.userId = user.id
              $rootScope.loggedIn = true
              $rootScope.email = user.email
              $state.go 'admin.users'
            )
        ).error((err) ->
          console.log 'Error authenticating: ', err
        )