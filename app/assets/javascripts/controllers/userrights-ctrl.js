angular.module('Saps').controller('UserRightsController',['$scope','$http',function($scope,$http)
{
  $http.get('../admin/users').success(function(data)
  {
    $scope.users=data.users;
  });
  
  $scope.fetchUser = function(user)
  {
    $scope.selection = user;
    $http.get('../admin/users/'+user).success(function(data)
  {
    $scope.userinfo=data.userdata[0];
  });
  };
    
  
}]);