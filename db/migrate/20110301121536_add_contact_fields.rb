class AddContactFields < ActiveRecord::Migration
  def self.up
    
    add_column :contacts, :MDI, :string
    add_column :contacts, :Employment, :string
    add_column :contacts, :HomeownerOrTenant, :string
    add_column :contacts, :PropertyValue, :string
    add_column :contacts, :OutstandingMortgage, :string
    
    
  end

  def self.down
    
     remove_column :contacts, :MDI
     remove_column :contacts, :Employment
     remove_column :contacts, :HomeownerOrTenant
     remove_column :contacts, :PropertyValue
     remove_column :contacts, :OutstandingMortgage

      
  end
end
