angular.module('Saps').controller('DesignCtrl',['$scope','$http','$rootScope',function($scope,$http,$rootScope)
{
  $scope.selection = "Production";
  $scope.new_landscape=false;
   $scope.$on('settings',function(event)
  {
        $http.get('./landscape').success(function(data)
                                         {
			                                      $scope.landscapes=data.landscape;
		                                      });
        $http.get('../admin/design/Production').success(function(data)
                                         {
                                            $scope.design=data.design;
                                         });
	});
  
    
  $scope.fetch = function(landscape)
  {
    $scope.new_landscape=false;
    $scope.selection = landscape;
    $http.get('../admin/design/'+ landscape).success(function(data)
    {
      $scope.design=data.design;
    });
  };
    
  $scope.save = function()
  {
    $http.post('../admin/design',$scope.design).success(function(data)
    {  
      $scope.new_landscape=false;
      
      $scope.design=data.design;
      $scope.selection = data.design.landscape;
      
    });
  };
  
  $scope.savenew = function()
  {
    $http.post('../admin/designnew',$scope.newentry).success(function(data)
    {
      $scope.new_landscape=false;
      $scope.design=data.design;
      $rootScope.$broadcast('newlandscape');
      $http.get('./landscape').success(function(data)
                                         {
			                                      $scope.landscapes=data.landscape;
		                                      });
    });
  };
  $scope.entry = function()
  {
    $scope.new_landscape = true;  
    $scope.selection = "landscape";
  };
  
  $scope.delete = function()
  {
    $http.delete('./admin/deldesign/'+$scope.design.id).success(function(data)
                                         {
                                            $scope.selection = "Production";
                                             $rootScope.$broadcast('newlandscape');
			                                      $http.get('./landscape').success(function(data)
                                             {
			                                          $scope.landscapes=data.landscape;
		                                         });
                                            $http.get('../admin/design/Production').success(function(data)
                                             {
                                            $scope.design=data.design;
                                             });
		                                      });
  };
  
  
    
}]);