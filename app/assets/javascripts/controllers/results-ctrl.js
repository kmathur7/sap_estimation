angular.module('Saps').controller('ResultsCtrl',['$scope','$http','resultService',function($scope,$http,resultService)
{
    $scope.$on('resultData',function(event)
    {
      $scope.results=resultService.getResult();
    });
}]);