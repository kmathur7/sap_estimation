class QsizerController < ApplicationController
  def show
    @product = QuickSizer.where("catalog=?",params[:id]).pluck(:product) 
  end
  
  def platforms
    @platform = QuickSizer.where("catalog=? AND product=?",params[:catalog],params[:product]).pluck(:platform)
  end
  
  def components
    @components = Component.where("product=? AND platform=?",params[:product],params[:platform]).pluck(:servername)
  end
  
  def create
    @a = params[:component]
  end
end
