angular.module('asdfApp')
  .factory 'Session', ($http) ->
    Session = 
      isLoggedIn: false