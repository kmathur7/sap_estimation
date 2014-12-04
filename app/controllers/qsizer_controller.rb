class QsizerController < ApplicationController
  def show
    @data = QuickSizer.where("catalog_id=?",1).pluck(:product) 
  end
end
