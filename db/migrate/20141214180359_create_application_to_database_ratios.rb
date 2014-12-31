class CreateApplicationToDatabaseRatios < ActiveRecord::Migration
  def change
    create_table :application_to_database_ratios do |t|

      t.decimal :application, :precision => 15, :scale => 2
      t.decimal :database, :precision => 15, :scale => 2
    end
  end
end
