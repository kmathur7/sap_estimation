angular.module('Saps').controller('InfraCatCtrl',['$scope','$http','$upload',function($scope,$http,$upload)
{
  $scope.fetch = function()
  {
    $http.get('../admin/infra.csv').success(function(data)
    {
      var hiddenElement = document.createElement('a');
      hiddenElement.href = 'data:attachment/csv,' + encodeURI(data);
      hiddenElement.target = '_blank';
      hiddenElement.download = 'InfranstructureCatalog.csv';
      hiddenElement.click();
    });
  };

  $scope.send = function()
  {
    var file = $scope.files;
    $scope.upload = $upload.upload({
        url: '../admin/infrastructure/',
        method: 'POST',
        file: file
    }).success(function(data, status, headers, config)
      {
        console.log('file ' + config.file.name + 'is uploaded successfully. Response: ' + data);
      });
      
  };
    
}]);