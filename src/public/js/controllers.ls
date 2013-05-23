

AppCtrl = ($scope, $http)->
  $http method: 'GET', url: '/api/name'
  .success (data, status, headers, config)->
    $scope.name = data.name;

  .error (data, status, headers, config)->
    $scope.name = 'Error!'

Ctrl = ->
  it.user-type = 'guest'

MyCtrl1 = ->
MyCtrl1.$inject = [];


MyCtrl2 = ->
MyCtrl2.$inject = [];
