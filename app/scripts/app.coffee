# angular.module('MainApp', ['ngRoute'])
#   .config(($routeProvider, $locationProvider) ->
#     $locationProvider.html5Mode(true)
#     $routeProvider
#       .when('/',
#         controller: 'MainController'
#         templateUrl: '/views/asdf/main.html'
#       )
#       .when('/users/',
#         controller: 'UsersController'
#         templateUrl: '/views/admin/users.html'
#       )
#   )

app = angular.module 'MainApp', ['ui.router']

app.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state 'users',
      url: '/users'
      templateUrl: '/views/admin/users.html'
