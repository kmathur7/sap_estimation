angular.module('Saps').controller('DesignCtrl',['$scope','$http',function($scope,$http)
{
  $scope.selection = "Production";
  $http.get('../admin/design/Production').success(function(data)
  {
      $scope.design=data.design;
  });
    
  $scope.fetch = function(landscape)
  {
    $scope.selection = landscape;
    $http.get('../admin/design/'+ landscape).success(function(data)
    {
      $scope.design=data.design;
    });
  };
    
  $scope.save = function()
  {
    $http.post('../admin/design',$scope.design).success(function(data)
    {
      $scope.design=data.design;
    });
  };
    
}]);