class AdminController < ApplicationController
  #Action to fetch Resource Weightage Values
  def getresource
    @resource = Resourceweightage.find(1)
  end
  
  def setresource
    @resource = Resourceweightage.update(params[:id],:cpu => params[:cpu], :ram => params[:ram], :nic => params[:nic])
    
  end
  
  #Action to fetch Parameters pe Blade Values
  def getparametersperblade
    @parameters = Bladeparameter.find(1)
  end
  
  def setparametersperblade
    @parameters = Bladeparameter.update(params[:id],:pcore => params[:pcore], :pram => params[:pram], :pnic => params[:pnic])
  end
  
  def getassumptionstarget
    @assumptions = AssumptionsAtTarget.where("id=?",1).pluck(:percentage).join(" ").to_i
  end
  def setassumptionstarget
    @assumptions = AssumptionsAtTarget.update(params[:id], :percentage => params[:percentage], :decimal => params[:decimal])
  end
  
  
  def getdesignrationale
    @design = Designrationale.where("landscape=?",params[:landscape]).limit(1).first
  end
  
  def setdesignrationale
    @design = Designrationale.update(params[:id],:pcore => params[:pcore], :pram => params[:pram], :pnic => params[:pnic])
  end
end
