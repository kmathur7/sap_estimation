angular.module('Saps').controller('AnalyticsCtrl',['$scope','$http','$rootScope','dataService','resultService',function($scope,$http,$rootScope,dataService,resultService)
{
  $scope.analyticsdata = [];
  $scope.$on('analyticsData',function(event)
  {
      $scope.analyticsdata.push(dataService.getCalculation());
	});
  $scope.options = ['Physical','Virtual'];
    
  $scope.result=function()
  {
		$http.post('./analyze/data',$scope.analyticsdata).success(function(data)
    {
      resultService.setResult(data);
		  $rootScope.$broadcast('resultData');
    });
  };
    
  $scope.add = function()
  {
      $('#collapseOne').collapse('show');
      $('#collapseFour').collapse('hide');
      
  };
}]);