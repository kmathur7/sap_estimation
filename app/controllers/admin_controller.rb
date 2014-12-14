class AdminController < ApplicationController
  #Action to fetch Resource Weightage Values
  def getresource
    @resource = Resourceweightage.find(1)
  end
  #Action to set Resource Weightage Values
  def setresource
    @resource = Resourceweightage.update(params[:id],:cpu => params[:cpu], :ram => params[:ram], :nic => params[:nic])
    
  end
  
  #Action to fetch Parameters per Blade Values
  def getparametersperblade
    @parameters = Bladeparameter.find(1)
  end
  #Action to set Parameters per Blade Values
  def setparametersperblade
    @parameters = Bladeparameter.update(params[:id],:pcore => params[:pcore], :pram => params[:pram], :pnic => params[:pnic])
  end
  #Action to fetch Assumptions at Target Values
  def getassumptionstarget
    @assumptions = AssumptionsAtTarget.where("id=?",1).pluck(:percentage).join(" ").to_i
  end
  #Action to set Assumptions at Target Values
  def setassumptionstarget
    @assumptions = AssumptionsAtTarget.update(params[:id], :percentage => params[:percentage], :decimal => params[:decimal])
  end
  
  #Action to fetch Design Rationale Values based on landscape
  def getdesignrationale
    @design = Designrationale.where("landscape=?",params[:landscape]).limit(1).first
  end
  #Action to set Design Rationale Values
  def setdesignrationale
    @design = Designrationale.update(params[:id],:pcore => params[:pcore], :pram => params[:pram], :pnic => params[:pnic])
  end
  
  #Action to fetch Application to Database Values
  def getapptodb
    @apptodb = ApplicationToDatabaseRatio.find(1)
  end
  #Action to set Application to Database Values
  def setapptodb
    @apptodb = ApplicationToDatabaseRatio.update(params[:id],:application => params[:application], :database => params[:database])
  end
  
  #Action to fetch VMware HA Server Requirement Values
  def getvmhaserverreqq
    @requirement = VmwareHaServerReq.find(1)
  end
  
  #Action to set VMware HA Server Requirement Values
  def setvmhaserverreqq
    @requirement = VmwareHaServerReq.update(params[:id],:protected => params[:protected], :failover => params[:failover])
  end
end
