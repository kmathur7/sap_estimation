angular.module('Saps').controller('LoginController',['$scope','$http','loginService','$rootScope','$state',function($scope,$http,loginService,$rootScope,$state){
    $scope.incorrect_password=false;
    $scope.close = function(){
      $scope.incorrect_password=false;
    };
      $scope.login = function()
      {
       $http.post('../users/login',$scope.user).success(function(data)
            {
                loginService.setRole(data.login);
                 $rootScope.$broadcast('loginsuccessful');
            }).error(function (data, status, headers, config)
            {
                $scope.incorrect_password=true;
            });
      };
   
  }]);