class CatalogController < ApplicationController
  
  def index
    @catalogs = Catalog.all
  end
end
