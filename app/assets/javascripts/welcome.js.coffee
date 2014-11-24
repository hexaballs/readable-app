# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

App = angular.module("readableApp", [])

App.controller("ArticleCtrl", ["$scope", "$http", ($scope, $http) ->
  $http.get('/articles.json')
    .success (data) ->
      $scope.articles = data

  $http.get('/categories.json')
    .success (data) ->
      $scope.categories = data
])


