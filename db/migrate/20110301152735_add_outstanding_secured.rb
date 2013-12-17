class AddOutstandingSecured < ActiveRecord::Migration
  def self.up

     add_column :contacts, :OutstandingSecured, :string

  end

  def self.down
    remove_column :contacts, :OutstandingSecured
  end
end
