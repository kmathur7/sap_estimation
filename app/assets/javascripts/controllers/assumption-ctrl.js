angular.module('Saps').controller('AssumptionsTargetCtrl',['$scope','$http',function($scope,$http)
{
  $http.get('../admin/assumptionstarget/1').success(function(data)
  {
    $scope.percentage=data.assumptions;
  });
  
  $scope.$watch('percentage', function()
  {
    $scope.decimal = 1+((100 - $scope.percentage)/100);
  });
    
  $scope.save = function()
  {
    var senddata = {
        id: 1,
        percentage: $scope.percentage,
        decimal: $scope.decimal
    };
    $http.post('../admin/assumptionstarget',senddata).success(function(data)
    {
      $scope.percentage=data.assumptions.percentage;
    });
  };
}]);