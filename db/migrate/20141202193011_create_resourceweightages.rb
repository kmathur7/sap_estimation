class CreateResourceweightages < ActiveRecord::Migration
  def change
    create_table :resourceweightages do |t|

      t.integer :cpu
      t.integer :ram
      t.integer :nic
    end
  end
end
