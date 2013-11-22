angular.module('asdfApp')

  .controller 'UserCtrl', ($rootScope, $scope, $http, $state, $stateParams, Session) ->

    Session.update().then (session) ->
      if session.isLoggedIn is false
        $state.go 'admin.login'

      switch $state.current.name

        when 'admin.users'
          $http.get('/api/v1/users').success (users) ->
            $scope.users = users.data

        when 'admin.edit_user'
          userId = $stateParams.id
          $http.get('/api/v1/user/' + userId).success (user) ->
            data = user.data
            $scope.firstName = data.firstName
            $scope.lastName = data.lastName
            $scope.userEmail = data.email
            $scope.userId = userId
            $scope.title = "Edit User"
            $scope.saveLabel = "Save User"
            $scope.isAdmin = data.isAdmin

        when 'admin.new_user'
          $scope.title = "New User"
          $scope.saveLabel = "Save New User"

      $scope.saveUser = (id) ->
        user =
          firstName: $scope.firstName
          lastName: $scope.lastName
          email: $scope.userEmail
          password: $scope.password
          isAdmin: $scope.isAdmin

        if id?
          console.log 'editing'
          $http.put('/api/v1/user/' + id, user).success () ->
            $state.go 'admin.users'
        else
          console.log 'adding'
          $http.post('/api/v1/user', user).success () ->
            $state.go 'admin.users'

      $scope.deleteUser = (id) ->
        $http.delete('/api/v1/user/' + id).success () ->
          for user in $scope.users
            if user?.id == id
              idx = $scope.users.indexOf user
              $scope.users.splice idx, 1