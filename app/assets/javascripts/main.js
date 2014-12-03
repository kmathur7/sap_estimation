angular.module('Saps',['ngRoute','angular-loading-bar'])

 

  .controller('InputCtrl',['$scope','$http','$rootScope',function($scope,$http,$rootScope){
		$http.get('../json/landscape.json').success(function(data){
			$scope.landscapes=data;
		});
		$http.get('../json/catalog.json').success(function(data){
			$scope.catalogs=data;
		});
		$http.get('../json/product.json').success(function(data){
			$scope.products=data;
		});
		$http.get('../json/platform.json').success(function(data){
			$scope.platforms=data;
		});
		$scope.selection={
			landscape:"",
			catalog:"",
			product:"",
			platform:"",
			scale:""
		};

		$scope.setLandscape=function(landscape){
			$scope.selection.landscape=landscape.name;
			$('#collapseOne').collapse('hide');
			$('#collapseTwo').collapse('show');

		};
		$scope.setCatalog=function(catalog){
			$scope.selection.catalog=catalog.name;
			$('#collapseTwo').collapse('hide');
			$('#collapseThree').collapse('show');

		};
		$scope.setProduct=function(product){
			$scope.selection.product=product.name;
			$('#collapseThree').collapse('hide');
			$('#collapseFour').collapse('show');

		};
		$scope.setPlatform=function(platform){
			$scope.selection.platform=platform.name;
			$('#collapseFour').collapse('hide');
			$('#collapseFive').collapse('show');

		};
		$scope.setScale=function(scale){
			$scope.selection.scale=scale;
			$('#collapseFive').collapse('hide');
			

		};
		$scope.calculate=function(){
			$rootScope.$broadcast('analyticsData');
		};

	}])

  .controller('AnalyticsCtrl',['$scope','$http','$rootScope',function($scope,$http,$rootScope){
		$scope.$on('analyticsData',function(event){

			$http.get('../json/analytics.json').success(function(data){
			$scope.analytics=data;
			
		});
		
		});
	}]);