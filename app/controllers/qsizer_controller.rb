class QsizerController < ApplicationController
  def show
    @data = QuickSizer.where("catalog=?",params[:id]).pluck(:product) 
  end
end
