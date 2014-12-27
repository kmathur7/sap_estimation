angular.module('Saps',['ui.router','angular-loading-bar','angularFileUpload','duScroll'])

  .config(['$stateProvider','$urlRouterProvider','$locationProvider',function($stateProvider, $urlRouterProvider,$locationProvider) {
    $locationProvider.html5Mode(true).hashPrefix('!');
    $urlRouterProvider.otherwise('/');
    
    $stateProvider
        .state('/', {
            url: '/',
            templateUrl: '../templates/login.html',
            redirectTo: function(current, path, search){
          if(search.goto){
           return "/" + search.goto
          }
          else{
            return "/"
          }
        }
        })
        .state('home', {
            url: '/home',
            templateUrl: '../templates/home.html',
             
        });
    
        
  }])
  
.directive('upVote',[ function(){
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
  }]);
var selection={
			landscape:"",
			maincatalog:"",
			product:"",
			platform:"",
			component:{
      
                }
		};

