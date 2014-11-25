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

App.controller("UserCtrl", ["$scope", "$http", ($scope, $http) ->
  $http.get('/categories.json')
    .success (data) ->
      $scope.allCategories = data

  $scope.userCategories = []

  $scope.addCategory = (category, index) ->
    $scope.allCategories = $scope.allCategories.slice(0, index).concat($scope.allCategories.slice(index+1))
    userCategories = $scope.userCategories.push(category)


  $scope.removeCategory = (category, index) ->
    $scope.userCategories = $scope.userCategories.slice(0, index).concat($scope.userCategories.slice(index+1))
    allCategories = $scope.allCategories.push(category)

])
