angular.module('Saps',['ngRoute','angular-loading-bar'])

   .factory('dataService',function(){
		var selection;
    var calculation;
		return {
			setData : function(select,calculate){
				selection=select;
        calculation=calculate;
			},
			getSelection : function(){
				return selection;
			},
      getCalculation : function(){
				return calculation;
			}
		};
	})

  .controller('InputCtrl',['$scope','$http','$rootScope','dataService',function($scope,$http,$rootScope,dataService){
		$http.get('./landscape').success(function(data){
			$scope.landscapes=data.landscape;
		});
		$http.get('./catalog').success(function(data){
			$scope.catalogs=data.catalog;
		});
		
		
		

		$scope.setLandscape=function(landscape){
			selection.landscape=landscape.name;
			$('#collapseOne').collapse('hide');
			$('#collapseTwo').collapse('show');

		};
		$scope.setCatalog=function(catalog){
			selection.catalog=catalog.name;
      $http.get('../qsizer/'+catalog.name).success(function(data){
			$scope.products=data.qsizer;
		});
			$('#collapseTwo').collapse('hide');
			$('#collapseThree').collapse('show');

		};
		$scope.setProduct=function(product){
			selection.product=product.name;
      $http.get('../qsizer/'+selection.catalog+'/'+product.name).success(function(data){
			$scope.platforms=data.qsizer;
		});
			$('#collapseThree').collapse('hide');
			$('#collapseFour').collapse('show');

		};
		$scope.setPlatform=function(platform){
			selection.platform=platform.name;
      $http.get('../qsizer/'+selection.product+'/'+selection.platform+'/2').success(function(data){
				$scope.components=data.qsizer;
        
		});
			$('#collapseFour').collapse('hide');
			$('#collapseFive').collapse('show');
  

		};
		
		$scope.calculate=function(){
      selection.component=$scope.components
      
      $http.post('./qsizer',selection)
	       .success(function(data){
                               console.log(data);
		                           dataService.setData(selection,data.qsizer);
                               $rootScope.$broadcast('analyticsData');

                                
		                        });
			
      console.log("sent");
		};

	}])

  .controller('AnalyticsCtrl',['$scope','$http','$rootScope','dataService',function($scope,$http,$rootScope,dataService){
		$scope.$on('analyticsData',function(event){
          console.log("recieved");
          $scope.selection=dataService.getSelection();
			    $scope.data=dataService.getCalculation();
    });
    $scope.options = ['Physical','Virtual'];
    $scope.calculate=function(){
			  $rootScope.$broadcast('resultData');
        console.log($scope.data);
		};
	}])

  .controller('ResultsCtrl',function($scope,$http){
		$scope.$on('resultData',function(event){

			$http.get('../json/results.json').success(function(data){
			$scope.results=data;
        
			
		});
		
		});
		
	})

  .directive('upVote', function(){
  return    {
    restrict:'E',
    scope:{
      min: '=',
      max:'=',
      value:'='
    },
    template: '<span ng-init="value=1">' + 
      '<button class="btn btn-primary" ng-click="value = value + 1" ng-disabled="value >= max">+</button>' + 
      '<span>{{value}}</span>' +
      '<button class="btn btn-primary" ng-click="value = value - 1" ng-disabled="value <= min">-</button>' + 
    '</span>'
  }
  });
var selection={
			landscape:"",
			catalog:"",
			product:"",
			platform:"",
			component:{
      
                }
		};