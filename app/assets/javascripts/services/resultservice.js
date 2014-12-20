angular.module('Saps').factory('resultService',function()
{
    var result;
    return {
      setResult : function(data)
      {
        result=data;
      },
      getResult : function()
      {
        return result;
      }
    };
});