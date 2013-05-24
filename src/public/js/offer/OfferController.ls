
my-app = angular.module 'myApp', []

my-app.factory "Data", ->
  message: "i'm totally a fucking factory, dude"

my-app.filter "reverse", -> (text)->
  text.split('').reverse!.join('')

OfferCtrl = ($scope, Data)->
  $scope.data =
    message: 'qweqweq'
