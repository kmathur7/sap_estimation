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
.factory('resultService',function(){
		var result;
    
		return {
			setResult : function(data){
				result=data;
        
			},
			getResult : function(){
				return result;
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
      $http.get('../qsizer/'+"catalog.name").success(function(data){
			$scope.products=data.qsizer;
		});
			$('#collapseOne').collapse('hide');
			$('#collapseTwo').collapse('show');

		};
		$scope.cats = ['Custom','Amazon AWS','Azure'];
		selection.catalog=$scope.catalog;
    
		$scope.setProduct=function(product){
			selection.product=product.name;
      $http.get('../qsizer/'+selection.catalog+'/'+product.name).success(function(data){
			$scope.platforms=data.qsizer;
		});
			$('#collapseTwo').collapse('hide');
			$('#collapseThree').collapse('show');

		};
		$scope.setPlatform=function(platform){
			selection.platform=platform.name;
      $http.get('../qsizer/'+selection.product+'/'+selection.platform+'/2').success(function(data){
				$scope.components=data.qsizer;
        
		});
			$('#collapseThree').collapse('hide');
			$('#collapseFour').collapse('show');
  

		};
		
		$scope.calculate=function(){
      selection.component=$scope.components
      
      $http.post('./qsizer',selection)
	       .success(function(data){
                               console.log(data.qsizer);
		                           dataService.setData(selection,data.qsizer);
                               $rootScope.$broadcast('analyticsData');

                                
		                        });
			
      console.log("sent");
		};

	}])

  .controller('AnalyticsCtrl',['$scope','$http','$rootScope','dataService','resultService',function($scope,$http,$rootScope,dataService,resultService){
		$scope.$on('analyticsData',function(event){
          console.log("recieved");
          $scope.selection=dataService.getSelection();
			    $scope.data=dataService.getCalculation();
    });
    $scope.options = ['Physical','Virtual'];
    
    $scope.result=function(){
			  //console.log($scope.data);
        var temp = $scope.data;
       /*  var names = [];
        temp.forEach(function(entry){
          names.push(entry.catalog);
        });
      console.log(names);
      */
      
      
        console.log(temp);
        $http.post('./analyze/data',temp)
	       .success(function(data){
                               console.log("Sent data");
                               resultService.setResult(data);
		                           $rootScope.$broadcast('resultData');

                                
		                        });
      console.log("Sent");
      
		};
	}])

  .controller('ResultsCtrl',function($scope,$http,resultService){
		$scope.$on('resultData',function(event){
      console.log("Result Received");
      $scope.results=resultService.getResult();
    });
	})

  .controller('DesignCtrl',function($scope,$http){
    $scope.selection = "Production";
		$http.get('../admin/design/Production').success(function(data){
			$scope.design=data.design;
		});
    $scope.fetch = function(landscape){
      $scope.selection = landscape;
      $http.get('../admin/design/'+ landscape).success(function(data){
			$scope.design=data.design;
		});
    };
	})

  .controller('ResourceCtrl',function($scope,$http){
		$http.get('../admin/resourceweightage/1').success(function(data){
			$scope.resource=data.resource;
		});
	})

  .controller('BladeCtrl',function($scope,$http){
		$http.get('../admin/bladeparameters/1').success(function(data){
			$scope.parameters=data.parameters;
		});
	})

  .controller('AssumptionsTargetCtrl',function($scope,$http){
		  
      $http.get('../admin/assumptionstarget/1').success(function(data){
			$scope.percentage=data.assumptions;
		});
     // $scope.decimal = 1+((100 - $scope.percentage)/100);
     $scope.$watch('percentage', function() {
       $scope.decimal = 1+((100 - $scope.percentage)/100);
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

