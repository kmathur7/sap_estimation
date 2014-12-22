
angular.module('Saps').controller('InputCtrl',['$scope','$http','$rootScope','dataService',function($scope,$http,$rootScope,dataService){
		

		$http.get('./landscape').success(function(data){
			$scope.landscapes=data.landscape;
		});

		$scope.setLandscape=function(landscape)
		{
			selection.landscape=landscape.name;
      		$http.get('../qsizer/'+1).success(function(data)
      			{
					$scope.products=data.qsizer;
				});
			$('#collapseOne').collapse('hide');
			$('#collapseTwo').collapse('show');

		};

		$scope.cats = ['Custom','Amazon AWS','Azure'];

		selection.catalog=$scope.catalog;
    
		$scope.setProduct=function(product)
		{
			selection.product=product.name;
      		$http.get('../qsizer/'+selection.catalog+'/'+product.name).success(function(data)
      		{
				$scope.platforms=data.qsizer;
			});
			$('#collapseTwo').collapse('hide');
			$('#collapseThree').collapse('show');
		};
		$scope.setPlatform=function(platform)
		{
			selection.platform=platform.name;
      		$http.get('../qsizer/'+selection.product+'/'+selection.platform+'/2').success(function(data)
      		{
				$scope.components=data.qsizer;
        
			});
			$('#collapseThree').collapse('hide');
			$('#collapseFour').collapse('show');
      $('#collapseFive').collapse('show');
  		};
		$scope.setCatalog = function(catalog)
    {
      $('#collapseFive').collapse('hide');
      selection.maincatalog=catalog;
    };
		$scope.calculate=function()
		{
      		selection.component=$scope.components
      		$http.post('./qsizer',selection).success(function(data)
      		{
                dataService.setData(data.qsizer);
                $rootScope.$broadcast('analyticsData');
			});
		};

	}]);