angular.module('Saps').factory('resultService',[function()
{
    var result;
    var pdfdata;
    return {
      setResult : function(data)
      {
        result=data;
      },
      getResult : function()
      {
        return result;
      },
      setPdfData : function(pdfcontent)
      {
        pdfdata=pdfcontent;
      },
      getPdfData : function()
      {
        return pdfdata;
      }
    };
}]);