angular.module('Saps').factory('dataService',[function()
{
  var calculation;
  return {
      setData : function(calculate)
      {
        calculation=calculate;
      },
      getCalculation : function()
      {
        return calculation;
      }
    };
}]);