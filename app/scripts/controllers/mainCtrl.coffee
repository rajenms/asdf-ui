'use strict';

angular.module('asdfApp')
  .controller 'MainCtrl', ($scope, $http) ->

    getRandom = (min, max) ->
        Math.floor(Math.random() * (max - min + 1) + min)

    $http.get('/api/v1/stories').success (res) ->
        stories = res.data
        storyCount = stories.length
        idx = getRandom 0, storyCount - 1
        currentStory = stories[idx]
        $scope.firstSentence = currentStory.firstSentence
        $scope.url = currentStory.url