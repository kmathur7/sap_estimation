angular.module('Saps',['ui.router','angular-loading-bar','angularFileUpload','duScroll'])

  .config(function($stateProvider, $urlRouterProvider,$locationProvider) {
    $locationProvider.html5Mode(true).hashPrefix('!');
    $urlRouterProvider.otherwise('/');
    
    $stateProvider
        
        // HOME STATES AND NESTED VIEWS ========================================
        .state('/', {
            url: '/',
            templateUrl: '../templates/login.html',
            redirectTo: function(current, path, search){
          if(search.goto){
            // if we were passed in a search param, and it has a path
            // to redirect to, then redirect to that path
            return "/" + search.goto
          }
          else{
            // else just redirect back to this location
            // angular is smart enough to only do this once.
            return "/"
          }
        }
        })
        
        // ABOUT PAGE AND MULTIPLE NAMED VIEWS =================================
        .state('home', {
            url: '/home',
            templateUrl: '../templates/home.html',
          controller:'MainCtrl'
            // we'll get to this in a bit       
        });
    
        
  })
  .controller('MainCtrl',['$scope','$location','$anchorScroll','loginService',function($scope,$location,$anchorScroll,loginService){
    $scope.scrollTo = function(id) {
      $location.hash(id);
      $anchorScroll();
   };
    
   
    
  }])

  .controller('LoginController',['$scope','$http','loginService','$rootScope','$state',function($scope,$http,loginService,$rootScope,$state){
    $scope.login = function(){
       $http.post('../users/login',$scope.user).success(function(data)
    {
      loginService.setRole(data.login);
      console.log(data.login);
      $rootScope.$broadcast('loginsuccessful');
      console.log("broadcast");
      
    }).error(function (data, status, headers, config) {
        console.log("error");
        console.log(status);
});
    };
   
  }])

  .controller('NavController',['$scope','loginService',function($scope,loginService){
    
    
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
    
	
   
  }])
  

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
			maincatalog:"",
			product:"",
			platform:"",
			component:{
      
                }
		};

