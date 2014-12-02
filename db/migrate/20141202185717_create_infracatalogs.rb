class CreateInfracatalogs < ActiveRecord::Migration
  def change
    create_table :infracatalogs do |t|

      t.string :catalog
      t.string :subcatalog
      t.integer :vCPU
      t.integer :vRAM
      t.integer :vNIC
    end
  end
end
