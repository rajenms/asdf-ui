angular.module('asdfApp')

  .controller 'UserCtrl', ($scope, $http, $state) ->

    if $state.current.name is 'admin.users'
      $http.get('/api/v1/users').success (users) ->
        $scope.users = users.data

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
