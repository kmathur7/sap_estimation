class CreateBladeparameters < ActiveRecord::Migration
  def change
    create_table :bladeparameters do |t|

      t.integer :pCore
      t.integer :pRAM
      t.integer :pNIC
    end
  end
end
