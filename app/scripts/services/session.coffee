angular.module('asdfApp')
  .factory 'Session', ($http) ->
    Session =
        isLoggedIn: false
        isAdmin: false
        firstName: undefined
        lastName: undefined
        email: undefined
        userId: undefined
        # Return true if client session shows logged in. Otherwise, update
        # session by making request to remote server, and return loggedin val.
        update: () ->
            promise = $http.get('/api/v1/session').then (response) ->
                if response?.data?.data?.user?
                    user = response.data.data.user
                    Session.isLoggedIn = true
                    Session.isAdmin = user.isAdmin
                    Session.email = user.email
                    Session.firstName = user.firstName
                    Session.lastName = user.lastName
                    Session.userId = user.id
                return Session
            return promise
