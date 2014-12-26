angular.module('Saps').controller('AnalyticsCtrl',['$scope','$http','$rootScope','dataService','resultService',function($scope,$http,$rootScope,dataService,resultService)
{
  $scope.analyticsdata = [];
  $scope.$on('analyticsData',function(event)
  {
      $scope.analyticsdata.push(dataService.getCalculation());
	});
  
   $scope.$on('reset',function(event)
    {
      $scope.analyticsdata = [];
       
    });
  $scope.options = ['Physical','Virtual'];
    
  $scope.result=function()
  {
		$http.post('./analyze/data',$scope.analyticsdata).success(function(data)
    {
      resultService.setResult(data);
      resultService.setPdfData($scope.analyticsdata);
		  $rootScope.$broadcast('resultData');
    });
  };
    
  $scope.add = function()
  {
      $('#collapseOne').collapse('show');
      $('#collapseFour').collapse('hide');
      
  };
}]);