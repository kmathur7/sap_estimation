class CreateQuickSizers < ActiveRecord::Migration
  def change
    create_table :quick_sizers do |t|

      t.integer :catalog_id
      t.string :product
      t.string :platform
      t.integer :saps
      t.integer :memory
      t.integer :IO
      t.integer :IOPS
      t.integer :disksize
    end
  end
end
