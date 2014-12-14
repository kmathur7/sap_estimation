class CreateQuickSizers < ActiveRecord::Migration
  def change
    create_table :quick_sizers do |t|

      
      t.string :product
      t.string :platform
      t.integer :saps
      t.integer :memory
      t.integer :io
      t.integer :iops
      t.integer :disksize
    end
  end
end
