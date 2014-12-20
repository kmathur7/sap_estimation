angular.module('Saps').controller('ApptodbCtrl',['$scope','$http',function($scope,$http)
{
  $http.get('../admin/apptodb/1').success(function(data)
  {
    $scope.application=data.application;
  });
  
  $scope.$watch('application', function()
  {
    $scope.database = 1.0-$scope.application;
  });
    
  $scope.save = function()
  {
    var ratio = {
        id:1,
        application:$scope.application,
        database:$scope.database
    };
    $http.post('../admin/apptodb/',ratio).success(function(data)
    {
      $scope.application=data.application;
    });
  };
}]);