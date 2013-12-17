class AddContactStatus < ActiveRecord::Migration
  def self.up
    add_column :contacts, :status, :string
  end

  def self.down
    remove_column :contacts, :status
  end
end
