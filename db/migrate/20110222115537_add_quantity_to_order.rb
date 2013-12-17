class AddQuantityToOrder < ActiveRecord::Migration
  def self.up
    
    add_column :orders, :quantity, :string
  end

  def self.down
    
    #remove_column :orders, :quantity
    
  end
end


