class CreateAssumptionsAtTargets < ActiveRecord::Migration
  def change
    create_table :assumptions_at_targets do |t|

      t.integer :percentage
      t.decimal :decimal, :precision => 15, :scale => 2 
    end
  end
end
