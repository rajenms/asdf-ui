angular.module('asdfApp')

  .controller 'AdminCtrl', ($rootScope, $state, $stateParams) ->
    $rootScope.$state = $state
    $rootScope.$stateParams = $stateParams
    