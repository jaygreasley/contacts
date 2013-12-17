class AddNewNotesToContact < ActiveRecord::Migration
  def self.up
    
    add_column :contacts, :NewNotes, :string
    
  end

  def self.down
    
    remove_column :contacts, :NewNotes
    
  end
end
