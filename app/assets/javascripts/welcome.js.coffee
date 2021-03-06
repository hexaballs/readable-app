# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

App = angular.module("readableApp", ["ngSanitize"])

App.controller("ArticleCtrl", ["$scope", "$http", "$timeout", ($scope, $http, $timeout) ->

  $scope.userLoggedIn = true
  $http.get('/user/is_logged_in.json')
    .success (data) ->
      $scope.userLoggedIn = data.is_logged_in

  $http.get('/user/articles.json')
    .success (data) ->
      $scope.articles = data

  $http.get('/articles.json')
    .success (data) ->
      if $scope.userLoggedIn == false
        $scope.articles = data

  $scope.showMyArticles = ->
    $http.get('/user/articles.json')
      .success (data) ->
        $scope.articles = data


  $scope.showAllArticles = ->
    $http.get('/articles.json')
      .success (data) ->
        $scope.articles = data

  $scope.pillFilter = (category) ->
    console.log category
    $http.get('/articles.json?category=' + category)
      .success (data) ->
        $scope.articles = data

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
    $('#collapseOne').collapse('hide')

    $http.get('/user/articles.json')
      .success (data) ->
        $scope.articles = data

  $scope.articleView = (articleId) ->
    $http.get('/articles/' + articleId + '.json')
      .success (data) ->
        $scope.article = data
        $scope.articleClass = data.link_identifier.replace(/\W/g, '-').match(/[a-z]{1,}\Wcom/)[0]
        $('.fb-share-button').attr('href', "http://readable-app.herokuapp.com/#/articles/" + $scope.article.id)
        $('.bs-article-view').modal('show')

  checkHash = ->
    if window.location.hash.indexOf('#/articles/') == 0
      $scope.articleId = window.location.hash.substring(11)
      $scope.articleView($scope.articleId)

  window.addEventListener("hashchange", checkHash, false)

  if not $('.bs-article-view').is(':visible')
    checkHash()

])
