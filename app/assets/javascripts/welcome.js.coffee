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

  $scope.showMyArticles = ->
    $http.get('/user/articles.json')
      .success (data) ->
        $scope.articles = data

  $scope.showAllArticles = ->
    $http.get('/articles.json')
      .success (data) ->
        $scope.articles = data
])

App.controller("UserCtrl", ["$scope", "$http", "$timeout", ($scope, $http, $timeout) ->
  $http.get('/user/user_all_category.json')
    .success (data) ->
      $scope.allCategories = data

  $http.get('/user/user_category.json')
    .success (data) ->
      $scope.userCategories = data

  $scope.addCategory = (category, index) ->
    $scope.allCategories = $scope.allCategories.slice(0, index).concat($scope.allCategories.slice(index+1))
    userCategories = $scope.userCategories.push(category)

  $scope.removeCategory = (category, index) ->
    $scope.userCategories = $scope.userCategories.slice(0, index).concat($scope.userCategories.slice(index+1))
    allCategories = $scope.allCategories.push(category)

  $scope.userSubmit = ->
    jsonObj = {"data": $scope.userCategories}
    console.log jsonObj
    $http.post('/user/submit.json', jsonObj)
      .success (data) ->
        console.log data
        $scope.saved = true
        $timeout((-> $scope.saved = false), 1000)
      .error (data) ->
        console.log data
])
