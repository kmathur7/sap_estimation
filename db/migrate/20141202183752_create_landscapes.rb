class CreateLandscapes < ActiveRecord::Migration
  def change
    create_table :landscapes do |t|
      t.string :name
      
    end
  end
end
