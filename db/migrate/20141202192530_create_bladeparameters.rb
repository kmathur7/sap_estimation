class CreateBladeparameters < ActiveRecord::Migration
  def change
    create_table :bladeparameters do |t|

      t.integer :pcore
      t.integer :pram
      t.integer :pnic
    end
  end
end
