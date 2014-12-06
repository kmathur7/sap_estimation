class CreateAssumptionsAtTargets < ActiveRecord::Migration
  def change
    create_table :assumptions_at_targets do |t|

      t.string :name
      t.integer :percentage
      t.decimal :decimal 
    end
  end
end
