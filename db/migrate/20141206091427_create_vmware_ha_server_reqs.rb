class CreateVmwareHaServerReqs < ActiveRecord::Migration
  def change
    create_table :vmware_ha_server_reqs do |t|

      t.integer :protected
      t.integer :failover
    end
  end
end
