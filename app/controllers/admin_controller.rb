class AdminController < ApplicationController
  # Action to fetch Resource Weightage Values for the Admin Console
  def getresource
    @resource = Resourceweightage.find(1)
  end
  # Action to set Resource Weightage Values changed in the Admin Console
  def setresource
    @resource = Resourceweightage.update(params[:id],:cpu => params[:cpu], :ram => params[:ram], :nic => params[:nic])
    
  end
  
  # Action to fetch Parameters per Blade Values in the Admin Console
  def getparametersperblade
    @parameters = Bladeparameter.find(1)
  end
  # Action to set Parameters per Blade Values changed in the Admin Console
  def setparametersperblade
    @parameters = Bladeparameter.update(params[:id],:pcore => params[:pcore], :pram => params[:pram], :pnic => params[:pnic])
  end
  # Action to fetch Assumptions at Target Values for the Admin Console
  def getassumptionstarget
    @assumptions = AssumptionsAtTarget.where("id=?",1).pluck(:percentage).join(" ").to_i
  end
  # Action to set Assumptions at Target Values changed in the Admin Console
  def setassumptionstarget
    @assumptions = AssumptionsAtTarget.update(params[:id], :percentage => params[:percentage], :decimal => params[:decimal])
  end
  
  # Action to fetch Design Rationale Values based on landscape in the Admin Console
  def getdesignrationale
    @design = Designrationale.where("landscape=?",params[:landscape]).limit(1).first
  end
  # Action to set Design Rationale Values 
  def setdesignrationale
    @design = Designrationale.update(params[:id],:pcore => params[:pcore], :pram => params[:pram], :pnic => params[:pnic])
  end
  
  # Action to fetch Application to Database Ratio Values
  def getapptodb
    @apptodb = ApplicationToDatabaseRatio.find(1)
  end
  #Action to update Application to Database Values
  def setapptodb
    @apptodb = ApplicationToDatabaseRatio.update(params[:id],:application => params[:application], :database => params[:database])
  end
  
  # Action to fetch VMware HA Server Requirement Values
  def getvmhaserverreqq
    @requirement = VmwareHaServerReq.find(1)
  end
  
  # Action to set VMware HA Server Requirement Values
  def setvmhaserverreqq
    @requirement = VmwareHaServerReq.update(params[:id],:protected => params[:protected], :failover => params[:failover])
  end
  
  # Action to download Infrastructure Catalog values in CSV format
  def getinfracatlogvalues
    
    @infra = Infracatalog.all
    respond_to do |format|
    format.html
    format.csv { send_data @infra.as_csv }
    end
  end
  
  # Action to upload and replace the Infrastructure Catalog values
  def setinfracatlogvalues
    Infracatalog.import(params[:file].path)
    
  end
  
  # Action to download Quick Sizer table values in CSV format
  def getquicksizervalues
    @quicksizer = QuickSizer.all
    respond_to do |format|
    format.html
    format.csv { send_data @quicksizer.as_csv }
    end
  end
  
  # Action to upload and replace the Quick Sizer values
  def setquicksizervalues
    QuickSizer.import(params[:file].path)
  end
  
  # Action to download Server Component values in CSV format
  def getservervalues
    @component = Component.all
    respond_to do |format|
    format.html
      format.csv { send_data @component.as_csv }
    end
  end
  
  # Action to upload and replace the Quick Sizer values
  def setservervalues
    Component.import(params[:file].path)
  end
  
end
