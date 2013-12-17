class AddNotesForContact < ActiveRecord::Migration
  def self.up
    
    add_column :contacts, :Notes, :string
    
  end

  def self.down
    
    remove_column :contacts, :Notes
    
  end
end
