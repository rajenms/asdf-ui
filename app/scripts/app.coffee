"use strict"
angular.module("asdfApp", ['ui.router']).config ($stateProvider, $urlRouterProvider, $locationProvider) ->

  $locationProvider.html5Mode true

  $urlRouterProvider.otherwise "/"

  $stateProvider
    .state 'main',
      url: "/"
      templateUrl: "views/main.html"
      controller: "MainCtrl"

    .state 'admin',
      url: "/admin"
      templateUrl: "/views/admin/main.html"
      controller: "AdminCtrl"

    # Admin 
    .state 'admin.users',
      url: "/users"
      templateUrl: "/views/admin/users.html"
      controller: "UserCtrl"

    .state 'admin.new_user',
      url: "/users/new"
      templateUrl: "/views/admin/user_form.html"
      controller: "UserCtrl"

    .state 'admin.edit_user',
      url: "/user/:id",
      templateUrl: "/views/admin/user_form.html",
      controller: "UserCtrl"
