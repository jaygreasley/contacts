class AddPasswords < ActiveRecord::Migration
  def self.up
    
    add_column :agents, :mouseClaimsID, :string
    add_column :agents, :mouseClaimsPwd, :string
        
  end

  def self.down
    
    remove_column :agents, :mouseClaimsID
    remove_column :agents, :mouseClaimsPwd
    
  end
end
