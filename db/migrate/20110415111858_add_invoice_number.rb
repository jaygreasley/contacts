class AddInvoiceNumber < ActiveRecord::Migration
  def self.up
    add_column :orders, :Invoice_number, :string
    
  end

  def self.down
    
    remove_column :orders, :Invoice_number


  end
end
