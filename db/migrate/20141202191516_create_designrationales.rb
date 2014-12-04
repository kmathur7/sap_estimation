class CreateDesignrationales < ActiveRecord::Migration
  def change
    create_table :designrationales do |t|
      t.string :landscape
      t.integer :pcore
      t.integer :pram
      t.integer :pnic
      
    end
  end
end
