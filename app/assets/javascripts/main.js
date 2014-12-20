angular.module('Saps',['ngRoute','angular-loading-bar','angularFileUpload'])

   .factory('dataService',function(){
		
    var calculation;
		return {
			setData : function(calculate){
				
        calculation=calculate;
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
	
		
		

		$scope.setLandscape=function(landscape){
			selection.landscape=landscape.name;
      $http.get('../qsizer/'+1).success(function(data){
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
		                           dataService.setData(data.qsizer);
                               $rootScope.$broadcast('analyticsData');

                                
		                        });
			
      console.log("sent");
		};

	}])

  .controller('AnalyticsCtrl',['$scope','$http','$rootScope','dataService','resultService',function($scope,$http,$rootScope,dataService,resultService){
		 $scope.analyticsdata = [];
    $scope.$on('analyticsData',function(event){
          console.log("recieved");
          $scope.analyticsdata.push(dataService.getCalculation());
			    console.log($scope.analyticsdata);
    });
    $scope.options = ['Physical','Virtual'];
    
    $scope.result=function(){
			console.log("data being sent to result calculation")  
      console.log($scope.analyticsdata);
       
        $http.post('./analyze/data',$scope.analyticsdata)
	       .success(function(data){
                               console.log(" result data Sent data");
                               resultService.setResult(data);
		                           $rootScope.$broadcast('resultData');

                                
		                        });
      console.log("Sent");
      
		};
    
    $scope.add = function(){
      $('#collapseOne').collapse('show');
      $('#collapseFour').collapse('hide');
      
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
    
    $scope.save = function(){
      $http.post('../admin/design',$scope.design)
	       .success(function(data){
                               $scope.design=data.design;
                            });
    };
    
	})

  .controller('ResourceCtrl',function($scope,$http){
		$http.get('../admin/resourceweightage/1').success(function(data){
			$scope.resource=data.resource;
		});
    
    $scope.save = function(){
      $http.post('./admin/resourceweightage',$scope.resource)
	       .success(function(data){
                               $scope.resource=data.resource;
                            });
    };
	})

  .controller('BladeCtrl',function($scope,$http){
		$http.get('../admin/bladeparameters/1').success(function(data){
			$scope.parameters=data.parameters;
		});
    
    $scope.save = function(){
      $http.post('./admin/bladeparameters',$scope.parameters)
	       .success(function(data){
                               $scope.parameters=data.parameters;
                            });
    };
	})

  .controller('AssumptionsTargetCtrl',function($scope,$http){
		  
      $http.get('../admin/assumptionstarget/1').success(function(data){
			$scope.percentage=data.assumptions;
		});
     // $scope.decimal = 1+((100 - $scope.percentage)/100);
     $scope.$watch('percentage', function() {
       $scope.decimal = 1+((100 - $scope.percentage)/100);
   });
    
    $scope.save = function(){
      var senddata = {
        id: 1,
        percentage: $scope.percentage,
        decimal: $scope.decimal
      };
      $http.post('../admin/assumptionstarget',senddata)
	       .success(function(data){
                               $scope.percentage=data.assumptions.percentage;
                            });
    };
	})

  .controller('ApptodbCtrl',function($scope,$http){
		  
      $http.get('../admin/apptodb/1').success(function(data){
			$scope.application=data.application;
		});
     // $scope.decimal = 1+((100 - $scope.percentage)/100);
     $scope.$watch('application', function() {
       $scope.database = 1.0-$scope.application;
   });
    
    $scope.save = function(){
      var ratio = {
        id:1,
        application:$scope.application,
        database:$scope.database
      };
      $http.post('../admin/apptodb/',ratio)
	       .success(function(data){
                               $scope.application=data.application;
                            });
    };
	})

  .controller('ReqCtrl',function($scope,$http){
		  
      $http.get('../admin/vmware/1').success(function(data){
			$scope.require=data.req;
		});
     
    
    $scope.save = function(){
      
      $http.post('../admin/vmware/',$scope.require)
	       .success(function(data){
                               $scope.require=data.req;
                            });
    };
	})

  .controller('InfraCatCtrl',function($scope,$http,$upload){
		  
    $scope.fetch = function(){
      $http.get('../admin/infra.csv')
	       .success(function(data){
                               var hiddenElement = document.createElement('a');
                               hiddenElement.href = 'data:attachment/csv,' + encodeURI(data);
                               hiddenElement.target = '_blank';
                               hiddenElement.download = 'InfranstructureCatalog.csv';
                               hiddenElement.click();
                            });
     };

    $scope.send = function(){
      var file = $scope.files;
      $scope.upload = $upload.upload({
        url: '../admin/infrastructure/', // upload.php script, node.js route, or servlet url
        method: 'POST',
        //headers: {'Authorization': 'xxx'}, // only for html5
        //withCredentials: true,
        file: file // single file or a list of files. list is only for html5
        //fileName: 'doc.jpg' or ['1.jpg', '2.jpg', ...] // to modify the name of the file(s)
        //fileFormDataName: myFile, // file formData name ('Content-Disposition'), server side request form name
                                    // could be a list of names for multiple files (html5). Default is 'file'
        //formDataAppender: function(formData, key, val){}  // customize how data is added to the formData. 
                                                            // See #40#issuecomment-28612000 for sample code

      }).success(function(data, status, headers, config) {
        // file is uploaded successfully
        console.log('file ' + config.file.name + 'is uploaded successfully. Response: ' + data);
      });
      
    };
    
	})

  .controller('ServerListCtrl',function($scope,$http,$upload){
		  
    $scope.fetch = function(){
      
      $http.get('../admin/server.csv')
	       .success(function(data){
                               
                               var hiddenElement = document.createElement('a');
                               hiddenElement.href = 'data:attachment/csv,' + encodeURI(data);
                               hiddenElement.target = '_blank';
                               hiddenElement.download = 'ServerList.csv';
                               hiddenElement.click();
                            });
    };
    
    $scope.send = function(){
      var file = $scope.files;
      $scope.upload = $upload.upload({
        url: '../admin/servercomponent', // upload.php script, node.js route, or servlet url
        method: 'POST',
        //headers: {'Authorization': 'xxx'}, // only for html5
        //withCredentials: true,
        file: file // single file or a list of files. list is only for html5
        //fileName: 'doc.jpg' or ['1.jpg', '2.jpg', ...] // to modify the name of the file(s)
        //fileFormDataName: myFile, // file formData name ('Content-Disposition'), server side request form name
                                    // could be a list of names for multiple files (html5). Default is 'file'
        //formDataAppender: function(formData, key, val){}  // customize how data is added to the formData. 
                                                            // See #40#issuecomment-28612000 for sample code

      }).success(function(data, status, headers, config) {
        // file is uploaded successfully
        console.log('file ' + config.file.name + 'is uploaded successfully. Response: ' + data);
      });
      
    };
	})

  .controller('QsizerCtrl',function($scope,$http,$upload){
		  
    $scope.fetch = function(){
      
      $http.get('../admin/qsizer.csv')
	       .success(function(data){
                               
                               var hiddenElement = document.createElement('a');
                               hiddenElement.href = 'data:attachment/csv,' + encodeURI(data);
                               hiddenElement.target = '_blank';
                               hiddenElement.download = 'QuickSizer.csv';
                               hiddenElement.click();
                            });
    };
    
    $scope.send = function(){
      var file = $scope.files;
      $scope.upload = $upload.upload({
        url: '../admin/quicksizer/', // upload.php script, node.js route, or servlet url
        method: 'POST',
        //headers: {'Authorization': 'xxx'}, // only for html5
        //withCredentials: true,
        file: file // single file or a list of files. list is only for html5
        //fileName: 'doc.jpg' or ['1.jpg', '2.jpg', ...] // to modify the name of the file(s)
        //fileFormDataName: myFile, // file formData name ('Content-Disposition'), server side request form name
                                    // could be a list of names for multiple files (html5). Default is 'file'
        //formDataAppender: function(formData, key, val){}  // customize how data is added to the formData. 
                                                            // See #40#issuecomment-28612000 for sample code

      }).success(function(data, status, headers, config) {
        // file is uploaded successfully
        console.log('file ' + config.file.name + 'is uploaded successfully. Response: ' + data);
      });
      
    };
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

