angular.module('Saps').controller('ResourceCtrl',['$scope','$http',function($scope,$http)
{
  $http.get('../admin/resourceweightage/1').success(function(data)
  {
    $scope.resource=data.resource;
  });
    
  $scope.save = function()
  {
    $http.post('./admin/resourceweightage',$scope.resource).success(function(data)
    {
      $scope.resource=data.resource;
    });
   };
}]);