class CreateInfracatalogs < ActiveRecord::Migration
  def change
    create_table :infracatalogs do |t|

      t.string :catalog
      t.string :subcatalog
      t.integer :vcpu
      t.integer :vram
      t.integer :vnic
    end
  end
end
