class CreateDesignrationales < ActiveRecord::Migration
  def change
    create_table :designrationales do |t|
      t.string :landscape
      t.integer :pCore
      t.integer :pRAM
      t.integer :pNIC
      
    end
  end
end
