class CreateApplicationToDatabaseRatios < ActiveRecord::Migration
  def change
    create_table :application_to_database_ratios do |t|

      t.decimal :application
      t.decimal :database
    end
  end
end
