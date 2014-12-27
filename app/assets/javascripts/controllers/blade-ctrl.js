angular.module('Saps').controller('BladeCtrl',['$scope','$http',function($scope,$http)
{
   $scope.$on('settings',function(event)
  {
        $http.get('../admin/bladeparameters/1').success(function(data)
        {
          $scope.parameters=data.parameters;
        });
	});
  
    
  $scope.save = function()
  {
    $http.post('./admin/bladeparameters',$scope.parameters).success(function(data)
    {
      $scope.parameters=data.parameters;
    });
  };
}]);