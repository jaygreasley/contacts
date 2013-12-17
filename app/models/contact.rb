class Contact < ActiveRecord::Base

  before_save :setup_notes
       
  belongs_to :order_type
  belongs_to :order
  belongs_to :lead_status
    
  validates_presence_of :Surname
  validates_presence_of :DebtAmount
  validates_presence_of :Firstname
  validates_presence_of :PhoneNumber    
 
  def setup_notes
       t = Time.new.strftime("%a-%b-%d-%Y").to_s
       self.Notes = (self.Notes || "") + "\n" +  (self.NewNotes || "") + " ( " + self.lead_status.name +  " on  #{t} )" 
       self.NewNotes = ""
  end

  
  def todays
    self.where("created_at > ?", (Time.now.midnight - 1.day)).order("created_at DESC")
  end
  
end
