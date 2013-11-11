angular.module('asdfApp')

  .controller 'AdminCtrl', ($rootScope, $scope, $state, $stateParams,
                            $http, Session) ->

    Session.update().then (session) ->
      if session.isLoggedIn is false
        $state.go 'admin.login'

      $rootScope.$state = $state
      $rootScope.$stateParams = $stateParams
      $scope.email = Session.email

      $scope.logout = () ->
        $http.get('/api/v1/logout').success(() ->
          Session.isLoggedIn = false
          Session.isAdmin = false
          Session.firstName = undefined
          Session.lastName = undefined
          Session.email = undefined
          Session.userId = undefined
          $state.go 'admin.login'
        ).error(() ->
          console.log 'error logging out'
        )