angular.module('asdfApp')

  .controller 'AdminCtrl', ($rootScope, $scope, $state, $stateParams,
                            $http, Session) ->

    $rootScope.$watch 'email', (newVal) ->
      $scope.email = newVal

    Session.update().then (session) ->
      if session.isLoggedIn is false
        $rootScope.loggedIn = false
        $state.go 'admin.login'
      else
        $rootScope.loggedIn = true
      $rootScope.$state = $state
      $rootScope.$stateParams = $stateParams
      $scope.email = session.email
      $scope.logout = () ->
        $http.get('/api/v1/logout').success(() ->
          Session.isLoggedIn = false
          Session.isAdmin = false
          Session.firstName = undefined
          Session.lastName = undefined
          Session.email = $scope.email = undefined
          Session.userId = undefined
          $rootScope.loggedIn = false
          $rootScope.email = ''
          $state.go 'admin.login'
        ).error(() ->
          console.log 'error logging out'
        )