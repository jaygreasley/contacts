class ChangeConfirmedAsStrugglingToBool < ActiveRecord::Migration
  def self.up
    change_column :contacts, :CustomerConfirmedAsStruggling, :boolean
  end

  def self.down
    change_column :contacts, :CustomerConfirmedAsStruggling, :boolean
  end
end
