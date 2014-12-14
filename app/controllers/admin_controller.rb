class AdminController < ApplicationController
  #Action to fetch Resource Weightage Values
  def getresource
    @resource = Resourceweightage.find(1)
  end
  
  #Action to fetch Parameters pe Blade Values
  def getparametersperblade
    @parameters = Bladeparameter.find(1)
  end
  
  def getassumptionstarget
    @assumptions = AssumptionsAtTarget.where("id=?",1).pluck(:percentage).join(" ").to_i
  end
  def getdesignrationale
    @design = Designrationale.where("landscape=?",params[:landscape]).limit(1).first
  end
end
