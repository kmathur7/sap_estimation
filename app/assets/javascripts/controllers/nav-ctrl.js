angular.module('Saps').controller('NavController',['$scope','loginService','$rootScope',function($scope,loginService,$rootScope){
    
    
    var role = loginService.getRole();
    if(role=="admin"){
     $scope.settings=true; 
      console.log($scope.settings);
    }
    else
      {
        $scope.settings=false;
        console.log($scope.settings);
      };
    
    $scope.logout = function(){
      $scope.settings=false;
      loginService.logout();
    };
    
    $scope.fetchsettings = function(){
      $rootScope.$broadcast('settings');
    };
    
	
   
  }]);