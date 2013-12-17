# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110415111858) do

  create_table "agents", :force => true do |t|
    t.string   "name"
    t.string   "extension"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mouseClaimsID"
    t.string   "mouseClaimsPwd"
  end

  create_table "cars", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.string   "Title"
    t.string   "Firstname"
    t.string   "Surname"
    t.string   "Age"
    t.string   "PhoneNumber"
    t.string   "DoorNumber"
    t.string   "Street"
    t.string   "Postcode"
    t.string   "incomePCM"
    t.string   "RentOrMortgage"
    t.string   "Gas"
    t.string   "Electric"
    t.string   "Water"
    t.string   "CouncilTax"
    t.string   "Other"
    t.integer  "DebtAmount"
    t.integer  "PayingPerMonth"
    t.integer  "TotalCreditors"
    t.string   "Creditor1Name"
    t.integer  "Creditor1Debt"
    t.string   "Creditor2Name"
    t.integer  "Creditor2Debt"
    t.string   "Creditor3Name"
    t.integer  "Creditor3Debt"
    t.boolean  "InAdebtPlan"
    t.string   "DebtPlanCompany"
    t.boolean  "CustomerConfirmedAsStruggling"
    t.boolean  "AgentCompletedRecap"
    t.string   "AgentName"
    t.integer  "order_type_id"
    t.integer  "order_id"
    t.integer  "lead_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "MDI"
    t.string   "Employment"
    t.string   "HomeownerOrTenant"
    t.string   "PropertyValue"
    t.string   "OutstandingMortgage"
    t.string   "OutstandingSecured"
    t.string   "status"
    t.string   "Notes"
    t.string   "NewNotes"
  end

  create_table "employment_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lead_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.string   "company"
    t.string   "status"
    t.integer  "order_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "quantity"
    t.string   "Description"
    t.string   "Invoice_number"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "titles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company"
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
