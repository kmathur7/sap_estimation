class LandscapeController < ApplicationController
  
  
  def index
    @landscapes = Landscape.all
  end

end
