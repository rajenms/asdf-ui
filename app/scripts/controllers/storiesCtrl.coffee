angular.module('asdfApp')

  .controller 'StoriesCtrl', ($scope, $http, $state, $stateParams, Session) ->

    Session.update().then (session) ->
      if session.isLoggedIn is false
        $state.go 'admin.login'

    switch $state.current.name

      when 'admin.stories'
        $http.get('/api/v1/stories').success (stories) ->
          $scope.stories = stories.data

      when 'admin.new_story'
        $scope.title = "New Story"
        $scope.saveLabel = "Save New Story"

      when 'admin.edit_story'
        $scope.title = "Edit Story"
        $scope.saveLabel = "Save Story"
        storyId = $stateParams.id
        $http.get('/api/v1/story/' + storyId).success (story) ->
          data = story.data
          $scope.url = data.url
          $scope.firstSentence = data.firstSentence
          $scope.storyId = data.id

    $scope.saveStory = (id) ->
      story =
          url: $scope.url
          firstSentence: $scope.firstSentence
          addedBy: Session.userId
          author: $scope.author
      if id?
        $http.put('/api/v1/story/' + id, story).success () ->
          $state.go 'admin.stories'
      else
        $http.post('/api/v1/story', story).success () ->
          $state.go 'admin.stories'

    $scope.deleteStory = (id) ->
      $http.delete('/api/v1/story/' + id).success () ->
        for story in $scope.stories
          if story?.id == id
            idx = $scope.stories.indexOf story
            $scope.stories.splice idx, 1
