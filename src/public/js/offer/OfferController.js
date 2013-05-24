var myApp, OfferCtrl;
myApp = angular.module('myApp', []);
myApp.factory("Data", function(){
  return {
    message: "i'm totally a fucking factory, dude"
  };
});
myApp.filter("reverse", function(){
  return function(text){
    return text.split('').reverse().join('');
  };
});
OfferCtrl = function($scope, Data){
  return $scope.data = {
    message: 'qweqweq'
  };
};