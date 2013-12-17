class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :Title
      t.string :Firstname
      t.string :Surname
      t.string :Age
      t.string :PhoneNumber
      t.string :DoorNumber
      t.string :Street
      t.string :Postcode
      t.string :incomePCM
      t.string :RentOrMortgage
      t.string :Gas
      t.string :Electric
      t.string :Water
      t.string :CouncilTax
      t.string :Other
      t.integer :DebtAmount
      t.integer :PayingPerMonth
      t.integer :TotalCreditors
      t.string :Creditor1Name
      t.integer :Creditor1Debt
      t.string :Creditor2Name
      t.integer :Creditor2Debt
      t.string :Creditor3Name
      t.integer :Creditor3Debt
      t.boolean :InAdebtPlan
      t.string :DebtPlanCompany
      t.boolean :CustomerConfirmedAsStruggling
      t.boolean :AgentCompletedRecap
      t.string :AgentName
      t.references :order_type
      t.references :order
      t.references :lead_status
      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
