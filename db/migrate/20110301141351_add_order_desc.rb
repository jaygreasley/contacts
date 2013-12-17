class AddOrderDesc < ActiveRecord::Migration
  def self.up
    add_column :orders, :Description, :string
  end

  def self.down
    remove_column :orders, :Description
  end
end
