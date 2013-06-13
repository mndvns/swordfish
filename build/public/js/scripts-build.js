angular.module("myApp.directives", []).directive("appVersion", [
  "version", function(version){
    return function(scope, elm, attrs){
      return elm.text(version);
    };
  }
]);
angular.module("myApp.filters", []).filter("interpolate", [
  "version", function(version){
    return function(text){
      return String(text).replace(/\%VERSION\%/g, version);
    };
  }
]);
angular.module('myApp', ['myApp.controllers', 'myApp.filters', 'myApp.services', 'myApp.directives']).config([
  '$routeProvider', '$locationProvider', function($routeProvider, $locationProvider){
    $routeProvider.when('/view1', {
      templateUrl: 'partials/partial1',
      controller: 'MyCtrl1'
    });
    $routeProvider.when('/view2', {
      templateUrl: 'partials/partial2',
      controller: 'MyCtrl2'
    });
    $routeProvider.otherwise({
      redirectTo: '/view1'
    });
    return $locationProvider.html5Mode(true);
  }
]);
angular.module('myApp.controllers', []).controller('AppCtrl', function($scope, $http){
  return $http({
    method: 'GET',
    url: '/api/name'
  }).success(function(data, status, headers, config){
    return $scope.name = data.name;
  }).error(function(data, status, headers, config){
    return $scope.name = "Error!";
  });
}).controller('MyCtrl1', function($scope){}).controller('MyCtrl2', function($scope){});
angular.module('myApp.services', []).value('version', '0.1');