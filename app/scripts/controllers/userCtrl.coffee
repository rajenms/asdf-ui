angular.module('asdfApp')

  .controller 'UserCtrl', ($scope, $http, $state, $stateParams, Session) ->
    console.log 'session: ', Session
    if Session.isLoggedIn is false
      console.log 'logged out'
      $state.go 'admin.login'
    else
      console.log 'logged in'

    switch $state.current.name

      when 'admin.users'
        $http.get('/api/v1/users').success (users) ->
          $scope.users = users.data

      when 'admin.edit_user'
        userId = $stateParams.id
        $http.get('/api/v1/user/' + userId).success (user) ->
          data = user.data
          $scope.firstName = data.first_name
          $scope.lastName = data.last_name
          $scope.email = data.email
          $scope.userId = userId
          $scope.title = "Edit User"
          $scope.saveLabel = "Save Edits"

      when 'admin.new_user'
        $scope.title = "New User"
        $scope.saveLabel = "Save New User"

    $scope.createUser = () ->
      newUser = 
        first_name: $scope.firstName
        last_name: $scope.lastName
        email: $scope.email
        password: $scope.password
      $http.post('/api/v1/user', newUser).success () ->
        $state.go 'admin.users'

    $scope.deleteUser = (id) ->
      $http.delete('/api/v1/user/' + id).success () ->
        for user in $scope.users
          if user?.id == id
            idx = $scope.users.indexOf user
            $scope.users.splice idx, 1