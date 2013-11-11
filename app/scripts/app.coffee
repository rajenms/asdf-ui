"use strict"
angular.module("asdfApp", ['ui.router', 'ngCookies']).config ($stateProvider,
                $urlRouterProvider, $locationProvider) ->

  $locationProvider.html5Mode true

  $urlRouterProvider.otherwise "/"

  $stateProvider
    #########
    # Admin #
    #########
    .state 'admin',
      url: "/admin"
      templateUrl: "/views/admin/main.html"
      controller: "AdminCtrl"

    #########################
    # Admin -> Login/Logout #
    #########################
    .state 'admin.login',
      url: "/login"
      templateUrl: "/views/admin/login.html"
      controller: "LoginCtrl"
    .state 'admin.logout',
      url: "/logout"
      controller: "LoginCtrl"

    ##################
    # Admin -> Users #
    ##################
    .state 'admin.users',
      url: "/users"
      templateUrl: "/views/admin/users.html"
      controller: "UserCtrl"
    .state 'admin.new_user',
      url: "/users/new"
      templateUrl: "/views/admin/user_form.html"
      controller: "UserCtrl"
    .state 'admin.edit_user',
      url: "/user/:id"
      templateUrl: "/views/admin/user_form.html"
      controller: "UserCtrl"

    ####################
    # Admin -> Stories #
    ####################
    .state 'admin.stories',
      url: "/stories"
      templateUrl: "/views/stories/stories.html"
      controller: "StoriesCtrl"
    .state 'admin.new_story',
      url: "/stories/new"
      templateUrl: "/views/stories/story_form.html"
      controller: "StoriesCtrl"
    .state 'admin.edit_story',
      url: "/story/:id"
      templateUrl: "/views/stories/story_form.html"
      controller: "StoriesCtrl"

    #############
    # Main Page #
    #############
    .state 'main',
      url: "/"
      templateUrl: "views/main.html"
      controller: "MainCtrl"