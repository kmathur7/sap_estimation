angular.module('Saps').controller('ResultsCtrl',['$scope','$http','resultService','$rootScope',function($scope,$http,resultService,$rootScope)
{
    var pdfdatacontent = [];
    
    $scope.$on('resultData',function(event)
    {
      $scope.results=resultService.getResult();
      pdfdatacontent = resultService.getPdfData();
       
    });
  
    $scope.reset = function()
    {
      $('#collapseOne').collapse('show');
      $('#collapseTwo').collapse('hide');
      $('#collapseThree').collapse('hide');
      $('#collapseFour').collapse('hide');
      $('#collapseFive').collapse('hide');
    $rootScope.$broadcast('reset');
    $scope.results={};
    pdfdatacontent=[];
    };
  
    $scope.print = function(){
      var results = $scope.results;
      var temp;
      var body = [];
      var heading = new Array();
                      heading.push("Landscape");
                      heading.push("Product");
                      heading.push("Platform");
                      heading.push("Components");
                      heading.push("vCPU");
                      heading.push("vRAM");
                      heading.push("NET IO");
                      heading.push("IOPS");
                      heading.push("vDisk");             
                      heading.push("Catalog");
                      heading.push("Customization");
        body.push(heading);
      pdfdatacontent.forEach(function(element, index, array)
          {    var i = 0;
               element.forEach(function(elem, index, array)
                   {
                      
                      temp = elem;
                      var fila = new Array();
                     if(i<=0){
                       fila.push( temp.landscape );
                       fila.push( temp.product);
                       fila.push( temp.platform);
                     }
                     else{
                       fila.push("");
                       fila.push("");
                       fila.push("");
                     }
                      fila.push( temp.server);
                      fila.push( temp.vcpu.toString());
                      fila.push( temp.vram.toString());
                      fila.push( temp.netio.toString());
                      fila.push( temp.iops.toString());
                      fila.push( temp.vdisk.toString());             
                      fila.push( temp.catalog  );
                      fila.push( temp.type);
                      body.push(fila);
                     i++;
                   });
              
       });
    

      
      var dd = {
        pageOrientation: 'landscape',
    content: [
        { text: 'SAP Integrated Programmable Model', style: 'heading' },
        { text: 'Analytics', style: 'header' },
        {
            table: 
            {
                headerRows: 1,
                body: body
                  
            },
          layout: 'headerLineOnly'
          
        },
        { text: 'Results', style: 'results' },
        {
            table: {
								    body: [
										        ['Total No. Of Physical Servers for Virtualization',results.total_physical_server_for_virtualization.toString()],
										        ['Include Failover Capacity',results.include_failover_capacity.toString()],
                            ['No of Physical Servers Opted',results.no_physical_servers_opted.toString()],
                            ['Total Physical Servers',results.total_physical_servers.toString()]
								          ]
						       }
        }
    ],
        styles:{
          header: {
			              fontSize: 18,
			              bold: true,
                    margin: [0,0,0,20]
		      },
          heading: {
			              fontSize: 22,
			              bold: true,
                    margin: [0,0,0,20]
		      },
          results: {
			              fontSize: 18,
			              bold: true,
                    margin: [0,20,0,20]
		      }
        }
};
      
      pdfMake.createPdf(dd).open();
      
      
      
      
      
      
      
     };
  
}]);