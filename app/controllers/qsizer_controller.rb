class QsizerController < ApplicationController
  def show
    @product = QuickSizer.where("catalog=?",params[:id]).pluck(:product) 
  end
  
  def platforms
    @platform = QuickSizer.where("catalog=? AND product=?",params[:id],params[:product]).pluck(:platform)
  end
end
