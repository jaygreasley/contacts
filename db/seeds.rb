# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

role = Role.create(:name => 'client')
role = Role.create(:name => 'agent')
role = Role.create(:name => 'qc')
role = Role.create(:name => 'manager')

me = User.create(:email => 'jay@crystallogix.com', :password => 'SW920s%L', :company => 'Crystal' )
role = Role.create(:name => 'super_admin')
me.roles = [role]
me.save


iva = OrderType.create(:name => 'IVA')
dm = OrderType.create(:name => 'DM')
ldm = OrderType.create(:name => 'Low DM')
hdm = OrderType.create(:name => 'High DM')


title1 = Title.create(:name => 'Mr')
title2 = Title.create(:name => 'Mrs')
title3 = Title.create(:name => 'Miss')
title4 = Title.create(:name => 'Ms')

leadStatus1 = LeadStatus.create(:name => 'Generated')
leadStatus2 = LeadStatus.create(:name => 'Replacement requested')
leadStatus3 = LeadStatus.create(:name => 'Replacement request - Rejected')
leadStatus4 = LeadStatus.create(:name => 'Replacement request - Accepted')
leadStatus5 = LeadStatus.create(:name => 'Cutoff requested')
leadStatus6 = LeadStatus.create(:name => 'Cutoff request - Accepted')
leadStatus7 = LeadStatus.create(:name => 'Cutoff request - Rejected')

orderStatus1 = OrderStatus.create(:name => 'New')
orderStatus2 = OrderStatus.create(:name => 'Live')
orderStatus3 = OrderStatus.create(:name => 'Finished')

employmentType1 = EmploymentType.create(:name => 'Employed')
employmentType2 = EmploymentType.create(:name => 'Self-Employed')
employmentType3 = EmploymentType.create(:name => 'Unemployed')
employmentType4 = EmploymentType.create(:name => 'Retired')
