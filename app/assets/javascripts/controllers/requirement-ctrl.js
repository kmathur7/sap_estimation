angular.module('Saps').controller('ReqCtrl',['$scope','$http',function($scope,$http)
{
  
  $scope.$on('settings',function(event)
  {
        $http.get('../admin/vmware/1').success(function(data)
              {
                $scope.require=data.req;
              });
	});
  
     
  $scope.save = function()
  {
    $http.post('../admin/vmware/',$scope.require).success(function(data)
    {
      $scope.require=data.req;
    });
  };
}]);