var AppCtrl, Ctrl, MyCtrl1, MyCtrl2;
AppCtrl = function($scope, $http){
  return $http({
    method: 'GET',
    url: '/api/name'
  }).success(function(data, status, headers, config){
    return $scope.name = data.name;
  }).error(function(data, status, headers, config){
    return $scope.name = 'Error!';
  });
};
Ctrl = function($scope){
  return $scope.userType = 'guest';
};
MyCtrl1 = function(){};
MyCtrl1.$inject = [];
MyCtrl2 = function(){};
MyCtrl2.$inject = [];