class CreateResourceweightages < ActiveRecord::Migration
  def change
    create_table :resourceweightages do |t|

      t.integer :CPU
      t.integer :RAM
      t.integer :NIC
    end
  end
end
