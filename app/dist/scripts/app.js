(function() {
  var app;

  app = angular.module('MainApp', ['ui.router']);

  app.config(function($stateProvider, $urlRouterProvider) {
    return $stateProvider.state('users', {
      url: '/users',
      templateUrl: '/views/admin/users.html'
    });
  });

}).call(this);

(function() {
  var app;

  app = angular.module('MainApp');

  app.controller("MainController", function($scope) {
    return console.log('in home controllerssss');
  });

}).call(this);

(function() {
  var app;

  app = angular.module('MainApp');

  app.controller("UsersController", function($scope) {
    return console.log('in users controller');
  });

}).call(this);
